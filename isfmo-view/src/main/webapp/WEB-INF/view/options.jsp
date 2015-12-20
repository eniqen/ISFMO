<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <a class="navbar-brand logo" href="${url_home}"</a>
            <ul class="nav navbar-nav languages">
                <li><a class="navbar-brand" href="?lang=en_US"><span class="glyphicon glyphicon-th-large"><jsp:text/></span>English</a></li>
                <li><a class="navbar-brand" href="?lang=fr_FR"><span class="glyphicon glyphicon-th-large"><jsp:text/></span>Français</a></li>
            </ul>
        </div>
    </div>
</nav>
<tiles:insertAttribute name="body" />
</body>
</html>
