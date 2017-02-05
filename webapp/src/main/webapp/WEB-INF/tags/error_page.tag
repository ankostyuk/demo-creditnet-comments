<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="title" %>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>${title}</title>

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Components -->
        <link href="<c:url value="/static/components/bootstrap/css/bootstrap.css?2.0.4" />" rel="stylesheet">

    </head>
    <body class="bootstrap">
        <div class="container">
            <div class="page-header">
                <h1>${title}</h1>
            </div>
            <div class="row">
                <jsp:doBody/>
            </div>
            <div class="row">
                <div class="span12">
                    Вы можете <a href="/help/comments/">посмотреть раздел помощи</a>
                    по сервису комментариев или <a href="/">перейти на главную страницу</a>.
                </div>
            </div>
        </div>
    </body>
</html>
