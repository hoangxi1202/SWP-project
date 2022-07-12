<%-- 
    Document   : homeAdmin.jsp
    Created on : Jul 8, 2022, 5:05:21 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
    </head>
    <body>
        <c:if test="${requestScope.ROOM_EMPTY != null}">
            Số phòng trống: ${requestScope.ROOM_EMPTY}
        </c:if>
        <c:if test="${requestScope.ROOM_NOT_EMPTY != null}">
            Số phòng đã thuê: ${requestScope.ROOM_NOT_EMPTY}
        </c:if>
        <c:if test="${requestScope.CONTRACT_AVAILABLE != null}">
            Số hợp đồng còn hạn: ${requestScope.CONTRACT_AVAILABLE}
        </c:if>
        <c:if test="${requestScope.CONTRACT_UNAVAILABLE != null}">
            Số hợp đồng đáo hạn: ${requestScope.CONTRACT_UNAVAILABLE}
        </c:if>
        <c:if test="${requestScope.RESIDENT != null}">
            Số cư dân: ${requestScope.RESIDENT}
        </c:if>
        <c:if test="${requestScope.MONEY != null}">
            Số tiền thu được: ${requestScope.MONEY}
        </c:if>




    </body>
</html>
