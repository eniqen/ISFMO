<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<body>
<table border=1>
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
        </tr>
    </c:forEach>
</table>
</body>
</html>
