<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 21.12.2015
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHead.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="page-header"><s:message code="messages.number.list"/></h2>

            <div class="table-responsive">
                <table id="table" class="table table-striped table-condensed table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>NUMBER</th>
                        <th>
                            <button id="add" class="modal-title btn btn-xs btn-info pull-right"><i
                                    class="glyphicon glyphicon-plus"></i><s:message code="messages.create"/>
                            </button>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <%--@elvariable id="numbers" type="java.util.List"--%>
                    <c:forEach items="${numbers}" var="number">
                        <tr>
                            <td>${number.id}</td>
                            <td>${number.number}</td>
                            <td class="text-right">
                                <a id="delete" class="btn btn-danger btn-xs"
                                   onclick="deleteRow(${number.id})"><s:message
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
</script>
</body>
</html>



