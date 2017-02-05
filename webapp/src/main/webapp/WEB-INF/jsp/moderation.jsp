<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Модерация комментариев</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <link href="static/components/bootstrap/css/bootstrap.css?2.0.4" rel="stylesheet">

        <style type="text/css">
            body.moderation {
                padding-top: 10px;
            }
            .moderation a, .moderation a:active, .moderation a:focus {
                outline: none;
            }
            .moderation a:focus {
                -moz-outline-style: none;
            }
            .moderation :-moz-any-link:focus {
                outline: none;
            }
            .moderation p strong {
                font-size: 11px;
                font-weight: bold;
                color: #404040;
            }
            .moderation p small {
                font-size: 11px;
                color: #808080;
            }
            .moderation .label {
                font-size: 11px;
                font-weight: normal;
                text-transform: none;
            }
            .moderation .small {
                font-size: 11px;
            }
            .moderation .align-right {
                text-align: right;
            }
            .moderation .nav.nav-pills {
                font-size: 14px;
                margin-bottom: 40px;
            }
            .moderation .comment {
                padding-bottom: 40px;
            }
            .moderation .comment .private {
                width: 960px;
                margin: 0;
                padding: 15px 0 10px 20px;
                background-color: #f0f0f0;
            }
            .moderation .comment .attachment {
                font-size: 11px;
                margin-bottom: 5px;
                color: #808080;
            }
            .moderation .comment .attachment a {
                cursor: pointer;
                text-decoration: underline;
            }
            .moderation .rejection-text input {
                margin-bottom: 0;
            }
        </style>

        <script src="static/js/lib/json2.js?2011-10-19"></script>
        <script src="static/js/lib/jquery.js?1.7.2"></script>
        <script src="static/js/lib/jquery.iframe-transport.js?1.3"></script>
        <script src="static/js/lib/jquery.fileDownload.js?1.3.0"></script>
        <script src="static/js/lib/jquery.cookie.js?2010"></script>
        <script src="static/js/lib/underscore.js?1.3.3"></script>
        <script src="static/js/lib/backbone.js?0.9.2"></script>
        <script src="static/js/lib/waypoints.js?1.1.2"></script>
        <script src="static/js/lib/iso8601.js?2011"></script>
        <script src="static/js/lib/dateformat.js?1.2.3"></script>

        <script src="static/js/defaults.js?20120906"></script>
        <script src="static/components/comment-widget/js/comment-utils.js?20120906"></script>
        <script src="static/components/moderation/js/moderation.js?20120906"></script>

        <script>
            $(function() {
                API_URL = '<c:url value="/api" />';

                var errorMessage = $('#moderation-error');
                errorMessage.find('a.close').click(function(){
                    errorMessage.fadeOut('fast');
                    return false;
                });
                errorMessage.ajaxError(function(event, xhr) {
                    var r = $.parseJSON(xhr.responseText);
                    if (r != null && r.error && r.error.message) {
                        showError(r.error.message);
                    }
                });

                function showError(message) {
                    errorMessage.fadeOut('slow', function(){
                        errorMessage.find('div').html(message);
                        errorMessage.fadeIn('slow');
                    });
                };

                // 'creditnet_backend_ticket' для бэка, т.е. для панели модерации
                // 'creditnet_ticket' для фронта, т.е. для виджета комментариев
                CommentUtils.setupWidget('creditnet_backend_ticket', function() {
                    if (CommentUtils.hasUserPermission('MODERATE')) {
                        new Moderation(API_URL, showError);
                    } else {
                        showError('Недостаточно прав для модерации');
                    }
                }, showError);
            });
        </script>
    </head>

    <body class="moderation bootstrap">
        <div class="container" id="moderation">
            <div class="page-header">
                <h1>Модерация комментариев <small>ОДОБРЯЙ @ ОТКЛОНЯЙ</small></h1>
            </div>

            <noscript>
            <div class="well">
                Для модерирования комментариев необходима поддержка JavaScript.
            </div>
            </noscript>

            <div class="row" id="comment-filter">
            </div>

            <div class="row">
                <div class="span12">
                    <div class="alert alert-error" id="moderation-error" style="display: none;">
                        <a class="close" href="#">×</a>
                        <div></div>
                    </div>
                </div>
            </div>

            <div id="comment-list">

            </div>

        </div>

        <script type="text/template" id="comment-template">
            <div class="span12 {%= comment.scope.visibility == 'PRIVATE' ? 'private' : '' %}">
                <div class="row">

                    <div class="span3">
                        <p><strong>{%- comment.authorName %}</strong></p>
                    </div>

                    <div class="span2">
                        <p>{% print(DateUtils.formatDateTime(comment.created)); %}</p>
                    </div>
                    {% if (comment.moderation.status == 'APPROVED') { %}
                    <div class="span7">
                        <p class="small"><span class="label label-success">Одобрен</span> {%- comment.moderation.moderatorName %} {% print(DateUtils.formatDateTime(comment.moderation.updated)); %}</p>
                    </div>
                    {% } else if (comment.moderation.status == 'PENDING' && comment.moderation.updated) { %}
                    <div class="span7">
                        <p class="small"><span class="label">Возвращён</span> {%- comment.moderation.moderatorName %} {% print(DateUtils.formatDateTime(comment.moderation.updated)); %}</p>
                    </div>
                    {% } else if (comment.moderation.status == 'REJECTED') { %}
                    <div class="span7">
                        <p class="small"><span class="label label-important">Отклонён</span> {%- comment.moderation.moderatorName %} {% print(DateUtils.formatDateTime(comment.moderation.updated)); %} <small>{%- comment.moderation.rejectionReason %}</small></p>
                    </div>
                    {% } %}

                    <div class="span12">
                        <p>{% print(CommentUtils.formatContent(comment.content)); %}</p>
                    </div>

                    <div class="span12">
                        {% if ($.isArray(comment.attachments)) { %}
                        {% _.each(comment.attachments, function(attachment){ %}
                        <div class="attachment row">
                            <div class="span3"><a class="download" href="{%= API_URL %}/comments/{%= comment.id %}/attachment/{%= attachment.id %}/{%- attachment.name %}">{%- attachment.name %}</a></div>
                            <div class="span2">{% print(DateUtils.formatDateTime(attachment.created)); %}</div>
                            <div class="span2">{% print(CommentUtils.humanizeBinarySize(attachment.size, 1)); %}</div>
                        </div>
                        {% }); %}
                        {% } %}
                    </div>

                    <div class="span12">
                        <p>
                            <strong>Видимость:</strong>
                            {% if (comment.scope.visibility == 'PUBLIC') { %}
                            <strong>публичный</strong>
                            {% } else if (comment.scope.visibility == 'GROUP') { %}
                            <strong>группы</strong>
                            {% } else if (comment.scope.visibility == 'PRIVATE') { %}
                            <strong>личный</strong>
                            {% } %}
                        </p>
                    </div>

                    <div class="span12">
                        <p><small>
                            {% if (comment.title) { %}
                                {% if (/^\/bsnId:\d+/.test(comment.postId)) { %}
                                    <a href="/reports/?code=rep_history_profile&fromSearch=1&id={%- comment.postId.match(/^\/bsnId:(\d+)/)[1] %}&type=adv&form[search_type]=adv"
                                                   title="Открыть исторический профиль"
                                                   target="_blank">{%- comment.title %}</a>
                                {% } else { %}
                                    {%- comment.title %}
                                {% } %}
                            {% } else { %}
                                {% if (/^\/bsnId:\d+/.test(comment.postId)) { %}
                                    <a href="/reports/?code=rep_history_profile&fromSearch=1&id={%- comment.postId.match(/^\/bsnId:(\d+)/)[1] %}&type=adv&form[search_type]=adv"
                                                   title="Открыть исторический профиль"
                                                   target="_blank">Компания {%- comment.postId.match(/^\/bsnId:(\d+)/)[1] %}</a>
                                {% } else { %}
                                    Объект комментирования: {%- comment.postId %}
                                {% } %}
                            {% } %}
                        </small></p>
                    </div>

                    <div class="span9">
                        <p>
                            {% if (comment.moderation.status != 'APPROVED') { %}
                            <button class="btn btn-success approve-action">Одобрить</button>&nbsp;
                            {% } %}
                            {% if (comment.moderation.status != 'REJECTED') { %}
                            <button class="btn btn-danger reject-action">Отклонить</button>&nbsp;
                            <span class="rejection-text" style="display:none;"><input class="span3" type="text">&nbsp;<span class="help-inline small">Укажите причину отклонения</span>&nbsp;</span>
                            {% } %}
                            {% if (comment.moderation.status != 'PENDING') { %}
                            <button class="btn review-action">Вернуть на модерацию</button>&nbsp;
                            {% } %}
                        </p>
                    </div>
                    <div class="align-right span3">
                        <p>
                            {% if (CommentUtils.hasCommentPermission(comment, 'VERIFY')) { %}
                            {% if (comment.verification.verified) { %}
                            <button class="btn verify-action active btn-info" title="{%- comment.verification.verifierName %}">Проверен {% print(DateUtils.formatDateTime(comment.verification.updated)); %}</button>
                            {% } else { %}
                            <button class="btn verify-action">Не проверен НКБ</button>
                            {% } %}
                            {% } else { %}
                            {% if (comment.verification.verified) { %}
                            <button class="btn btn-info" disabled="disabled" title="{%- comment.verification.verifierName %}">Проверен {% print(DateUtils.formatDateTime(comment.verification.updated)); %}</button>
                            {% } else { %}
                            <button class="btn" disabled="disabled">Не проверен НКБ</button>
                            {% } %}
                            {% } %}
                        </p>
                    </div>

                </div>
            </div>
        </script>

        <script type="text/template" id="comment-filter-template">
            <div class="span12">
                <ul class="nav nav-pills">
                    <li {%= value == 'pending' ? 'class="active"' : '' %}><a href="#pending">Новые</a></li>
                    <li {%= value == 'approved' ? 'class="active"' : '' %}><a href="#approved">Одобренные</a></li>
                    <li {%= value == 'rejected' ? 'class="active"' : '' %}><a href="#rejected">Отклонённые</a></li>
                    <li {%= value == 'all' ? 'class="active"' : '' %}><a href="#all">Все</a></li>
                </ul>
            </div>
        </script>

    </body>
</html>