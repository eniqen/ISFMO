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
            <h2 class="page-header">Список номеров</h2>

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
                                    class="glyphicon glyphicon-plus"></i>Создать
                            </button>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--@elvariable id="tariffs" type="java.util.List<org.bitbucket.eniqen.model.Option>"--%>
                    <c:forEach items="${options}" var="option">
                        <tr>
                            <td>${option.id}</td>
                            <td>${option.title}</td>
                            <td>${option.price}</td>
                            <td>${option.connectionPrice}</td>
                            <td class="text-right"><a id="edit" class="btn btn-success btn-xs pull"
                                                      onclick="updateRow(${tariff.id})"><s:message
                                    code="messages.edit"/><i class="glyphicon glyphicon-pencil"></i></a>
                                <a id="delete" class="btn btn-danger btn-xs"
                                   onclick="deleteRow(${tariff.id})"><s:message
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

<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });
</script>
</body>
</html>



