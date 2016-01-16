<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<c:set var="ajaxUrl" value="/ajax/numbers/"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div>
                <h2><s:message code="messages.number.list"/>
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
                    </tr>
                    </thead>
                    <%--<tbody>--%>

                    <%--&lt;%&ndash;@elvariable id="numbers" type="java.util.List"&ndash;%&gt;--%>
                    <%--<c:forEach items="${numbers}" var="number">--%>
                    <%--<tr>--%>
                    <%--<td id="id">${number.id}</td>--%>
                    <%--<td id="number">${number.number}</td>--%>
                    <%--<td class="text-right">--%>
                    <%--<a id="delete" class="btn btn-danger btn-xs"--%>
                    <%--onclick="deleteRow(${number.id})"><s:message--%>
                    <%--code="messages.delete"/><i--%>
                    <%--class="glyphicon glyphicon-trash"></i></a>--%>
                    <%--</td>--%>
                    <%--</tr>--%>
                    <%--</c:forEach>--%>
                    <%--</tbody>--%>
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
                <h3 id="modal_title" class="modal-title"><i class="glyphicon glyphicon-phone"></i> <span></span></h3>
            </div>
            <div class="modal-body">
                <form:form style="margin-bottom: -8px" class="form-horizontal" method="post"
                           id="detailsForm">
                    <input name="id" hidden="hidden" type="text" class="id">

                    <div class="form-group">
                        <label class="control-label col-sm-2 input-sm" for="number">
                            <s:message code="messages.number"/>:</label>

                        <div class="col-sm-10">
                            <input name="number" type="text" class="form-control input-sm" id="number"
                                   placeholder="<s:message code="messages.input.number"/>">
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
    var table;

    $(document).ready(function () {
        table = $('#table').DataTable({
            dom: 'B<"clear">lfrtip',
            buttons: true,
            'ajax': {
                "type": "GET",
                contentType: 'application/json',
                "url": ajaxUrl,
                "data": function (d) {
                    d.id = $('#id').val();
                    d.number = $('#number').val();
                },
                "dataSrc": ""
            },
            'columns': [
                {"data": "id"},
                {"data": "number"}
            ]
        });
    });

    $('#add').click(function () {
        form.find(":input").each(function () {
            $(this).val("");
        });
        $('.id').val(0);
        $('#modal_title').find('span').text('<s:message code="messages.number_create"/>');
        $('#editRow').modal('show');
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
                table.ajax.reload();
                successNoty('Сохранено');
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



