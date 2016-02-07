<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
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

<div class="container-fluid">
    <div class="row">
        <jsp:include page="fragments/panel.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="page-header">Опции</h2>

            <div class="row">
                <div id="content" class="container">
                    <c:forEach items="${options}" var="option">

                        <div id="option" style="border:1px solid #000; border-radius:8px; margin: 5px 5px 5px 5px;"
                             class="col-sm-3 wig pull-center">
                            <span hidden="hidden">${option.id}</span><br>
                            <h4><strong><a href="#">${option.title}</a></strong></h4><br>
                            <h4>Подключение : ${option.connectionPrice}</h4><br>
                            <h4>Абонентская плата: ${option.price}</h4><br>
                            <button class="btn btn-danger">Добавить в корзину</button>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>


<style scoped>
    .wig {
        background: #fff;
    }

    .wig:hover {
        box-shadow: 0 0 22px rgba(0, 0, 0, .9);
        background-color: #ebebeb;
    }

    #option {
        cursor: pointer;
    }
</style>
</body>
</html>
