<%--
  Created by IntelliJ IDEA.
  User: Mikhail
  Date: 02.01.2016
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <script src='/webjarslocator/jquery/jquery.min.js'></script>
    <script>
        var files = [];
        $(document).on("change", "#fileLoader", function (event) {
            files = event.target.files;
        });

        $(document).on("click", "#fileSubmit", function () {
            processUpload();
        });

        function processUpload() {
            var oMyForm = new FormData();
            oMyForm.append("file", files[0]);
            $.ajax({
                dataType: 'text',
                url: '/ajax/user/image',
                data: oMyForm,
                type: 'POST',
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                success: function (response) {
                    alert("ОКЕЙ");
                },
                error: function (xhr, err) {
                    alert("НЕОКЕЙ");
                }
            });
        }
    </script>
</head>

<body>
<input type="file" name="file" id="fileLoader"/>
<input type="button" id="fileSubmit" value="Upload"/>
</body>
</html>

