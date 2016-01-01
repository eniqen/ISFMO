<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 21.12.2015
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<head>
    <link type="text/css" rel="stylesheet" href="/resources/css/panel.css"/>
</head>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="row pg-empty-placeholder text-center">
        <img src="/resources/images/profile-pic-300px.jpg" alt="" class="img-circle text-center" height="100"><br><br>
        <label class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrator<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a>Редактировать</a></li>
                <li><a href="<c:url value="/j_spring_security_logout"/>">Выйти</a></li>
            </ul>
        </label>
    </div>
    <ul id="left-panel" class="nav nav-sidebar">
        <li><a href="<c:url value="/clients"/>"><s:message code="messages.clients"/></a></li>
        <li><a href="<c:url value="/contracts"/>"><s:message code="messages.contracts"/></a></li>
        <li class="active"><a href="<c:url value="/tariffs"/>"><s:message code="messages.tariffs"/></a></li>
        <li><a href="<c:url value="/options"/>"><s:message code="messages.options"/></a></li>
        <li><a href="<c:url value="/numbers"/>"><s:message code="messages.numbers"/></a></li>
    </ul>
</div>


