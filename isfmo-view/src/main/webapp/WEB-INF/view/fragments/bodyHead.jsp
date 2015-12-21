<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 05.12.2015
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<!-- Шапка -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<%--<nav class="navbar navbar-inverse navbar-fixed-top">--%>
    <%--<div class="container-fluid">--%>
        <%--<div class="navbar-header">--%>
            <%--<a style="margin-left: 0" class="navbar-brand" href="/">Mobile Office</a>--%>
        <%--</div>--%>
        <%--<div>--%>
            <%--<ul class="nav navbar-nav pull-right">--%>
                <%--<li><a href="#" class="glyphicon glyphicon-user"></a></li>--%>
                <%--<li><a href="#" class="glyphicon glyphicon-off"></a></li>--%>
                <%--<li class="dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">ru<b class="caret"></b></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                        <%--<li><a onclick="show('en')">English</a></li>--%>
                        <%--<li><a onclick="show('ru_RU')">Русский</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <%--<script type="text/javascript">--%>
                    <%--function show(lang) {--%>
                        <%--window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;--%>
                    <%--}--%>
                <%--</script>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</nav>--%>


<%--<div class="row">--%>
<%--<div class="navbar navbar-inverse" role="navigation">--%>
<%--<div class="container">--%>
<%--<a href="/" class="navbar-brand">Mobile Office</a>--%>

<%--<div class="collapse navbar-collapse">--%>
<%--<ul class="nav navbar-nav navbar-right">--%>
<%--<li>--%>
<%--<form id="command" class="navbar-form" action="/logout" method="post">--%>
<%--<a class="btn btn-info" role="button" href="/operator/clients">Clients List</a>--%>
<%--<a class="btn btn-info" role="button" href="profile">Profile</a>--%>
<%--<input type="submit" class="btn btn-primary" value="Exit">--%>

<%--<div>--%>
<%--<input type="hidden" name="_csrf" value="f3391500-7414-4e91-9b41-2f335b23969e"/>--%>
<%--</div>--%>
<%--</form>--%>
<%--</li>--%>

<%--<li class="dropdown">--%>
<%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">ru<b class="caret"></b></a>--%>
<%--<ul class="dropdown-menu">--%>
<%--<li><a onclick="show('en')">English</a></li>--%>
<%--<li><a onclick="show('ru')">Русский</a></li>--%>
<%--</ul>--%>
<%--</li>--%>
<%--<script type="text/javascript">--%>
<%--function show(lang) {--%>
<%--window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;--%>
<%--}--%>
<%--</script>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

