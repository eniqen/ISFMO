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

<c:set var="ajaxUrl" value="/ajax/tariffs/"/>

<div class="jumbotron">
    <div class="container">
        <div style="margin-top: 30px" class="row">
            <!-- Левый блок -->
            <div id="left-panel" class="col-sm-2">
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

                    <table class="table table-striped table-bordered table-condensed table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>TITLE</th>
                            <th>PRICE</th>
                            <th>OPTIONS</th>
                            <th>
                                <button id="add" class="modal-title btn btn-info pull-right"><i
                                        class="glyphicon glyphicon-plus"></i>Создать
                                </button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--@elvariable id="tariffs" type="java.util.List<org.bitbucket.eniqen.model.Tariff>"--%>
                        <c:forEach items="${tariffs}" var="tariff">
                            <tr>
                                <td>${tariff.id}</td>
                                <td>${tariff.title}</td>
                                <td>${tariff.price}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${tariff.options.size() > 0}">
                                            <a data-toggle="tooltip"
                                               title="
                                               <c:forEach
                                               items="${tariff.options}" var="option">${option.title}</br>
                                               </c:forEach>">подключено - ${tariff.options.size()}шт.
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a>не подключены</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-right"><a id="edit" class="btn btn-success btn-sm"
                                                          onclick="updateRow(${tariff.id})"><i
                                        class="glyphicon glyphicon-pencil"></i> <s:message
                                        code="messages.edit"/></a>
                                    <a id="delete" class="btn btn-danger t btn-sm" onclick="deleteRow(${tariff.id})"><i
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

<jsp:include page="fragments/footer.jsp"/>

<!-- Modal -->
<div id="editRow" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 id="modal_title" class="modal-title"><i class="glyphicon glyphicon-list-alt"></i><span></span></h3>
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
                            <s:message code="messages.tariff.title"/>:</label>

                        <div class="col-sm-10">
                            <input name="price" type="text" class="form-control input-sm" id="price"
                                   placeholder="<s:message code="messages.input.firstname"/>">
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

    $('[data-toggle="tooltip"]').tooltip({html: true});

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('#modal_title').find('span').text('<s:message code="messages.tariff_create"/>');
        $('#id').val(0);
        getAllOptions();
        $('#editRow').modal('show');
    });

    form.submit(function () {
        save();
        return false;
    });

    function getAllOptions() {
        $.get('ajax/options', function (data) {
            $.each(data, function (key, option) {
                $('#options').append($('<option></option>').attr('value', option.id).text(option.title));
            });
            $('#options').multiselect({
                enableFiltering: true,
                includeSelectAllOption: true,
                maxHeight: 400
            });
        });
    }

    function save() {
        var options = [];
        $.each($('#options').find("option:selected"), function(){
            options.push($(this).val());
        });

        var sendRequest = {
            id: $('#id').val(),
            title:  $('#title').val(),
            price: $('#price').val(),
            options: []
        };

        for (var i = 0; i < options.length; i++) {
            sendRequest.options.push({
                id: options[i]
            });
        }

        $.ajax ({
            url: ajaxUrl + 'add',
            type: "POST",
            data: JSON.stringify(sendRequest),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function () {
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

    #left-panel ul li:hover a {
        background-color: #54535c;
        color: white;
    }
</style>
</body>
</html>