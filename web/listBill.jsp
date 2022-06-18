<%-- 
    Document   : listBill
    Created on : Jun 18, 2022, 10:13:36 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Bill</title>
    </head>
    <body>
        <c:if test="${requestScope.LIST_ALL_BILL != null}">
            <c:if test="${not empty requestScope.LIST_ALL_BILL }">
                <c:forEach var="bill" items="${requestScope.LIST_ALL_BILL}" varStatus="counter">
                    Số hóa đơn: ${bill.billId} </br>
                    Tổng: ${bill.total}  VNĐ</br>
                    Ngày xuất hóa đơn: ${bill.date} </br>
                    <select name="status">
                        <c:if test="${bill.status == true}">
                            <option value="1">Đã thanh toán</option>
                        </c:if>
                        <c:if test="${bill.status == false}">
                            <option value="0">Chưa thanh toán</option>
                        </c:if>
                    </select>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="billId" value="${bill.billId}"/>
                        <input type="submit" name="action" value="ViewDetail"/>
                    </form>
                </c:forEach>

            </c:if>
        </c:if>
    </body>
</html>
