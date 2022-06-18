<%-- 
    Document   : payment.jsp
    Created on : Jun 18, 2022, 9:50:54 PM
    Author     : Nhat Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán hóa đơn</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Ngân hàng: <select name="bankName" type="checkbox">
                <option value="" selected>Ngân hàng</option>
                <option value="BANK01">VietcomBank</option>
                <option value="BANK02">Tien Phong Bank</option>
            </select>
            <input type="number" name="bankNumber" required="" />
            <input type="text" name="name" required="" />
            <input type="text" name="contexnt" value="" />
            <input type="submit" name="action" value="Payment" />
        </form>
    </body>
</html>
