<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Тест</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../jquery-ui/jquery-ui.css">
    <script src="../../jquery-ui/jquery-ui.js"></script>
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
                <li class="active"><a href="#">Контракты</a></li>
                <li><a href="#">Клиенты</a></li>
                <li><a href="#">Тарифы</a></li>
                <li><a href="#">Сообщение</a></li>
            </ul>
        </div>

        <!--Основной блок-->
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">Список клиентов

                    <button type="button" class="btn btn-success btn-sm glyphicon glyphicon-plus" data-toggle="modal"
                            data-target="#clientModal">
                    </button>
                    <!-- Modal -->
                    <div id="clientModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title glyphicon glyphicon-user"> Создание клиента</h3>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm" for="firstname">Имя:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="firstname"
                                                       placeholder="Введите имя">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm"
                                                   for="lastname">Фамилия:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="lastname"
                                                       placeholder="Введите фамилию">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm" for="birthday">Дата
                                                рождения:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="birthday"
                                                       placeholder="Введите дату рождения">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm" for="address">Адрес:</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="address"
                                                       placeholder="Введите адрес">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm"
                                                   for="passport">Паспорт:</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="passport"
                                                       placeholder="Введите серию и номер паспорта">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm" for="e-mail">Е-мейл:</label>

                                            <div class="col-sm-10">
                                                <input type="email" class="form-control input-sm" id="e-mail"
                                                       placeholder="Введите е-мейл">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2 input-sm"
                                                   for="password">Пароль:</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control input-sm" id="password"
                                                       placeholder="Введите пароль">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default glyphicon glyphicon-floppy-save" data-dismiss="modal"> Сохранить
                                    </button>
                                    <button type="button" class="btn btn-default glyphicon glyphicon-floppy-remove" data-dismiss="modal"> Отменить</button>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <!-- Таблица с клиентами -->
                <table class="table table-striped table-bordered table-condensed table-hover">
                    <tr>
                        <td hidden="true"><strong>ID</strong></td>
                        <td><strong>FIRSTNAME</strong></td>
                        <td><strong>LASTNAME</strong></td>
                        <td><strong>BIRTHDAY</strong></td>
                        <td><strong>ADDRESS</strong></td>
                        <td><strong>E-MAIL</strong></td>
                        <td><strong>PASSPORT</strong></td>
                        <td></td>
                    </tr>
                    <%--@elvariable id="employees" type="java.util.List"--%>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td hidden="true">${employee.id}</td>
                            <td>${employee.firstname}</td>
                            <td>${employee.lastname}</td>
                            <td>${employee.birthday}</td>
                            <td>${employee.address}</td>
                            <td>${employee.email}</td>
                            <td>${employee.passport}</td>
                            <td>
                                <button type="button" class="btn btn-success navbar-btn btn-sm glyphicon glyphicon-pencil"> Edit</button>
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
<script>
    $(function() {
        $( "#birthday" ).datepicker();
    });
</script>
</body>
</html>
