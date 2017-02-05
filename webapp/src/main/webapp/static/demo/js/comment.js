/**
 * @author ankostyuk
 */

// Настройки виджетов
MessageWidgetSettings.templates = CommentUtils.loadTemplates('static/components/message-widget/view/message-widget-templates.html');
CommentWidgetSettings.templates = CommentUtils.loadTemplates('static/components/comment-widget/view/comment-widget-templates.html');
CommentWidgetSettings.apiUrl = CommentUtils.API_URL;

$(function() {

    // 'creditnet_backend_ticket' для бэка, т.е. для панели модерации
    // 'creditnet_ticket' для фронта, т.е. для виджета комментариев
    CommentUtils.setupWidget('creditnet_ticket', function() {

        if (CommentUtils.hasUserPermission('VIEW')) {
            var hooks = $('.creditnet-comments-hook');
            if (!hooks.length) {
                return;
            }
            var postIds = hooks.map(function(){
                return $(this).data('post-id');
            }).get();


            $.ajaxSettings.traditional = true;
            $.getJSON(
                CommentWidgetSettings.apiUrl + '/comments/by-post/info.json',
                {postId: postIds},
                function(data) {
                    data = data || [];
                    var counters = {};
                    $.each(data, function(i, e){
                        counters[e.postId] = e.commentCount;
                    });
                    initializeWidget(hooks, counters);
                }
            );
        }
    });

    function initializeWidget(hooks, counters){
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
            var b = $('<span class="comment-btn ' + cls + '"><span class="btn">К</span>' + cnt + '</span>');

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
    }

    // TEST BlankCommentWidget
    var blankCommentWidget = new BlankCommentWidget();
    blankCommentWidget.show(750, 10);
    blankCommentWidget.hide();
    blankCommentWidget.show(750, 10);
});
