<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 20.12.2015
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="fragments/headTag.jsp"/>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-inner">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <spring:url value="/" var="url_home"/>
            <a class="navbar-brand logo" href="${url_home}">Вернуться</a>
            <ul class="nav navbar-nav languages">
                <li><a class="navbar-brand" href="?lang=en"><span class="glyphicon glyphicon-th-large"><jsp:text/></span>English</a>
                </li>
                <li><a class="navbar-brand" href="?lang=ru_RU"><span class="glyphicon glyphicon-th-large"><jsp:text/></span>Русский</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<tiles:insertAttribute name="body"/>

<c:set var="ajaxUrl" value="contracts/"/>
<div class="jumbotron">
    <div class="container">
        <div style="margin-top: 30px" class="row">
            <!-- Левый блок -->
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="<c:url value="/operator/clients"/>"><s:message
                            code="messages.clients"/></a></li>
                    <li class="active"><a href="<c:url value="/contracts"/>"><s:message code="messages.contracts"/></a></li>
                    <li><a href="#"><s:message code="messages.tariffs"/></a></li>
                    <li><a href="#"><s:message code="messages.options"/></a></li>
                </ul>
            </div>

            <div class="container">
                <fieldset class="col-sm-10 bordure">
                    <legend class="legende">Список контрактов</legend>

                    <util:message message="${message}" messages="${messages}"/>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>CLIENT_ID</th>
                            <th>NUMBER</th>
                            <th>TARIFF</th>
                            <th>BLOCKED</th>

                            <s:url var="url_create" value="/book/form"/>
                            <th><a class="btn btn-info" href='${url_create}'>Создать</a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${contracts}" var="contract">
                            <tr>
                                <td>${contract.id}</td>

                                <s:url var="url_update" value="/book/form/${contracts.id}"/>
                                <td><a class="btn btn-info" href="${url_update}">Редактировать</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
</body>
</html>
