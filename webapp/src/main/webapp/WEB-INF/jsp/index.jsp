<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Система комментариев НКБ</title>

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Components -->
        <link href="static/components/bootstrap/css/bootstrap.css?2.0.4" rel="stylesheet">
        <style>
            sup {
                color: #999;
            }
        </style>
    </head>
    <body class="bootstrap">
        <div class="container">
            <div class="page-header">
                <h1>Система комментариев НКБ</h1>
            </div>

            <div class="row">
                <div class="span12">
                    <ul class="unstyled">
                        <li><a href="<c:url value="/groups" />">Прямой эфир комментариев</a> <sup><small>[&beta;]</small></sup></li>
                        <li><a href="<c:url value="/individual" />">Комментарии по физическому лицу</a>&thinsp;<sup><small>[&beta;]</small></sup></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
