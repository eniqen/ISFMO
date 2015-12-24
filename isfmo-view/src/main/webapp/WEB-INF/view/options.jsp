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
    <jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<tiles:insertAttribute name="body"/>

<c:set var="ajaxUrl" value="options/"/>
<div class="jumbotron">
    <div class="container">
        <div style="margin-top: 30px" class="row">
            <!-- Левый блок -->
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="<c:url value="/clients"/>"><s:message
                            code="messages.clients"/></a></li>
                    <li><a href="<c:url value="/contracts"/>"><s:message code="messages.contracts"/></a>
                    </li>
                    <li><a href="<c:url value="/tariffs"/>"><s:message code="messages.tariffs"/></a></li>
                    <li class="active"><a href="<c:url value="/options"/>"><s:message code="messages.options"/></a></li>
                </ul>
            </div>

            <div class="container">
                <fieldset class="col-sm-10 bordure">
                    <legend class="legende">Список опций</legend>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>TITLE</th>
                            <th>PRICE</th>
                            <th>CONNECTIONS_PRICE</th>
                            <s:url var="url_create" value="/book/form"/>
                            <th><a class="btn btn-info" href='${url_create}'>Создать</a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${options}" var="option">
                            <tr>
                                <td>${option.id}</td>
                                <td>${option.title}</td>
                                <td>${option.price}</td>
                                <td>${option.connectionPrice}</td>
                                <td><a class="btn btn-info" href="${url_update}">Редактировать</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
