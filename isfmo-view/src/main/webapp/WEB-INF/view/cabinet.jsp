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
            <h1>Тут будут новости компании</h1>
        </div>
    </div>
</div>

</body>
</html>
