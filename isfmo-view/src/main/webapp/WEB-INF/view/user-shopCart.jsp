<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 02.01.2016
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHead.jsp"/>
<c:set var="ajaxUrl" value="/ajax/shopCart/"/>


<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div>
                <h2>
                    Корзина
                </h2>
            </div>
            <hr>

            <div class="table-responsive">
                <table id="table" class="table table-striped table-condensed table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>COUNT</th>
                        <th>PRICE</th>
                        <%--<th>PRICE</th>--%>
                        <%--<th>OPTIONS</th>--%>
                        <%--<th>ACTIONS</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    <%--<jsp:useBean id="cart" scope="session"--%>
                    <%--class="org.bitbucket.eniqen.model.ShopCart"/>--%>
                    <%--${cart.items.size()}--%>

                    <c:forEach items="${sessionScope.get('scopedTarget.shopCart').items}" var="item">
                        <tr>
                            <td><label class="checkbox-inline"><input id="ch" type="checkbox"/>
                            </td>
                            <td>${item.key.id}</td>
                            <td>${item.key.title}</td>
                            <td>${item.value}</td>
                            <td>${item.key.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>
<script>
    var ajaxUrl = '${ajaxUrl}';
    var table = $('#table');
    $(document).ready(function () {
        $.ajax ({
            type: "POST",
            contentType: "application/json",
            url: ajaxUrl + 'add',
            data: "2",
            dataType: 'text',
            timeout: 100000,
            success: function (data) {
                swal('Сохранено!', 'Данные успешно сохранены', 'success');
            },
            error: function () {
                swal('Изменения не сохранены', 'Во время сохранения произошла ошибка', 'error');
            }
        });
    });

</script>
</body>
</html>
