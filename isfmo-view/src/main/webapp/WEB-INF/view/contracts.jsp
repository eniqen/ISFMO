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
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<c:set var="ajaxUrl" value="/ajax/tariffs/"/>


<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div>
                <h2>
                    <s:message code="messages.contract.list"/>
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
                        <th>#</th>
                        <th>NUMBER</th>
                        <th>CLIENT_FIRSTNAME</th>
                        <th>CLIENT_LASTNAME</th>
                        <th>TARIFF</th>
                        <th>OPTIONS</th>
                        <th>BLOCKED</th>
                        <th>ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%--@elvariable id="contracts" type="java.util.List"--%>
                    <c:forEach items="${contracts}" var="contract">
                        <tr>
                            <td>${contract.id}</td>
                            <td>${contract.number.number}</td>
                            <td>${contract.client.firstname}</td>
                            <td>${contract.client.lastname}</td>
                            <td>${contract.tariff.title}</td>
                            <td>${contract.option.title}</td>
                            <td>${contract.blocked}</td>
                            <td class="text-right"><a id="edit" class="btn btn-success btn-xs"
                                                      onclick="updateRow(${contract.id})"><i
                                    class="glyphicon glyphicon-pencil"></i> <s:message
                                    code="messages.edit"/></a>
                                <a id="delete" class="btn btn-danger t btn-xs" onclick="deleteRow(${contract.id})"><i
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

<jsp:include page="fragments/footer.jsp"/>

<!-- Modal -->
<div id="editRow" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button id="closeModal" type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 id="modal_title" class="modal-title"><i class="glyphicon glyphicon-list-alt"></i> <span></span></h3>
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
                                   placeholder="<s:message code="messages.input.firstname"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm">
                            <s:message code="messages.tariff.price"/>:</label>

                        <div class="col-sm-10">
                            <input name="price" type="text" class="form-control input-sm" id="price"
                                   placeholder="<s:message code="messages.input.price"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm">
                            <s:message code="messages.options"/>:</label>

                        <div id="select" class="col-sm-10">
                            <select id="options" name="options" multiple="multiple">
                            </select>
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
        /**
         * Ajax запрос на получение списка опций в прорисовке их в мультиселекте
         */
        $.get('ajax/options', function (data) {
            $.each(data, function (key, option) {
                $('#options').append($('<option></option>').attr('value', option.id).text(option.title));
            });
        });

        $('#table').DataTable();

    });

    function multy() {
        $('#options').multiselect({
            enableFiltering: true,
            includeSelectAllOption: true,
            maxHeight: 260,
            buttonWidth: 468
        });
        $("#options").multiselect('rebuild');
    }
    /**
     * Тултипы для отображения списка подключенных опций у тарифа
     */
    $('[data-toggle="tooltip"]').tooltip({html: true});

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('#modal_title').find('span').text('<s:message code="messages.tariff_create"/>');
        $('#id').val(0);
        multy();
        $('#editRow').modal('show');
    });

    form.submit(function () {
        save();
        return false;
    });

    /**
     * При сохранении пробегаемся по списку выбранных тарифов и собираем строчку Json
     */
    function save() {
        var options = [];
        $.each($('#options').find("option:selected"), function () {
            options.push($(this).val());
        });

        var sendRequest = {
            id: $('#id').val(),
            title: $('#title').val(),
            price: $('#price').val(),
            options: []
        };

        for (var i = 0; i < options.length; i++) {
            sendRequest.options.push({
                id: options[i]
            });
        }

        $.ajax ({
            type: "POST",
            contentType: "application/json",
            url: ajaxUrl + 'add',
            data: JSON.stringify(sendRequest),
            dataType: 'text',
            timeout: 100000,
            success: function (data) {
                $('#editRow').modal('hide');
                successNoty('Сохранено');
            }
        });
    }

    /**
     * Редактирование тарифа
     * @param id идентификатор тарифа
     */
    function updateRow(id) {
        $("option:selected").prop("selected", false);
        $.get(ajaxUrl + id + '/edit', function (data) {
            $.each(data, function (key, value) {
                form.find("input[name='" + key + "']").val(value);
                if (key === 'options') {
                    $.each(value, function (index, option) {
                        form.find("option[value='" + option.id + "']").prop("selected", true);
                    });
                }
            });
            multy();
            $('#modal_title').find('span').text('<s:message code="messages.contract_edit"/>');
            $('#editRow').modal();
        });
    }

    /**
     * Удаление тарифа
     * @param id идентификатор тарифа
     */
    function deleteRow(id) {
        $.ajax({
            url: ajaxUrl + id + '/delete',
            type: 'DELETE',
            success: function () {
                successNoty('Deleted');
            }
        });
    }
</script>

<style scoped>
    .table-hover tbody tr:hover td {
        background-color: #54535c;
        color: white;
    }

    .table-hover tbody tr:hover td a {
        color: white;
        cursor: pointer;
    }
</style>
</body>
</html>