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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="js/js.js" ></script>
</html>
