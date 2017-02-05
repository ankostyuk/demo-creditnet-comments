<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% response.setStatus(500); %>
<t:error_page>
    <jsp:attribute name="title">Что-то пошло не так</jsp:attribute>
</t:error_page>