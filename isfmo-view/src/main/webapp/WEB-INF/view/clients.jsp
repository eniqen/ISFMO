<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>

<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<c:set var="ajaxUrl" value="ajax/clients/"/>
<div class="jumbotron">
    <div class="container">
        <div style="margin-top: 30px" class="row">
            <!-- Левый блок -->
            <div id="left-panel" class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="<c:url value="/clients"/>"><s:message
                            code="messages.clients"/></a></li>
                    <li><a href="<c:url value="/contracts"/>"><s:message code="messages.contracts"/></a></li>
                    <li><a href="<c:url value="/tariffs"/>"><s:message code="messages.tariffs"/></a></li>
                    <li><a href="<c:url value="/options"/>"><s:message code="messages.options"/></a></li>
                </ul>
            </div>


            <div class="container">
                <fieldset class="col-sm-10 bordure">
                    <legend class="legende">Список клиентов</legend>

                    <table class="table table-striped table-bordered table-condensed table-hover">
                        <thead>
                        <tr>
                            <th><s:message code="messages.firstname"/></th>
                            <th><s:message code="messages.lastname"/></th>
                            <th><s:message code="messages.birthday"/></th>
                            <th><s:message code="messages.address"/></th>
                            <th><s:message code="messages.email"/></th>
                            <th><s:message code="messages.passport"/></th>
                            <th>
                                <button id="add" class="modal-title btn btn-info btn-sm pull-right"><i
                                        class="glyphicon glyphicon-plus"></i> Создать
                                </button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="client" items="${clients}">
                            <tr>
                                <td>${client.firstname}</td>
                                <td>${client.lastname}</td>
                                <td>${client.birthday}</td>
                                <td>${client.address}</td>
                                <td>${client.email}</td>
                                <td>${client.passport}</td>
                                <td class="text-right"><a id="edit" class="btn btn-success btn-sm"
                                                          onclick="updateRow(${client.id})"><i
                                        class="glyphicon glyphicon-pencil"></i> <s:message
                                        code="messages.edit"/></a>
                                    <a id="delete" class="btn btn-danger t btn-sm" onclick="deleteRow(${client.id})"><i
                                            class="glyphicon glyphicon-trash"></i> <s:message
                                            code="messages.delete"/></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
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
                <h3 class="modal-title"><i class="glyphicon glyphicon-user"></i>
                    <c:choose>
                        <c:when test="${id == 0}">
                            <s:message code="messages.client_create"/>
                        </c:when>
                        <c:otherwise>
                            <s:message code="messages.client_edit"/>
                        </c:otherwise>
                    </c:choose>
                </h3>
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
                                   value="${client.firstname}"
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
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="birthday">
                            <s:message code="messages.birthday"/>:</label>

                        <div class="col-sm-10">
                            <input name="birthday" type="text" class="form-control input-sm" id="birthday"
                                   value="${client.birthday}"
                                   placeholder="<s:message code="messages.input.birthday"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="address">
                            <s:message code="messages.address"/>:</label>

                        <div class="col-sm-10">
                            <input name="address" type="text" class="form-control input-sm" id="address"
                                   value="${client.address}"
                                   placeholder="<s:message code="messages.input.address"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="passport">
                            <s:message code="messages.passport"/>:</label>

                        <div class="col-sm-10">
                            <input name="passport" type="text" class="form-control input-sm" id="passport"
                                   value="${client.passport}"
                                   placeholder="<s:message code="messages.input.passport"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="email">
                            <s:message code="messages.email"/>:</label>

                        <div class="col-sm-10">
                            <input name="email" type="email" class="form-control input-sm" id="email"
                                   value="${client.email}"
                                   placeholder="<s:message code="messages.input.email"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="password">
                            <s:message code="messages.password"/>:</label>

                        <div class="col-sm-10">
                            <input name="password" type="text" class="form-control input-sm" id="password"
                                   value="${client.password}"
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
    var table = $('#table');

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('#id').val(0);
        $('#editRow').modal('show');
    });

    $(function () {
        $("#birthday").datepicker({
            dateFormat: "yy-mm-dd"
        });
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
                successNoty('Сохранено');
            }
        });
    }

    function updateRow(id) {
        $.get(ajaxUrl + id + '/edit', function (data) {
            $.each(data, function (key, value) {
                form.find("input[name='" + key + "']").val(value);
            });
            $('#editRow').modal();
        });
    }

    function updateTable() {
        $.ajax({
            type: 'GET',
            url: ajaxUrl,
            success: function () {
                successNoty('Обновленно');
            }
        });
    }

    function deleteRow(id) {
        $.ajax({
            url: ajaxUrl + id + '/delete',
            type: 'DELETE',
            success: function () {
                successNoty('Deleted');
            }
        });
    }

    function successNoty(text) {
        noty({
            text: text,
            type: 'success',
            layout: 'bottomRight',
            timeout: true
        });
    }

    function failNoty(event, jqXHR, options, jsExc) {
        var errorInfo = $.parseJSON(jqXHR.responseText);
        failedNote = noty({
            text: 'Failed: ' + jqXHR.statusText + "<br>" + errorInfo.cause + "<br>" + errorInfo.detail,
            type: 'error',
            layout: 'bottomRight'
        });
    }

</script>

<style scoped>
    .table-hover tbody tr:hover td {
        background-color: #337ab7;
    }

    #left-panel ul li:hover a {
        background-color: #337ab7;
        color: white;
    }
</style>
</body>
</html>