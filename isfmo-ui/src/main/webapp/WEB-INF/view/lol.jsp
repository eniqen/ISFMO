<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 05.12.2015
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/operator/addClient" method="post">
    <p>
    <input type="text" name="firstname" value="${client.firstname}" />
    <p>
    <input type="text" name="lastname" value="${client.lastname}" />
    <p>
    <input type="text" name="address" value="${client.address}" />
    <p>
    <input type="text" name="birthday" value="${client.birthday}" />
    <p>
    <input type="text" name="passport" value="${client.passport}" />
    <p>
    <input type="text" name="email" value="${client.email}" />
    <p>
    <input type="text" name="password" value="${client.password}" />
    <p>
    <input type="submit" name="Save" value="Save" />
</form>
</body>
</html>
