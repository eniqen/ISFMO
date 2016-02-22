<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 05.12.2015
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>

<div class="col-sm-12 container navbar navbar-inverse navbar-fixed-top">
    <a style="padding: 0px 0px 0px 0px" class="navbar-brand" href="/cabinet">
        <img height="50px" src="/resources/images/t-mobilelogo.jpg" alt="">
    </a>
    <span style="margin-left: 0" class="navbar-brand" href="/cabinet"><strong>Mobile</strong></span>

    <div class="collapse navbar-collapse">

        <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="hasRole('ROLE_USER')">
                <li>
                    <a href="/user-shopCart" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="glyphicon glyphicon-shopping-cart"></i> <strong>Корзина</strong><b class="caret"></b></a>
                </li>
            </sec:authorize>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">ru<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a onclick="show('en')">English</a></li>
                    <li><a onclick="show('ru_RU')">Русский</a></li>
                </ul>
            </li>
            <script type="text/javascript">
                function show(lang) {
                    window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;
                }
            </script>
        </ul>
    </div>
</div>
