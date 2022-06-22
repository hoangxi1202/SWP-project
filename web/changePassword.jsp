<%-- 
    Document   : changePassword.jsp
    Created on : Jun 16, 2022, 9:49:26 PM
    Author     : Nhat Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Mật khẩu cũ: <input type="password" name="oldPassword" value=""/>
            ${requestScope.PASSWORD_ERROR.oldPassError} </br>
            Mật khẩu mới: <input type="password" name="newPassword" value=""/>
            ${requestScope.PASSWORD_ERROR.newPassError}</br>
            Nhập lại mật khẩu mới: <input type="password" name="reNewPassword" value=""/>
            ${requestScope.PASSWORD_ERROR.reNewPassError}</br>
            <input type="submit" name="action" value="ChangePassword"/>
        </form>
    </body>
</html>
