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
            <div>
                <h2><s:message code="messages.client.list"/>
                    <button style="float: right" id="add" class="modal-title btn btn-sm btn-info"><i
                            class="glyphicon glyphicon-plus"></i><s:message code="messages.create"/>
                    </button>
                </h2>
            </div>
            <hr>

            <div class="table-responsive">
                <table id="table" class="table table-striped table-condensed table-hover">
                    <thead>
                    <tr>
                        <th><s:message code="messages.firstname"/></th>
                        <th><s:message code="messages.lastname"/></th>
                        <th><s:message code="messages.birthday"/></th>
                        <th><s:message code="messages.address"/></th>
                        <th><s:message code="messages.email"/></th>
                        <th><s:message code="messages.passport"/></th>
                        <th> ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--@elvariable id="clients" type="java.util.List"--%>
                    <c:forEach var="client" items="${clients}">
                        <tr>
                            <td>${client.firstname}</td>
                            <td>${client.lastname}</td>
                            <td>${client.birthday}</td>
                            <td>${client.address}</td>
                            <td><a href="mailto:${client.email}">${client.email}</a></td>
                            <td>${client.passport}</td>
                            <td class="text-right"><a id="edit" class="btn btn-success btn-xs"
                                                      onclick="updateRow(${client.id})"><i
                                    class="glyphicon glyphicon-pencil"></i><s:message
                                    code="messages.edit"/></a>
                                <a id="delete" class="btn btn-danger t btn-xs" onclick="swalDelete('клиент','${client.lastname} ${client.firstname}',${client.id})"><i
                                        class="glyphicon glyphicon-trash"></i> <s:message
                                        code="messages.delete"/></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
                <h3 id="modal_title" class="modal-title"><i class="glyphicon glyphicon-user"></i> <span></span></h3>
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
    var russian = {
        "processing": "Подождите...",
        "search": "Фильтр:",
        "lengthMenu": "Показать _MENU_ записей",
        "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
        "infoEmpty": "Записи с 0 до 0 из 0 записей",
        "infoFiltered": "(отфильтровано из _MAX_ записей)",
        "infoPostFix": "",
        "loadingRecords": "Загрузка записей...",
        "zeroRecords": "Записи отсутствуют",
        "emptyTable": "В таблице отсутствуют данные",
        "paginate": {
            "first": "Первая",
            "previous": "Предыдущая",
            "next": "Следующая",
            "last": "Последняя"
        },
        "aria": {
            "sortAscending": ": активировать для сортировки столбца по возрастанию",
            "sortDescending": ": активировать для сортировки столбца по убыванию"
        }
    };
    $(document).ready(function () {
        $('#table').DataTable({
            "language": russian
        });
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
                swal('Сохранено!', 'Данные успешно сохранены', 'success');
                reloadPage();
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

</script>

</body>
</html>