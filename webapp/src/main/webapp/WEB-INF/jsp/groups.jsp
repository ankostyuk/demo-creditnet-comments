<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<% pageContext.setAttribute("NEWLINE", "\n");%>

<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Прямой эфир комментариев</title>
        <meta name="description" content="">
        <meta name="author" content="">

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
            .group-activity .comment {
                padding-bottom: 40px;
            }
            .bootstrap .pager {
                text-align: left;
            }
            .page-position {
                padding-right: 20px;
            }
            .attachment-icon {
                margin: 0 5px 0 0;
                vertical-align: middle;
                display: inline-block;
                width: 16px;
                height: 16px;
                background: transparent url('<c:url value="/static/components/comment-widget/css/i/icons.png" />') no-repeat -24px 0px;
            }

            .comment-btn {
                background-color: #eee;
                border: 1px solid #ccc;
                border-left: none;

                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
            }
            .comment-btn.empty {
                border: none;
            }
            .comment-btn .btn{
                 padding: 1px 4px;
                 vertical-align: top;
            }
            .comment-btn .counter{
                color: #333;
                font-size: 11px;
                padding: 0px 4px 0px 3px;
                vertical-align: top;
            }
            .comment-btn.empty .counter{
                display: none;
            }

            .tags-filter {
                margin: 0 0 40px 0 !important;
            }
            .tags-filter .tags {
                margin-top: 3px;
            }
            .tags-filter .tag:first-child {
                margin-left: 0;
            }
            .tags-filter label.tag {
                display: inline-block;
                margin-bottom: 0;
                margin-left: 30px;
                padding: 2px 6px 1px 24px;
                cursor: pointer;
            }
            .tags-filter label.tag:first-child {
                margin-left: 0;
            }
            .tags-filter label.tag input {
                display: inline-block;
                margin: 2px 0;
            }

            .comment .tag {
                padding: 2px 5px 3px 5px;
                font-size: 11px;
                line-height: 20px;
                white-space: nowrap;
                vertical-align: baseline;
            }

            .tags .tag {
                white-space: nowrap;

                background-color: #ffffff;

                -webkit-border-radius: 4px;
                   -moz-border-radius: 4px;
                        border-radius: 4px;
            }
            .tags .tag:hover,
            .tags .tag.checked {
                background-color: #808080;
            }
            .tags .tag.tag-1:hover,
            .tags .tag.tag-1.checked {
                background-color: #dddddd;
            }
            .tags .tag.tag-2:hover,
            .tags .tag.tag-2.checked {
                background-color: #7cafdd;
            }
            .tags .tag.tag-3:hover,
            .tags .tag.tag-3.checked {
                background-color: #f1e060;
            }
            .tags .tag.tag-4:hover,
            .tags .tag.tag-4.checked {
                background-color: #f7b759;
            }
            .tags .tag.tag-5:hover,
            .tags .tag.tag-5.checked {
                background-color: #f2776e;
            }
        </style>

        <script>
            // Настройки виджетов
            MessageWidgetSettings.templates = CommentUtils.loadTemplates('static/components/message-widget/view/message-widget-templates.html');
            CommentWidgetSettings.templates = CommentUtils.loadTemplates('static/components/comment-widget/view/comment-widget-templates.html');
            CommentWidgetSettings.apiUrl = CommentUtils.API_URL;

            $(function() {
                CommentUtils.setupButton({
                    button: '<span class="btn btn-mini">Все комментарии <span class="caret"></span></span>'
                });

                //
            });
        </script>

    </head>
    <body class="group-activity bootstrap">
        <div class="container">
            <div class="page-header">
                <h1>Прямой эфир комментариев&thinsp;<sup><small>[&beta;]</small></sup></h1>
            </div>

            <form class="tags-filter">
                <div class="row">
                    <div class="span10 tags">
                        <c:forEach var="tagName" items="${tagNames}">
                            <c:set var="tag" value="${commentsTags[tagName]}" />
                            <label class="checkbox tag tag-${tag.id} checked"><input type="checkbox" name="tag" value="${tagName}" <c:if test="${tagsMap[tagName]}">checked</c:if>>${tagName}</label>
                        </c:forEach>
                    </div>
                    <div class="align-right">
                        <button type="submit" class="btn">Обновить</button>
                    </div>
                </div>
            </form>

            <c:if test="${queryResult.total == 0}">
                <p class="result-info muted align-center">Нет комментариев</p>
            </c:if>

            <c:if test="${queryResult.total > 0}">
                <c:forEach var="comment" items="${queryResult.list}">
                    <div class="row comment">
                        <div class="span6">
                            <p>
                                <small>
                                    <c:set var="bsnId" value="${bsnIds[comment.id]}" />
                                    <c:choose>
                                        <c:when test="${not empty comment.title}">
                                            <c:if test="${not empty bsnId}">
                                                <a href="/reports/?code=rep_history_profile&fromSearch=1&id=${bsnId}&type=adv&form[search_type]=adv"
                                                   title="Открыть исторический профиль"
                                                   target="_blank">
                                                    <c:out value="${comment.title}" /></a>
                                                </c:if>
                                                <c:if test="${empty bsnId}">
                                                    <c:out value="${comment.title}" />
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${not empty bsnId}">
                                                <a href="/reports/?code=rep_history_profile&fromSearch=1&id=${bsnId}&type=adv&form[search_type]=adv"
                                                   title="Открыть исторический профиль"
                                                   target="_blank">
                                                    Компания <c:out value="${bsnId}" /></a>
                                                </c:if>
                                                <c:if test="${empty bsnId}">
                                                Объект комментирования: <c:out value="${comment.postId}" />
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </small>
                            </p>
                        </div>
                        <div class="span6">
                            <c:if test="${postIdCounts[comment.postId].commentCount > 1}">
                                <span class="creditnet-comments-hook"
                                      data-post-id="${comment.postId}"
                                      data-title="<c:out value="${comment.title}" />"
                                      ></span>
                            </c:if>
                        </div>

                        <div class="span12">
                            <c:if test="${fn:length(comment.tags) > 0}">
                                <p class="tags">
                                    <c:forEach var="tagName" items="${comment.tags}">
                                        <span class="tag tag-${commentsTags[tagName].id} checked"><c:out value="${tagName}" /></span>
                                    </c:forEach>
                                </p>
                            </c:if>
                        </div>

                        <div class="span12">
                            <p>
                                <c:set var="escapedContent"><c:out value="${comment.content}" /></c:set>
                                ${ fn:replace(escapedContent, NEWLINE, '<br>') }
                            </p>
                        </div>

                        <c:if test="${not empty comment.attachments}">
                            <div class="span12">
                                <ul class="unstyled">
                                    <c:forEach var="attachment" items="${comment.attachments}">
                                        <li><span class="attachment-icon"></span><a href="<c:url value="/api/comments/${comment.id}/attachment/${attachment.id}/${attachment.name}" />"><c:out value="${attachment.name}" /></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>

                        <div class="span3">
                            <p><strong><c:out value="${comment.authorName}" /></strong></p>
                        </div>
                        <div class="span3">
                            <p><fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${comment.created}" /></p>
                        </div>
                        <div class="span6">
                            <c:if test="${fn:length(userGroupNames) > 1}">
                                <c:forEach var="groupName" items="${shareGroupNames[comment.id]}">
                                    <span class="label label-info"><c:out value="${groupName}" /></span>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${queryResult.pageCount > 1}">
                    <ul class="pager">
                        <c:set var="pageNumber" value="${queryResult.pageNumber}" />
                        <li>
                            <span class="page-position">Показаны с ${queryResult.firstNumber} по ${queryResult.lastNumber}</span>
                        </li>
                        <c:if test="${pageNumber > 1}">
                            <li class=""><a href="<c:url value="/groups">
                                                <c:param name="page" value="${pageNumber - 1}" />
                                            </c:url>">&larr; Назад</a></li>
                            </c:if>
                            <c:if test="${pageNumber == 1}">
                            <li class="disabled"><a href="#">&larr; Назад</a></li>
                            </c:if>

                        <c:if test="${pageNumber < queryResult.pageCount}">
                            <li class=""><a href="<c:url value="/groups">
                                                <c:param name="page" value="${pageNumber + 1}" />
                                            </c:url>">Вперед &rarr;</a></li>
                            </c:if>
                            <c:if test="${pageNumber >= queryResult.pageCount}">
                            <li class="disabled"><a href="#">Вперед &rarr;</a></li>
                            </c:if>
                    </ul>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
