<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Вход</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <link href="<c:url value='/static/components/bootstrap/css/bootstrap.css?2.0.4' />" rel="stylesheet">

        <style type="text/css">
            body {
                padding-top: 10px !important;
            }
        </style>
    </head>
    <body class="bootstrap">
        <div class="container" id="moderation">
            <div class="page-header">
                <h1>Вход</h1>
            </div>
            <c:if test="${not empty ticket}">
                <div class="alert alert-info">
                    Текущее значение тикета: <c:out value="${ticket}" />  <a href="<c:url value="/demo/logout" />">выйти</a>
                </div>
            </c:if>
            <div class="row">
                <div class="span">
                    <form:form modelAttribute="model">
                        <spring:hasBindErrors name="model">
                            <div class="alert-message error">
                                <c:forEach var="error" items="${errors.allErrors}">
                                    <p>${error.defaultMessage}</p>
                                </c:forEach>
                            </div>
                        </spring:hasBindErrors>
    
                        <div class="clearfix">
                            <label for="login">Логин</label>
                            <div class="input">
                                <input type="text" name="login" />
                            </div>
                        </div>
                        <div class="clearfix">
                            <label for="password">Пароль</label>
                            <div class="input">
                                <input type="password" name="password" />
                            </div>
                        </div>
                        <div class="actions">
                            <input type="submit" value="Войти" class="btn primary" />
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>