<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Тест</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="row">
    <!-- Шапка -->
    <div class="col-md-12">
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><img src="../../bootstrap/1.jpg" class="img-circle"></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<div class="container">
    <div class="row">
        <!-- Левый блок -->
        <div class="col-sm-2">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#">Клиенты</a></li>
                <li><a href="#">Тарифы</a></li>
                <li><a href="#">Сообщение</a></li>
            </ul>
        </div>

        <!--Основной блок-->
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">Clients list</div>
                <!-- Таблица с клиентами -->
                <table class="table">
                    <tr>
                        <td><strong>ID</strong></td>
                        <td><strong>FIRSTNAME</strong></td>
                        <td><strong>LASTNAME</strong></td>
                        <td><strong>BIRTHDAY</strong></td>
                        <td><strong>ADDRESS</strong></td>
                        <td><strong>E-MAIL</strong></td>
                        <td><strong>PASSPORT</strong></td>
                        <td><strong>PASSWORD</strong></td>
                    </tr>
                    <%--@elvariable id="employees" type="java.util.List"--%>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.firstname}</td>
                            <td>${employee.lastname}</td>
                            <td>${employee.birthday}</td>
                            <td>${employee.address}</td>
                            <td>${employee.email}</td>
                            <td>${employee.passport}</td>
                            <td>${employee.password}</td>
                            <td>
                                <button type="button" class="btn btn-success navbar-btn btn-sm">Редактировать</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <!--Конец основного блока-->

    <div class="clearfix"></div>

    <!--Подвал сайта-->
    <div class="col-sm-12">
        <hr>
        <footer>
            <p>© Nemenko Mikhail 2016</p>
        </footer>
    </div>

</div>
</body>
</html>
