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
                                               </c:forEach>">опции ${tariff.options.size()}шт.
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a>опции не подключены</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-right"><a id="edit" class="btn btn-success btn-sm pull"
                                                          onclick="updateRow(${tariff.id})"><s:message
                                        code="messages.edit"/><i class="glyphicon glyphicon-pencil"></i></a>
                                    <a id="delete" class="btn btn-danger btn-sm"
                                       onclick="deleteRow(${tariff.id})"><s:message
                                            code="messages.delete"/><i
                                            class="glyphicon glyphicon-trash"></i></a>
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
                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm">
                            <s:message code="messages.options"/>:</label>

                        <div class="col-sm-10">
                            <select id="multi-select" name="field" multiple="multiple">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
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
</div>
<!-- Конец модального окна-->

<script type="text/javascript">
    $(document).ready(function () {

        $('[data-toggle="tooltip"]').tooltip({html: true});

        $('#add').click(function () {
            $('#editRow').modal('show');
        });

        $('#multi-select').multiselect();
    });
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
