<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Комментарии по физическому лицу</title>

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Script -->
        <script type="text/javascript" src="static/js/lib/json2.js?2011-10-19"></script>
        <script type="text/javascript" src="static/js/lib/jquery.js?1.7.2"></script>
        <script type="text/javascript" src="static/js/lib/jquery.ui.widget.js?1.8.17"></script>
        <script type="text/javascript" src="static/js/lib/jquery.iframe-transport.js?1.3"></script>
        <script type="text/javascript" src="static/js/lib/jquery.fileupload.js?5.6"></script>
        <script type="text/javascript" src="static/js/lib/jquery.fileDownload.js?1.3.0"></script>
        <script type="text/javascript" src="static/js/lib/jquery.cookie.js?2010"></script>
        <script type="text/javascript" src="static/js/lib/underscore.js?1.3.3"></script>
        <script type="text/javascript" src="static/js/lib/backbone.js?0.9.2"></script>
        <script type="text/javascript" src="static/js/lib/iso8601.js?2011"></script>
        <script type="text/javascript" src="static/js/lib/dateformat.js?1.2.3"></script>

        <script type="text/javascript" src="static/js/defaults.js?20120903"></script>

        <!-- Components -->
        <link href="static/components/bootstrap/css/bootstrap.css?2.0.4" rel="stylesheet">
        <link rel="stylesheet" href="static/components/message-widget/css/message-widget.css?20120903" />
        <script type="text/javascript" src="static/components/message-widget/js/message-widget.js?20120903"></script>

        <link rel="stylesheet" type="text/css" href="static/components/comment-widget/css/comment-widget.css?20120322">
        <script type="text/javascript" src="static/components/comment-widget/js/comment-utils.js?20120903"></script>
        <script type="text/javascript" src="static/components/comment-widget/js/comment-widget.js?20120903"></script>

        <style>
            .comments {
                position: relative;
            }
            .comment-count{
                padding-right: 5px;
            }
            .form-search input[type='text']{
                width: 400px;
            }
        </style>
        <script>
            MessageWidgetSettings.templates = CommentUtils.loadTemplates('static/components/message-widget/view/message-widget-templates.html');
            CommentWidgetSettings.templates = CommentUtils.loadTemplates('static/components/comment-widget/view/comment-widget-templates.html');
            CommentWidgetSettings.apiUrl = '<c:url value="/api" />';



            $(function() {
                CommentUtils.setupWidget('creditnet_ticket', function() {
                    if (CommentUtils.hasUserPermission('VIEW')) {
                        var commentWidget = new CommentWidget();

                        $('.comments').each(function() {
                            var me = $(this);
                            var button = me.find('button');
                            button.click(function() {
                                var postId = button.data('post-id');
                                if (commentWidget.isShow(postId)) {
                                    commentWidget.hide();
                                } else {
                                    var offset = button.offset();
                                    commentWidget.show(offset.left, offset.top + button.height() + 9, postId, {title: '<c:out value="${individual.name}" />'});
                                }
                                return false;
                            });
                        });
                    }
                });
            });
        </script>

    </head>
    <body class="bootstrap">
        <div class="container">
            <div class="page-header">
                <h1>Комментарии по физическому лицу&thinsp;<sup><small>[&beta;]</small></sup></h1>
            </div>

            <div class="row">
                <div class="span12">
                    <form:form method="get" modelAttribute="individual"  class="form-search">
                        <form:input path="name" placeholder="Фамилия Имя Отчество" class="input-xxlarge search-query"/>
                        <button type="submit" class="btn">Найти</button>
                    </form:form>
                </div>
            </div>
            <div class="row">
                <div class="span12">
                    <c:if test="${not empty postId}">
                        <c:choose>
                            <c:when test="${commentCount > 0}">
                                <span class="comment-count info">Найдено комментариев: ${commentCount}</span>
                                <span class="comments">
                                    <button class="btn btn-mini" data-post-id="${postId}">
                                        Показать
                                        <span class="caret"></span>
                                    </button>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="comment-count">Пока нет комментариев</span>
                                <span class="comments">
                                    <button class="btn btn-mini" data-post-id="${postId}">
                                        Добавить
                                        <span class="caret"></span>
                                    </button>
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
