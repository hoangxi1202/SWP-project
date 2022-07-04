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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>
