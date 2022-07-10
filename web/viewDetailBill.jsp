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
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
            <jsp:include page="headerUser.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
            <jsp:include page="headerUser.jsp"></jsp:include>
        </c:if>
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
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".bill").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>
</html>
