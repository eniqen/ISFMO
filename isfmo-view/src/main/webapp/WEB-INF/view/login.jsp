<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title><s:message code="massages.authorization"/></title>
    <jsp:include page="fragments/headTag.jsp"/>
</head>

<body>
<jsp:include page="fragments/bodyHead.jsp"/>

<div class="container">
    <form style="margin-top: 100px" class="form-signin col-sm-4 col-md-offset-4" role="form"
          action="/j_spring_security_check" method="post">
        <img class="center-block" height="100px" src="<c:url value="/resources/images/t-mobile_iphone5.jpg"/>"
             alt="T-mobile">

        <h3 class="form-signin-heading"><s:message code="messages.authorization.message"/></h3>
        <label for="inputEmail" class="sr-only"><s:message code="messages.email"/></label>
        <input name="user_login" id="inputEmail" class="form-control" placeholder="E-mail" required autofocus>
        <label for="inputPassword" class="sr-only"><s:message code="messages.password"/></label>
        <input name="password_login" type="password" id="inputPassword" class="form-control" placeholder="Password"
               required>

        <div class="checkbox">
            <label>
                <input name="remember-me-parameter" type="checkbox" value="remember-me"> <s:message
                    code="messages.remember"/>
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit"><s:message code="messages.sign_in"/></button>
    </form>

    <div class="container row col-sm-12 text-center">
        <c:if test="${error}">
            <div class="bg-danger">
                <h3>Введен неверный логин или пароль</h3>
            </div>
        </c:if>
    </div>
</div>
<!-- /container -->
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
