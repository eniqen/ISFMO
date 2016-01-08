<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 21.12.2015
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--<link type="text/css" rel="stylesheet" href="/resources/css/panel.css"/>--%>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="row pg-empty-placeholder text-center">
        <div>
            <img id="image" src="" alt="" class="img-circle text-center"
                 height="100"><br>

            <form enctype="multipart/form-data" method="post" name="fileinfo">
                <label class="btn btn-file btn-info btn-sm browse-button">
                    <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                    <input type="file" name="file" required/>
                </label>
                <button type="submit" class="btn btn-success btn-file btn-sm">
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </button>
                <label id="deleteImage" class="btn btn-danger btn-file btn-sm">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </label>
            </form>

        </div>

        <label style="margin-top: 10px" class="dropdown page-header col-sm-12">

            <a class="dropdown-toggle" data-toggle="dropdown">
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.username"/>
                </sec:authorize><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li id="profileEdit"><a>Редактировать</a></li>
                <li><a href="<c:url value="/logout"/>">Выйти</a></li>
            </ul>
        </label>
    </div>
    <ul id="left-panel" class="nav nav-sidebar">
        <li><a href="<c:url value="/cabinet"/>"><i class="glyphicon glyphicon-home"></i>  Главная</a></li>
        <sec:authorize access="hasRole('ROLE_OPERATOR')">
            <li><a href="<c:url value="/clients"/>"><i class="glyphicon glyphicon-user"></i>  <s:message code="messages.clients"/></a></li>
            <li><a href="<c:url value="/contracts"/>"><i class="glyphicon glyphicon-briefcase"></i>  <s:message code="messages.contracts"/></a></li>
            <li class="active"><a href="<c:url value="/tariffs"/>"><i class="glyphicon glyphicon-list-alt"></i>  <s:message code="messages.tariffs"/></a></li>
            <li><a href="<c:url value="/options"/>"><i class="glyphicon glyphicon-list"></i>  <s:message code="messages.options"/></a></li>
            <li><a href="<c:url value="/numbers"/>"><i class="glyphicon glyphicon-phone"></i>  <s:message code="messages.numbers"/></a></li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <li><a href="<c:url value="/user_contracts"/>">Контракты юзера</a></li>
            <li><a href="<c:url value="/user_tariffOptions"/>">Опции юзера</a></li>
        </sec:authorize>

    </ul>
</div>

<!-- Modal -->
<div id="profileModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title"><i class="glyphicon glyphicon-list-alt"></i>Редактирование</h3>
            </div>
            <div class="modal-body">
               
            </div>
        </div>
    </div>
</div>
<!-- Конец модального окна-->


<script>
    $(document).ready(function () {
        getImage();
    });

    function getImage() {
        $.ajax({
            type: "GET",
            url: '/ajax/user/image',
            success: function (data) {
                $('#image').attr('src', 'data:image/png;base64,' + data);
            },
            error: function (data) {
                $('#image').attr('src', '/resources/images/profile-pic-300px.jpg');
            }
        });
    }
    $('#deleteImage').click(function () {
        $.ajax({
            type: "DELETE",
            url: '/ajax/user/image',
            success: function (data) {
                getImage();
            }
        });
    });

    $('#profileEdit').click(function () {
        $('#profileModal').modal('show');
    });

    //        $("#uploadButton").on("click", function () {
    //            var form = document.forms.namedItem("fileinfo");
    //            var formData = new FormData(form);
    //            formData.append("CustomField", "This is some extra data");
    //            $.ajax({
    //                url: '/ajax/user/image',
    //                data: formData,
    //                dataType: 'text',
    //                processData: false,
    //                contentType: false,
    //                type: 'POST',
    //                success: function (response) {
    //                    alert("success");
    //                },
    //                error: function () {
    //                    alert("unable to create the record");
    //                }
    //            });
    //        });


    var form = document.forms.namedItem("fileinfo");
    form.addEventListener('submit', function (ev) {
        oData = new FormData(form);

        var oReq = new XMLHttpRequest();
        oReq.open("POST", '/ajax/user/image', true);
        oReq.onload = function (oEvent) {
            if (oReq.status == 200) {
                getImage();
            }
        };
        oReq.send(oData);
        ev.preventDefault();
    }, false);


</script>
<style scoped>
    body {
        padding-top: 50px;
    }

    /*
     * Top navigation
     * Hide default border to remove 1px line.
     */
    .navbar-fixed-top {
        border: 0;
    }

    /*
     * Sidebar
     */

    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }

    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 50px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            background-color: #3a434d;
            border-right: 1px solid #eee;
        }
    }

    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px; /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 30px;
        font-size: 18px;
        font-family: Consolas, monospace;
        font-weight: bold;
        line-height: 0.5;
    }

    #left-panel li:hover a {
        background-color: #999;
        color: white;
    }

    .browse-button {
        cursor: pointer;
        overflow: hidden;
        position: relative;
    }

    .browse-button input[type="button"] {
        cursor: pointer;
    }

    .browse-button input[type="file"] {
        width: 16px;
        position: absolute;
        right: 0px;
        top: 0px;
        cursor: pointer;
        opacity: 0;
        filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
    }
</style>