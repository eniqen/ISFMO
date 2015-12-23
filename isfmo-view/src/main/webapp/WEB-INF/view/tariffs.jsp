<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<c:set var="ajaxUrl" value="tarrifs/"/>
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
                    <li class="active"><a href="<c:url value="/tariffs"/>"><s:message code="messages.tariffs"/></a></li>
                    <li><a href="<c:url value="/options"/>"><s:message code="messages.options"/></a></li>
                </ul>
            </div>

            <div class="container">
                <fieldset class="col-sm-10 bordure">
                    <legend class="legende">Список тарифов</legend>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>TITLE</th>
                            <th>PRICE</th>
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
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>

<!-- Modal -->
<div id="editRow" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title"><i class="glyphicon glyphicon-user"></i><s:message
                        code="messages.tariff_create"/></h3>
            </div>
            <div class="modal-body">
                <form:form style="margin-bottom: -8px" class="form-horizontal" method="post"
                           id="detailsForm">
                    <input name="id" type="text" hidden="hidden" id="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="firstname">
                            <s:message code="messages.firstname"/>:</label>

                        <div class="col-sm-10">
                            <input name="firstname" type="text" class="form-control input-sm" id="firstname"
                                   value="${tariff.title}"
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="lastname">
                            <s:message code="messages.lastname"/>:</label>

                        <div class="col-sm-10">
                            <input name="lastname" type="text" class="form-control input-sm" id="lastname"
                                   value="${client.lastname}"
                                   placeholder="<s:message code="messages.input.lastname"/>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit"
                                class="btn btn-default glyphicon glyphicon-floppy-save"><s:message
                                code="messages.save"/>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!-- Конец модального окна-->
</body>
</html>
