<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="dandelion" uri="http://github.com/dandelion" %>

<html>
<head>
    <jsp:include page="fragments/headTag.jsp"/>
</head>

<body>
<jsp:include page="fragments/bodyHead.jsp"/>

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
                    <button align="right" type="button" class="btn btn-success btn-xs glyphicon glyphicon-plus"
                            data-toggle="modal"
                            data-target="#clientModal">
                    </button>
                </div>
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
                                <form style="margin-bottom: -8px" class="form-horizontal" role="form" method="POST"
                                      action="${pageContext.request.contextPath}/operator/addClient">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm" for="firstname">Имя:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="firstname"
                                                   name="firstname" value="${client.firstname}"
                                                   placeholder="Введите имя">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm"
                                               for="lastname">Фамилия:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="lastname"
                                                   name="lastname" value="${client.lastname}"
                                                   placeholder="Введите фамилию">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm" for="birthday">Дата
                                            рождения:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="birthday"
                                                   name="birthday" value="${client.birthday}"
                                                   placeholder="Введите дату рождения">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm" for="address">Адрес:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="address" name="address"
                                                   value="${client.address}"
                                                   placeholder="Введите адрес">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm"
                                               for="passport">Паспорт:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="passport"
                                                   name="passport" value="${client.passport}"
                                                   placeholder="Введите серию и номер паспорта">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm" for="email">Е-мейл:</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control input-sm" id="email" name="email"
                                                   value="${client.email}"
                                                   placeholder="Введите е-мейл">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 input-sm"
                                               for="password">Пароль:</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control input-sm" id="password"
                                                   name="password" value="${client.password}"
                                                   placeholder="Введите пароль">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit"
                                                class="btn btn-default glyphicon glyphicon-floppy-save"> Сохранить
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Таблица с клиентами -->
                <table class="table table-striped table-bordered table-condensed table-hover">
                    <tr>
                        <td><strong>Firstname</strong></td>
                        <td><strong>Lastname</strong></td>
                        <td><strong>Birthday</strong></td>
                        <td><strong>Address</strong></td>
                        <td><strong>E-mail</strong></td>
                        <td><strong>Passport</strong></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:forEach var="client" items="${clients}">
                        <tr>
                            <td>${client.firstname}</td>
                            <td>${client.lastname}</td>
                            <td>${client.birthday}</td>
                            <td>${client.address}</td>
                            <td>${client.email}</td>
                            <td>${client.passport}</td>
                            <td>
                                <a class="btn btn-success navbar-btn btn-sm btn-danger glyphicon glyphicon-pencil"
                                   href="<c:url value="/operator/edit?id=${client.id}"/>">Edit
                                </a>
                            </td>
                            <td>
                                <a class="btn btn-success navbar-btn btn-sm btn-danger glyphicon glyphicon-trash"
                                   href="<c:url value="/operator/delete?id=${client.id}"/>">Delete
                                </a>
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
    <jsp:include page="fragments/footer.jsp"/>
</div>
<script>
    $(function () {
        $("#birthday").datepicker();
    });
</script>
</body>
</html>
