<%-- 
    Document   : requestResident
    Created on : Jun 7, 2022, 8:26:33 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Resident Page</title>
    </head>
    <body>
        Add:
        </br>
        <c:if test="${requestScope.LIST_RESIDENT_ADD != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT_ADD }">
                <c:forEach var="resident" items="${requestScope.LIST_RESIDENT_ADD}" varStatus="counter" >
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
                </c:forEach>
            </c:if>
        </c:if>
                    <hr>
        Delete:
         </br>
        <c:if test="${requestScope.LIST_RESIDENT_DEL != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT_DEL }">
                <c:forEach var="resident" items="${requestScope.LIST_RESIDENT_DEL}" varStatus="counter" >
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
                </c:forEach>
            </c:if>
        </c:if>
    </body>
</html>
