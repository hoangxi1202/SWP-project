<%@page import="dao.ServiceDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="entity.Service"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Page</title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>
        <jsp:include page="headerEmp.jsp"></jsp:include>
        <jsp:include page="slider.jsp"></jsp:include>
            <h1 class="text-center">Chào mừng với BF Apartment</h1>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="js/js.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".home").addClass("active");
        });
    </script>
</html>
