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

                    <table class="table table-striped table-bordered table-condensed table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>TITLE</th>
                            <th>PRICE</th>
                            <th>
                                <button id="add" class="modal-title btn btn-info pull-right"><i
                                        class="glyphicon glyphicon-plus"></i>Создать
                                </button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tariffs}" var="tariff">
                            <tr>
                                <td>${tariff.id}</td>
                                <td>${tariff.title}</td>
                                <td>${tariff.price}</td>
                                <s:url var="url_update" value="/book/form/${tariff.id}"/>
                                <td><a id="edit" class="btn btn-success btn-sm pull"  onclick="updateRow(${tariff.id})"><s:message
                                        code="messages.edit"/></a>
                                    <a id="delete" class="btn btn-danger btn-sm"   onclick="deleteRow(${tariff.id})"><s:message
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
                    <div class="modal-body">
                        <select id="example-dropRight" multiple="multiple">
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
                            <option value="4">Option 4</option>
                            <option value="5">Option 5</option>
                            <option value="6">Option 6</option>
                        </select>
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
</div>
<!-- Конец модального окна-->

<script type="text/javascript">
    $(document).ready(function () {

        $('#add').click(function () {
            $('#editRow').modal('show');
        });

        $('#example-dropRight').multiselect({
            buttonWidth: '400px',
            dropRight: true
        });
    });
</script>
<style scoped>
    .table-hover tbody tr:hover td {
        background-color: #337ab7;
    }
</style>
</body>
</html>
