<%-- 
    Document   : user
    Created on : May 23, 2022, 9:33:02 PM
    Author     : Minh Hoàng
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
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
    </body>
</html>
