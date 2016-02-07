<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <h2 class="page-header"><s:message code="messages.contracts"/></h2>

            <div class="row">

                <div class="panel-group" id="accordion">
                    <c:forEach items="${contracts}" var="contract" varStatus="index">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}">
                                        <strong>Договор №${contract.id}</strong></a>
                                    <form:form style="float: right" target="_blank" action="ajax/contracts/downloadPdf"
                                               method="post">
                                        <input type="hidden" name="id" value="${contract.id}">
                                        <button id="pdf" class="btn btn-info btn-xs" type="submit">
                                            <i class="glyphicon glyphicon-search"></i> Распечатать в PDF
                                        </button>
                                    </form:form>
                                </h4>

                            </div>
                            <div id="collapse${index.count}" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h4 style="margin-top: 5px" class="page-header">Описание:</h4>

                                    <form:form style="margin-bottom: -8px" class="form-horizontal" id="detailsForm">
                                        <input name="id" type="text" hidden="hidden" id="id">

                                        <div class="form-group">
                                            <label class="control-label col-sm-1 input-sm" for="client">
                                                Клиент :</label>

                                            <div class="col-sm-11">
                                                <input disabled="disabled" id="client" class="form-control"
                                                       name="contract.client.id"
                                                       value="${contract.client.lastname} ${contract.client.firstname}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-1 input-sm" for="number">
                                                Номер телефона:</label>

                                            <div class="col-sm-11">
                                                <input disabled="disabled" id="number" class="form-control"
                                                       name="contract.number.id" value="${contract.number.number}">

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-1 input-sm" for="tariff">
                                                Тариф:</label>

                                            <div class="col-sm-11">
                                                <select disabled="disabled" id="tariff" class="form-control"
                                                        name="contract.tariff.id">
                                                    <option>${contract.tariff.title}</option>
                                                </select>
                                            </div>
                                        </div>

                                        <c:if test="${contract.options.size() > 0}"><br>

                                            <div class="form-group">
                                                <label class="control-label col-sm-1 input-sm"> Опции:</label>

                                                <div class="col-sm-11">
                                                    <c:forEach items="${contract.options}" var="option"
                                                               varStatus="index">
                                                        <label class="checkbox-inline">
                                                            <input disabled="disabled" checked="checked" type="checkbox"
                                                                   value="">${option.title}
                                                        </label>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                            </ul>
                                        </c:if>
                                    </form:form>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>
<style scoped>

</style>
</body>
</html>
