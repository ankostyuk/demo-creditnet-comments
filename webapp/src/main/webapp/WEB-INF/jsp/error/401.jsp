<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% response.setStatus(401); %>
<t:error_page>
    <jsp:attribute name="title">Требуется выполнить вход</jsp:attribute>
</t:error_page>
