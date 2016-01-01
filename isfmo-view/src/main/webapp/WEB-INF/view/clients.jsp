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
<c:set var="ajaxUrl" value="/ajax/clients/"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="page-header">Список клиентов</h2>

            <div class="table-responsive">
                <fieldset class="bordure">
                    <table id="table" class="table table-striped table-condensed table-hover">
                        <thead>
                        <tr>
                            <th><s:message code="messages.firstname"/></th>
                            <th><s:message code="messages.lastname"/></th>
                            <th><s:message code="messages.birthday"/></th>
                            <th><s:message code="messages.address"/></th>
                            <th><s:message code="messages.email"/></th>
                            <th><s:message code="messages.passport"/></th>
                            <th>
                                <button id="add" class="modal-title btn btn-info btn-xs pull-right"><i
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
                                <td class="text-right"><a id="edit" class="btn btn-success btn-xs"
                                                          onclick="updateRow(${client.id})"><i
                                        class="glyphicon glyphicon-pencil"></i><s:message
                                        code="messages.edit"/></a>
                                    <a id="delete" class="btn btn-danger t btn-xs" onclick="deleteRow(${client.id})"><i
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

<!--Подвал сайта-->
<jsp:include page="fragments/footer.jsp"/>

<!-- Modal -->
<div id="editRow" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 id="modal_title" class="modal-title"><i class="glyphicon glyphicon-user"></i><span></span>
                </h3>
            </div>
            <div class="modal-body">
                <form:form style="margin-bottom: -8px" class="form-horizontal" method="post"
                           id="detailsForm">
                    <input name="id" hidden="hidden" type="text" id="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="firstname">
                            <s:message code="messages.firstname"/>:</label>

                        <div class="col-sm-10">
                            <input name="firstname" type="text" class="form-control input-sm" id="firstname"
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="lastname">
                            <s:message code="messages.lastname"/>:</label>

                        <div class="col-sm-10">
                            <input name="lastname" type="text" class="form-control input-sm" id="lastname"
                                   placeholder="<s:message code="messages.input.lastname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="birthday">
                            <s:message code="messages.birthday"/>:</label>

                        <div class="col-sm-10">
                            <input name="birthday" type="text" class="form-control input-sm" id="birthday"
                                   placeholder="<s:message code="messages.input.birthday"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="address">
                            <s:message code="messages.address"/>:</label>

                        <div class="col-sm-10">
                            <input name="address" type="text" class="form-control input-sm" id="address"
                                   placeholder="<s:message code="messages.input.address"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="passport">
                            <s:message code="messages.passport"/>:</label>

                        <div class="col-sm-10">
                            <input name="passport" type="text" class="form-control input-sm" id="passport"
                                   placeholder="<s:message code="messages.input.passport"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="email">
                            <s:message code="messages.email"/>:</label>

                        <div class="col-sm-10">
                            <input name="email" type="email" class="form-control input-sm" id="email"
                                   placeholder="<s:message code="messages.input.email"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm"
                               for="password">
                            <s:message code="messages.password"/>:</label>

                        <div class="col-sm-10">
                            <input name="password" type="text" class="form-control input-sm" id="password"
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

    $(document).ready(function () {
        $('#table').DataTable();
    });

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('#id').val(0);
        $('#modal_title').find('span').text('<s:message code="messages.client_create"/>');
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
            $('#modal_title').find('span').text('<s:message code="messages.client_edit"/>');
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

        $(document).ajaxError(function (event, jqXHR, options, jsExc) {
            failNoty(event, jqXHR, options, jsExc);
        });

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    }


</script>

<style scoped>
    .table-hover tbody tr:hover td {
        background-color: #54535c;
        color: white;
    }

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
            background-color: #3a434d;
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

    #left-panel li:hover a {
        background-color: #3a434d;
        color: white;
    }
</style>
</body>
</html>