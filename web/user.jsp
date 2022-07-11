<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                session.setAttribute("ERROR_MESSAGE", "Please Login as user!");
                return;
            }
        %>
        <a href="addResident.jsp">Add Resident</a> </br>
        <a href="MainController?action=BeforeCreateTrouble"><button>Report a Trouble</button></a> </br>
        <a href="MainController?action=BeforeDeleteResident"><button>Request Remove Resident</button></a> </br>
        <a href="MainController?action=ViewBill"><button>Hoá đơn</button></a>
        <a href="changePassword.jsp"><button>Đổi mật khẩu</button></a>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".home").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>
</html>
