<%-- 
    Document   : viewTroubleAdmin
    Created on : May 26, 2022, 5:36:04 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trouble Page</title>
    </head>
    <body>
        <c:if test="${requestScope.LIST_TROUBLE != null}">
            <c:if test="${not empty requestScope.LIST_TROUBLE }">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Trouble ID</th>
                            <th>Apartment ID</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Detail</th>
                            <th>Solution</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="trouble" items="${requestScope.LIST_TROUBLE}" varStatus="counter">
                            <tr>
                                <td>${trouble.troubleId}</td>
                                <td>
                                    ${trouble.apartment}
                                </td>
                                <td>
                                    ${trouble.ownerName}
                                </td>
                                <td>
                                    ${trouble.date}
                                </td>
                                <td>${trouble.typeName}</td>
                                <td>${trouble.detail}</td>
                                <td>${trouble.solution}</td>
                                <td>
                                    <c:if test ="${!trouble.status}">
                                        Not Yet
                                    </c:if>
                                    <c:if test ="${trouble.status}">
                                        Done
                                    </c:if>
                                </td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </c:if>
        </c:if>
    </body>
</html>
