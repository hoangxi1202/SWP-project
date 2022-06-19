<%-- 
    Document   : viewBill
    Created on : Jun 16, 2022, 8:57:46 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin hóa đơn</title>
    </head>
    <body>
        <c:if test="${requestScope.LIST_BILL_PAID != null}">
            <c:if test="${not empty requestScope.LIST_BILL_PAID }">
                <c:forEach var="billPaid" items="${requestScope.LIST_BILL_PAID}" varStatus="counter">
                    Số hóa đơn: ${billPaid.billId} </br>
                    Tổng: ${billPaid.total}  VNĐ</br>
                    Ngày xuất hóa đơn: ${billPaid.date} </br>
                    Đã thanh toán
                    <form action="MainController" method="POST">
                        <input type="hidden" name="billId" value="${billPaid.billId}"/>
                        <input type="submit" name="action" value="ViewDetail"/>
                    </form>
                </c:forEach>
            </c:if>
        </c:if>
        <c:if test="${requestScope.LIST_BILL_UNPAID != null}">
            <c:if test="${not empty requestScope.LIST_BILL_UNPAID }">
                <c:forEach var="billUnpaid" items="${requestScope.LIST_BILL_UNPAID}" varStatus="counter">
                    Số hóa đơn: ${billUnpaid.billId} </br>
                    Tổng: ${billUnpaid.total} VNĐ </br> 
                    Ngày xuất hóa đơn: ${billUnpaid.date} </br>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="billId" value="${billUnpaid.billId}"/>
                        <input type="submit" name="action" value="Payment"/>
                    </form>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="billId" value="${billUnpaid.billId}"/>
                        <input type="submit" name="action" value="ViewDetail"/>
                    </form>
                    <form action="payment.jsp">
                        <input type="hidden" name="billId" value="${billUnpaid.billId}"/>
                        <input type="hidden" name="total" value="${billUnpaid.total}"/>
                        <input type="submit" value="Thanh toan"/>
                    </form>
                </c:forEach>
            </c:if>
        </c:if>
    </body>
</html>
