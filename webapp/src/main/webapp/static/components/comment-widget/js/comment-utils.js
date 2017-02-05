var CommentUtils = {
    // Адрес API
    API_URL: '/nkbcomment/api',

    // Данный объект будет определён позже
    USER_INFO: {},

    // Локализация
    Messages: {
        binarySizes: [ ',', '--', 'Байт', 'КБ', 'МБ', 'ГБ', 'ТБ' ],
        errorUploadFile: 'Ошибка отправки файла',
        errorDownloadFile: 'Ошибка скачивания файла',
        confirm: {
            'delete.comment': 'Удалить комментарий?',
            'delete.file': 'Удалить файл?'
        }
    },

    Tags: [
        'Опыт сотрудничества',
        'Репутация',
        'Платежеспособность',
        'Мошенничество',
        'Криминал'
    ],

    hasError: function(result) {
        return result.error ? true : false;
    },

    getServerErrorMessage: function(response) {
        var r;

        if (_.isString(response)) {
            r = $.parseJSON(response);
        } else {
            r = response;
        }

        if (r && r.error && r.error.message) {
            return r.error.message;
        }

        return null;
    },

    getRequestErrorMessage: function(xhr) {
        return xhr.status + ' ' + xhr.statusText + ' ' + xhr.responseText;
    },

    formatRequestErrorMessage: function(xhr) {
        var s = CommentUtils.getServerErrorMessage(xhr.responseText);
        if (s != null) {
            return s;
        }
        return 'Ошибка: ' + xhr.status + ' ' + xhr.statusText + '<br>' + xhr.responseText;
    },

    loadTemplates: function(url) {
        var templates = '';
        $.ajax({
            url: "/nkbcomment/"+url,
            async: false,
            success: function(data){
                templates = data;
            },
            error: function(jqXHR, textStatus, errorThrown){
                throw 'Templates load error: ' + errorThrown;
            }
        });
        return templates;
    },

    getFileNameExtension: function(fileName) {
        var m = /\.([^\.]+)$/.exec(fileName);
        return (m ? m[0] : undefined);
    },

    normalizeFileName: function(fileName) {
        return fileName.replace(/[\.\s?]+$/, '');
    },

    hasUserPermission: function(permission) {
        return ($.inArray(permission, CommentUtils.USER_INFO.permissions) != -1);
    },

    hasCommentPermission: function(comment, permission) {
        return ($.inArray(permission, comment.permissions) != -1);
    },


    /*
     * Скачивание файла методом GET с поддержкой ответов сервера в формате JSON (REST-API/JSON).
     *
     * $.fileDownload(options)
     *
     * options: {
     *      //
     *      url: String,
     *
     *      // Будет вызвано при ответе сервера в случае не скачивания файла.
     *      // response: ответ сервера в формате JSON, может равняться null|undefined если возникли ошибки необработанные API.
     *      responseCallback: function(response){}
     * }
     */
    downloadFile: function(options){
        if (!options.url) {
            throw 'options.url is required';
        }

        $.fileDownload(options.url, {
            httpMethod : "GET",
            failCallback: function(htmlResponse){
                if ($.isFunction(options.responseCallback)) {
                    var response = $.parseJSON($(htmlResponse).text());
                    options.responseCallback.call(this, response);
                }
            }
        });
    },

    /*
     * Скачивание файла методом GET через iframe с поддержкой ответов сервера в формате JSON (REST-API/JSON).
     *
     * $.fileDownload(options)
     *
     * options: {
     *      // Все параметры URL будут удалены.
     *      // Если полученное из URL расширение скачиваемого файла .exe|.dll,
     *      // то к URL добавится параметр '_ext=<ext>'.
     *      // Данный параметр вводится для исправления ошибки присвоения имени файла при скачивании в IE.
     *      url: String,
     *
     *      // Будет вызвано при ответе сервера в случае не скачивания файла.
     *      // response: ответ сервера в формате JSON, может равняться null|undefined если возникли ошибки необработанные API.
     *      responseCallback: function(response){}
     * }
     */
    // @Deprecated
    downloadFile_old: function(options){
        if (!options.url) {
            throw 'options.url is required';
        }

        var url = options.url.replace(/\?[\s\S]*$/, '');

        var param = [];

        // IE fix
        var ext = CommentUtils.getFileNameExtension(url);
        if (ext == '.exe' || ext == '.dll') {
            param.push({
                name: '_ext',
                value: ext
            });
        }

        $.ajax({
            url: url,
            dataType: 'iframe json',
            formData: param,
            success: function(response){
                complete(response);
            },
            error: function(){
                complete(null);
            }
        });

        function complete(response) {
            if ($.isFunction(options.responseCallback)) {
                options.responseCallback.call(this, response);
            }
        };
    },

    humanizeBinarySize: function(bytes, precision) {
        var binarySizes = CommentUtils.Messages.binarySizes;

        if (!_.isNumber(bytes) || bytes <= 0) {
            return binarySizes[1];
        }
        var i = 2;
        while (bytes >= 1024) {
            i++;
            bytes = bytes/1024;
        }
        return bytes.toFixed(precision).replace(/\.0+$/, '').replace('.', binarySizes[0]) + ' ' + binarySizes[i];
    },

    setupWidget: function(ticketCookie, successCallback, showErrorCallback) {
        //
        // Установить авторизационную cookie для корневого пути,
        // чтобы была возможность использовать API виджета из любой
        // страницы сайта.
        //
        // Пример: страница сайта example.com/search/
        // адрес API: example.com/comments/api/
        //
        // Не устанавливать опцию {domain: location.hostname},
        // т.к. это не работает с localhost в Chrome
        // (Chrome требует {domain: null} или {domain: ''}) и вообще не имеет
        // смысла, т.к. браузер сам установит правильный домен для куки.
        //
        var cookieOpts = {path: '/'};

        $.cookie("creditnet_comments_ticket", null, cookieOpts);
        showErrorCallback = showErrorCallback || function(){};
        var ticket = $.cookie(ticketCookie);
        if (ticket) {
            $.cookie('creditnet_comments_ticket', ticket, cookieOpts);
            $.get(CommentUtils.API_URL + '/users/me/info.json', function(data) {
                CommentUtils.USER_INFO = data;
                successCallback();
            }).error(function(jqXHR, textStatus, errorThrown) {
                CommentUtils.USER_INFO = {};
                showErrorCallback('Ошибка получения информации о пользователе');
            });
        } else {
            CommentUtils.USER_INFO = {};
            showErrorCallback('Пользователь не аутентифицирован');
        }
    },

    setupButton: function(options) {
        options = options || {
            button: '<span class="btn">К</span>'
        };
        //
        // <span class="creditnet-comments-hook"
        //                            data-post-id="companyShortName"
        //                            data-title="ООО &quot;РУССКИЕ ПРОДУКТЫ ТОРГОВЫЙ КОМПЛЕКС&quot;"
        //                            ></span>
        //
        // 'creditnet_backend_ticket' для бэка, т.е. для панели модерации
        // 'creditnet_ticket' для фронта, т.е. для виджета комментариев
        CommentUtils.setupWidget('creditnet_ticket', function() {

            if (CommentUtils.hasUserPermission('VIEW')) {
                var hooks = $('.creditnet-comments-hook');
                if (!hooks.length) {
                    return;
                }
                var postIds = hooks.map(function() {
                    return $(this).data('post-id');
                }).get();

                $.getJSON(
                    CommentWidgetSettings.apiUrl + '/comments/by-post/info.json',
                    $.param({postId: postIds}, true),
                    function(data) {
                        data = data || [];
                        var counters = {};
                        $.each(data, function(i, e) {
                            counters[e.postId] = e.commentCount;
                        });
                        var commentWidget = initializeWidget(hooks, counters, options);
                        if (_.isFunction(options.callback)) {
                            options.callback(commentWidget);
                        }
                    }
                );
            }
        });

        function initializeWidget(hooks, counters, options){
            // Создать виджет комментариев
            var commentWidget = new CommentWidget({
                onChange: function(data){
                    var b = hooks.filter('[data-post-id="' + data.postId + '"]').next();
                    var c = b.children('.counter');
                    if (data.commentCount > 0) {
                        b.removeClass('empty');
                        c.text(data.commentCount);
                    } else {
                        b.addClass('empty');
                    }
                }
            });

            hooks.each(function() {
                var hook = $(this);
                var postId = hook.data('post-id');

                var cnt, cls = '';
                if (counters[postId]) {
                    cnt = '<span class="counter">' + counters[postId] + '</span>';
                } else {
                    cnt = '<span class="counter"></span>';
                    cls = 'empty';
                }
                var b = $('<span class="comment-btn ' + cls + '">' + options.button + cnt + '</span>');

                b.click(function(){
                    var $this = $(this);
                    var title = hook.data('title');

                    if (commentWidget.isShow(postId)) {
                        commentWidget.hide();
                    } else {
                        var offset = $this.offset();
                        commentWidget.show(offset.left, offset.top + $this.height() + 3, postId, {title: title});
                    }
                });
                b.insertAfter(hook);
            });

            return commentWidget;
        }
    },

    formatContent: function(content) {
        var result = content;
        result = CommentUtils._highlightUrls(result, _.escape);
        result = result.replace(/\r?\n/gm, '<br>');
        return result;
    },

    _highlightUrls: function(text, escape) {
        escape = escape || function(s) {
            return s;
        };
        //
        // URL может содержать скобки, но не в конце.
        // Для упрощения, вообще пропускаем подсветку URL со скобками,
        // чтобы избежать частичной подсветки или подсветки
        // с несбалансированными скобками.
        //
        var re = /(?:https?|ftp):\/\/[-A-Za-z0-9+&@#\/%=~_|()?!:,.;]*[-A-Za-z0-9+&@#\/%=~_|]/g;
        var matches;
        var result = '';
        var prevIndex = 0;
        while ((matches = re.exec(text)) !== null) {
            var url = matches[0];

            result += escape(text.substring(prevIndex, matches.index));
            prevIndex = matches.index + url.length;

            var count = (url.match(/\(|\)/g) || []).length;
            url = escape(url);
            // Пропускаем URL со скобками
            if (count > 0) {
                result += url;
            } else {
                result += '<a href="' + url + '" class="content-link" target="_blank">' + url + '</a>';
            }
        }
        result += escape(text.substring(prevIndex, text.length));
        return result;
    }
};
