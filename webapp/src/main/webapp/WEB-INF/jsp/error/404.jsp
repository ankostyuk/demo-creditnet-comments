<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% response.setStatus(404); %>
<t:error_page>
    <jsp:attribute name="title">Страница не найдена</jsp:attribute>
</t:error_page>
