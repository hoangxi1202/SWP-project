<%-- 
    Document   : payment.jsp
    Created on : Jun 18, 2022, 9:50:54 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán hóa đơn</title>
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <form action="MainController" method="POST">
                Ngân hàng: <select name="bankName" type="checkbox">
                    <option value="" selected>Ngân hàng</option>
                    <option value="BANK01">VietcomBank</option>
                    <option value="BANK02">Tien Phong Bank</option>
                </select> </br>
                Số tài khoản: <input type="number" name="bankNumber" required="" /> </br>
                PIN: <input type="password" name="PIN" required="" /> </br>
                Tên chủ tài khoản: <input type="text" name="name" required="" /> </br>
                Nội dung chuyển tiền: <input type="text" name="content" value="" /> </br>
                <input type="hidden" name="billId" value="${param.billId}"/>
            <input type="hidden" name="total" value="${param.total}"/>
            <input type="submit" name="action" value="PayBill" /> </br>
            ${requestScope.BANK_ERROR}
        </form>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".bill").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>
</html>
