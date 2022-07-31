<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên mật khẩu</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    </head>
    <body>
        <%
            String mess = (String) session.getAttribute("ERROR_MESSAGE");
            if (mess == null) {
                mess = "";
            }
        %>
        <c:if test="${sessionScope.USER!=null}">
            <c:if test="${not empty sessionScope.USER}">
                <div class="limiter">
                    <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                        <div class="wrap-login100 p-t-30 p-b-50">
                            <span class="login100-form-title p-b-41">
                                FORGOT PASSWORD
                            </span>
                            <form action="MainController" method="POST" class="login100-form validate-form p-b-33 p-t-5">
                                <div class="wrap-input100 validate-input" data-validate = "Enter username">
                                    <input class="input100" type="password" name="newPassword" placeholder="Mật khẩu mới" >
                                    <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                                </div>
                                <div class="wrap-input100 validate-input" data-validate="Enter password">
                                    <input class="input100" id="pass" type="password" name="reNewPassword" placeholder="Xác nhận mật khẩu mới" >
                                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                                </div>
                                <div class="container-login100-form-btn m-t-32">
                                    <p><%=mess%></p>
                                </div>
                                <input type="hidden" name="userId" value="${sessionScope.USER.userID}">
                                <div class="container-login100-form-btn m-t-32">
                                    <button type="submit" name="action" value="ForgotPassword" class="login100-form-btn">
                                        CONFIRM
                                    </button>
                                </div>                       
                            </form>
                        </div>
                    </div>
                </div>	
            </c:if>
        </c:if>

        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
    </body>
</html>