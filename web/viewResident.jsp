<%-- 
    Document   : viewResident
    Created on : May 24, 2022, 12:50:30 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cư dân</title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>        
        <jsp:include page="headerEmp.jsp"></jsp:include>
            <form action="MainController" method="POST">
                <input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="ViewResident"/>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Resident ID</th>
                    <th>Owner ID</th>
                    <th>Name</th>
                    <th>dob</th>
                    <th>Gender</th>
                    <th>Job</th>
                    <th>Phone</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="resident" items="${requestScope.LIST_RESIDENT}" varStatus="counter">
                    <tr>
                        <td>${resident.residentId}                                

                        </td>
                        <td>
                            ${resident.ownerId}
                        </td>
                        <td>
                            ${resident.name}
                        </td>
                        <td>
                            ${resident.dob}
                        </td>
                        <td>
                            <c:if test="${resident.gender}">
                                Nam
                            </c:if>
                            <c:if test="${!resident.gender}">
                                Nữ
                            </c:if>

                        </td>
                        <td>${resident.job}</td>
                        <td>${resident.phone}</td>
                        <td>${resident.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
