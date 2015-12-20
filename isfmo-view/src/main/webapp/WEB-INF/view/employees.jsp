<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <jsp:include page="fragments/headTag.jsp"/>
</head>

<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<c:set var="ajaxUrl" value="clients/"/>
<div class="jumbotron">
    <div class="container">
        <div style="margin-top: 30px" class="row">
            <!-- Левый блок -->
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="<c:url value="/operator/clients"/>"><s:message
                            code="messages.clients"/></a></li>
                    <li><a href="#"><s:message code="messages.contracts"/></a></li>
                    <li><a href="#"><s:message code="messages.tariffs"/></a></li>
                    <li><a href="#"><s:message code="messages.messages"/></a></li>
                </ul>
            </div>



            <!--Основной блок-->
            <div class="col-sm-10">
                <div class="panel panel-default">
                    <div style="padding: 5px 10px" class="panel-heading">
                        <s:message code="messages.client_list"/>
                        <button style="padding: 0px 10px" type="button"
                                class="btn btn-success btn-sm glyphicon glyphicon-plus pull-right" id="add">
                        </button>
                    </div>

                    <!-- Таблица с клиентами -->
                    <table style="padding: 0"
                           class="table table-striped table-bordered table-condensed table-hover text-center">
                        <tr>
                            <td><strong><s:message code="messages.firstname"/></strong></td>
                            <td><strong><s:message code="messages.lastname"/></strong></td>
                            <td><strong><s:message code="messages.birthday"/></strong></td>
                            <td><strong><s:message code="messages.address"/></strong></td>
                            <td><strong><s:message code="messages.email"/></strong></td>
                            <td><strong> <s:message code="messages.passport"/> </strong></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <c:forEach var="client" items="${clients}">
                            <tr>
                                <td>${client.firstname}</td>
                                <td>${client.lastname}</td>
                                <td>${client.birthday}</td>
                                <td>${client.address}</td>
                                <td>${client.email}</td>
                                <td>${client.passport}</td>
                                <td>
                                    <a id="edit" class="btn btn-success navbar-btn btn-sm btn-default glyphicon glyphicon-pencil"
                                       data-toggle="tooltip" title="<s:message code="messages.edit"/>"
                                       href="<c:url value="/operator/edit?id=${client.id}"/>">
                                    </a>
                                </td>
                                <td>
                                    <a class="btn btn-success navbar-btn btn-sm btn-danger glyphicon glyphicon-trash"
                                       data-toggle="tooltip" title="<s:message code="messages.delete"/>"
                                       href="<c:url value="/operator/delete?id=${client.id}"/>">
                                    </a>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Конец основного блока-->

<div class="clearfix"></div>

<!--Подвал сайта-->
<jsp:include page="fragments/footer.jsp"/>

<!-- Modal -->
<div id="editRow" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title"><i class="glyphicon glyphicon-user"></i><s:message code="messages.client_create"/></h3>
            </div>
            <div class="modal-body">
                <form:form style="margin-bottom: -8px" class="form-horizontal" method="post"
                           id="detailsForm">
                    <input type="text" hidden="hidden" id="id" name="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="firstname">
                            <s:message code="messages.firstname"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="firstname"
                                   name="firstname" value="${client.firstname}"
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="lastname">
                            <s:message code="messages.lastname"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="lastname"
                                   name="lastname" value="${client.lastname}"
                                   placeholder="<s:message code="messages.input.lastname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="birthday">
                            <s:message code="messages.birthday"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="birthday"
                                   name="birthday" value="${client.birthday}"
                                   placeholder="<s:message code="messages.input.birthday"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="address">
                            <s:message code="messages.address"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="address" name="address"
                                   value="${client.address}"
                                   placeholder="<s:message code="messages.input.address"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="passport">
                            <s:message code="messages.passport"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="passport"
                                   name="passport" value="${client.passport}"
                                   placeholder="<s:message code="messages.input.passport"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="email">
                            <s:message code="messages.email"/>:</label>

                        <div class="col-sm-10">
                            <input type="email" class="form-control input-sm" id="email" name="email"
                                   value="${client.email}"
                                   placeholder="<s:message code="messages.input.email"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="password">
                            <s:message code="messages.password"/>:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control input-sm" id="password"
                                   name="password" value="${client.password}"
                                   placeholder="<s:message code="messages.input.password"/>">
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
    var ajaxUrl = '${ajaxUrl}';
    var form = $('#detailsForm');

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('#id').val(0);
        $('#editRow').modal('show');
    });

    $(function () {
        $("#birthday").datepicker();
    });

    form.submit(function () {
        save();
        return false;
    });

    function save() {
        $.ajax({
            type: "POST",
            url: ajaxUrl + 'add',
            data: form.serialize(),
            success: function (data) {
                $('#editRow').modal('hide');
                alert('Сохранено')
            }
        });
    }
    //
    //    function deleteRow(id) {
    //        $.ajax({
    //            url: ajaxUrl + 'client/' + id,
    //            type: 'DELETE'
    ////            success: function () {
    ////                updateTable();
    ////                successNoty('Deleted');
    ////            }
    //        });
    //    }
    //
</script>
</body>
</html>