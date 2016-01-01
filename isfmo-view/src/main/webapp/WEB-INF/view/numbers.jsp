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

<style>
    body {
        padding-top: 50px;
    }

    /*
     * Top navigation
     * Hide default border to remove 1px line.
     */
    .navbar-fixed-top {
        border: 0;
    }

    /*
     * Sidebar
     */

    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }

    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 50px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            background-color: #3a434d;
            border-right: 1px solid #eee;
        }
    }

    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px; /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 20px;
    }

    #left-panel li:hover a {
        background-color: #3a434d;
        color: white;
    }
</style>

<script>
    $(document).ready(function () {
        $('#table').DataTable();
    });
</script>
</body>
</html>



