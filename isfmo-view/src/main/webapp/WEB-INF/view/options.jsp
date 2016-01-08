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
<c:set var="ajaxUrl" value="tarrifs/"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="page-header"><s:message code="messages.option.list"/></h2>

            <div class="table-responsive">
                <table id="table" class="table table-striped table-condensed table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>TITLE</th>
                        <th>PRICE</th>
                        <th>CONNECTION PRICE</th>
                        <th>
                            <button id="add" class="modal-title btn btn-xs btn-info pull-right"><i
                                    class="glyphicon glyphicon-plus"></i> <s:message code="messages.create"/>
                            </button>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--@elvariable id="options" type="java.util.List"--%>
                    <c:forEach items="${options}" var="option">
                        <tr>
                            <td>${option.id}</td>
                            <td>${option.title}</td>
                            <td>${option.price}</td>
                            <td>${option.connectionPrice}</td>
                            <td class="text-right"><a id="edit" class="btn btn-success btn-xs pull"
                                                      onclick="updateRow(${option.id})"><s:message
                                    code="messages.edit"/><i class="glyphicon glyphicon-pencil"></i></a>
                                <a id="delete" class="btn btn-danger btn-xs"
                                   onclick="deleteRow(${option.id})"><s:message
                                        code="messages.delete"/><i
                                        class="glyphicon glyphicon-trash"></i></a>
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

<script type="text/javascript">
    $(document).ready(function () {
        $('#table').DataTable();
    });

    $('#add').click(function () {
        $('#editRow').modal('show');
    });

    $('#multi-select').multiselect();
</script>
<style scoped>
    .table-hover tbody tr:hover td {
        background-color: #54535c;
        color: white;
    }
</style>
</body>
</html>
