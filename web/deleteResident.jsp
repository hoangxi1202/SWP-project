<%-- 
    Document   : deleteResident
    Created on : Jun 7, 2022, 11:08:32 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Resident Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <c:if test="${requestScope.LIST_RESIDENT != null}">
                <c:if test="${not empty requestScope.LIST_RESIDENT }">
                    <c:forEach var="resident" items="${requestScope.LIST_RESIDENT}" varStatus="counter" >
                        Tên: ${resident.name} </br>
                        Giới tính: 
                        <c:if test="${resident.gender}">
                            Nam
                        </c:if>
                        <c:if test="${!resident.gender}">
                            Nữ
                        </c:if> </br>
                        Ngày sinh: ${resident.dob} </br>
                        Nghề nghiệp: ${resident.job} </br>
                        Số điện thoại: ${resident.phone}</br>
                        <input type="checkbox" name="delete" value="${resident.residentId}"/>                        
                        <hr>
                    </c:forEach>
                </c:if></c:if>
            <input type="submit" name="action" value="DeleteResident">
        </form>
    </body>
</html>
