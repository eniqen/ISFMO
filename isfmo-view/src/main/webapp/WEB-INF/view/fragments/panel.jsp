<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <img src="/resources/images/profile-pic-300px.jpg" alt="" class="img-circle text-center" height="100"><br>
        <label class="dropdown page-header col-sm-12">
            <a class="dropdown-toggle" data-toggle="dropdown">Administrator<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li id="profileEdit"><a>Редактировать</a></li>
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

<!-- Modal -->
<div id="profileModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title"><i class="glyphicon glyphicon-list-alt"></i><s:message
                        code="messages.tariff_create"/></h3>
            </div>
            <div class="modal-body">
                <form:form style="margin-bottom: -8px" class="form-horizontal" method="post"
                           id="detailsForm">
                    <input name="id" type="text" hidden="hidden" id="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="title">
                            <s:message code="messages.tariff.title"/>:</label>

                        <div class="col-sm-10">
                            <input name="title" type="text" class="form-control input-sm" id="title"
                                   value="${tariff.title}"
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm">
                            <s:message code="messages.tariff.title"/>:</label>

                        <div class="col-sm-10">
                            <input name="firstname" type="text" class="form-control input-sm" id="firstname"
                                   value="${tariff.title}"
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
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


<script>
    $('#profileEdit').click(function () {
        $('#profileModal').modal('show');
    });
</script>