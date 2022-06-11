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
        <a href="createTrouble.jsp">Trouble</a></br>
        <a href="addResident.jsp">Add Resident</a>
        <a href="MainController?action=BeforeCreateTrouble">Create Trouble</a>
        <a href="MainController?action=BeforeDeleteResident">Delete Resident</a>
    </body>
</html>
