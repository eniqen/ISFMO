<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title>Авторизация</title>
    <jsp:include page="fragments/headTag.jsp"/>
</head>

<body>
<jsp:include page="fragments/bodyHead.jsp"/>

<div class="container row">
    <c:if test="${error}">
        <div class="bg-danger">
            <b>Печаль</b>
        </div>
    </c:if>
</div>

<div class="container">
    <form style="margin-top: 50px" class="form-signin col-sm-4 col-md-offset-4" role="form"
          action="/j_spring_security_check" method="post">
        <img class="center-block" height="100px" src="/resources/images/t-mobile_iphone5.jpg" alt="T-mobile">

        <h3 class="form-signin-heading">Please sign in</h3>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="username" id="inputEmail" class="form-control" placeholder="E-mail" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password"
               required>

        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> <s:message code="messages.remember"/>
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
    </form>
</div>
<!-- /container -->

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
