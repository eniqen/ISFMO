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
<c:set var="ajaxUrl" value="/ajax/contracts/"/>


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
                        <th>CLIENT_LASTNAME</th>
                        <th>CLIENT_FIRSTNAME</th>
                        <th>TARIFF</th>
                        <th>OPTIONS</th>
                        <th>ACTIVE</th>
                        <th>ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%--@elvariable id="contracts" type="java.util.List"--%>
                    <c:forEach items="${contracts}" var="contract">
                        <tr>
                            <td>${contract.id}</td>
                            <td>${contract.number.number}</td>
                            <td>${contract.client.lastname}</td>
                            <td>${contract.client.firstname}</td>
                            <td>${contract.tariff.title}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${contract.options.size() > 0}">
                                        <a data-toggle="tooltip"
                                           title="
                                               <c:forEach
                                               items="${contract.options}" var="option">${option.title}</br>
                                               </c:forEach>">подключено <span
                                                class="badge">${contract.options.size()}</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        не подключены
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><label class="checkbox-inline"><input type="checkbox" value="">${contract.blocked}
                            </label></td>
                            <td class="text-right"><a id="edit" class="btn btn-success btn-xs"
                                                      onclick="updateRow(${contract.id})"><i
                                    class="glyphicon glyphicon-pencil"></i> <s:message
                                    code="messages.edit"/></a>
                                <a id="delete" class="btn btn-danger t btn-xs"
                                   onclick="swalDelete(контракт ,'${contract.id}',${contract.id})"><i
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
                <form:form style="margin-bottom: -8px" class="form-horizontal"
                           id="detailsForm">
                    <input name="id" type="text" hidden="hidden" id="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="">
                            Номер телефона:</label>

                        <div class="col-sm-10">
                            <select id="numbers" class="form-control" name="number.id">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="">
                            Клиент:</label>

                        <div class="col-sm-10">
                            <select id="clients" class="form-control" name="client.id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="">
                            Тариф:</label>

                        <div class="col-sm-10">
                            <select id="tariffs" class="form-control" name="tariff.id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm">
                            Опции:</label>

                        <div id="select" class="col-sm-10">
                            <select id="options" multiple="multiple">
                            </select>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button id="save" type="button"
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

        /**
         * Ajax запрос на получение списка номеров
         */
        $.get('ajax/clients', function (data) {
            $.each(data, function (key, client) {
                $('#clients').append($('<option></option>').attr('value', client.id).text(client.lastname + ' ' + client.firstname));
            });
        });

        /**
         * Ajax запрос на получение списка номеров
         */
        $.get('ajax/numbers', function (data) {
            $.each(data, function (key, number) {
                $('#numbers').append($('<option></option>').attr('value', number.id).text(number.number));
            });
        });

        /**
         * Ajax запрос на получение списка опций
         */
        $.get('ajax/options', function (data) {
            var index = 0;
            $.each(data, function (key, option) {
                $('#options').append($('<option></option>').attr('value', option.id).text(option.title));
            });
        });

        /**
         * Ajax запрос на получение списка тариффов
         */
        $.get('ajax/tariffs', function (data) {
            $.each(data, function (key, tariff) {
                $('#tariffs').append($('<option></option>').attr('value', tariff.id).text(tariff.title));
            });
        });

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
        $('#modal_title').find('span').text('<s:message code="messages.contract_create"/>');
        $('#id').val(0);
        multy();
        $('#editRow').modal('show');
    });


    $("#save").click(function () {
        var options = [];
        $.each($('#options').find("option:selected"), function () {
            options.push($(this).val());
        });

        var sendRequest = {
            id: $('#id').val(),
            number: {id: $('#numbers').val()},
            client: {id: $('#clients').val()},
            tariff: {id: $('#tariffs').val()},
            contractOptions: []
        };

        for (var i = 0; i < options.length; i++) {
            sendRequest.contractOptions.push({
                id: options[i]
            });
        }

        swal($.ajax({
            type: "POST",
            contentType: "application/json",
            url: ajaxUrl + 'add',
            data: JSON.stringify(sendRequest),
            dataType: 'text',
            timeout: 100000,
            success: function () {
                swal('Изменения сохранены', '', 'success');
            },
            error: function () {
                swal('Изменения не сохранены', 'Во время сохранения произошла ошибка', 'error');
            }
        }))
    });

</script>
</body>
</html>