<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 21.12.2015
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="headTag.jsp"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top"></nav>
<div class="container-fluid">
    <div class="row">
        <div style="background-color: #414b56" class="col-sm-3 col-md-2 sidebar">
            <div class="row pg-empty-placeholder text-center">
                <img src="/resources/images/profile-pic-300px.jpg" class="img-circle text-center" height="80"><br>
                <label class="btn dropdown-toggle text-center" data-toggle="dropdown" title="Administrator"
                       type="button">Administrator
                    <span class="caret"></span>
                </label>
            </div>
            <ul class="nav nav-sidebar">
                <li><a href="<c:url value="/clients"/>"><s:message code="messages.clients"/></a></li>
                <li><a href="<c:url value="/contracts"/>"><s:message code="messages.contracts"/></a></li>
                <li class="active"><a href="<c:url value="/tariffs"/>"><s:message code="messages.tariffs"/></a></li>
                <li><a href="<c:url value="/options"/>"><s:message code="messages.options"/></a></li>
                <li><a href="<c:url value="/numbers"/>"><s:message code="messages.numbers"/></a></li>
            </ul>
            <div class="btn-group">
            </div>
            <div class="btn-group">
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="#">Action</a>
                    </li>
                    <li>
                        <a href="#">Another action</a>
                    </li>
                    <li>
                        <a href="#">Something else here</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">Separated link</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<style>
    body {
        padding-top: 50px;
    }

    /*
     * Top navigation
     * Hide default border to remove 1px line.
     */
    .navbar-fixed-top {
        border: 0;
    }

    /*
     * Sidebar
     */

    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }

    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 50px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            background-color: #f5f5f5;
            border-right: 1px solid #eee;
        }
    }

    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px; /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 20px;
    }
</style>
</body>
</html>



