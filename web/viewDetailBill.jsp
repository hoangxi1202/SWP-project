<%-- 
    Document   : viewDetailBill
    Created on : Jun 17, 2022, 11:31:01 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
        <c:if test="${requestScope.LIST_BILL_DETAIL_SERVICE!=null}" >
            <c:if test="${not empty requestScope.LIST_BILL_DETAIL_SERVICE }" >
                <c:forEach var="serviceDetail" items="${requestScope.LIST_BILL_DETAIL_SERVICE}" varStatus="counter">
                    Tên dịch vụ: ${serviceDetail.name} </br>
                    Giá dịch vụ theo đơn vị: ${serviceDetail.price} VNĐ</br>
                    Ngày ghi nhận: ${serviceDetail.date} </br>
                    Chỉ số cũ: ${serviceDetail.oldIndex} </br>
                    Chỉ số mới: ${serviceDetail.newIndex} </br>
                    Sử dụng: ${serviceDetail.usageIndex} </br>
                    Giá dịch vụ: ${serviceDetail.priceDetail} </br>
                </c:forEach>
            </c:if>
        </c:if>

        <hr>
        <c:if test="${requestScope.LIST_BILL_DETAIL!=null}" >
            <c:if test="${not empty requestScope.LIST_BILL_DETAIL }" >
                <c:forEach var="service" items="${requestScope.LIST_BILL_DETAIL}" varStatus="counter">
                    Tên dịch vụ: ${service.serviceName} </br>
                    Giá dịch vụ theo đơn vị: ${service.price} VNĐ</br>
                    Ngày ghi nhận: ${service.createdDate} </br>
                    Giá dịch vụ: ${service.priceDetail} </br>
                </c:forEach>
            </c:if>
        </c:if>

    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>
