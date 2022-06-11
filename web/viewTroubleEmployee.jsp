<%-- 
    Document   : viewTroubleEmployee
    Created on : May 26, 2022, 9:38:32 PM
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
                                <td>${trouble.troubleId}                                
                                    
                                </td>
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
                                    <form action="MainController">
                                        <select name="status">
                                            <c:if test ="${!trouble.status}">
                                                <option value="false" selected>Not Yet</option>
                                                <option value="true">Done</option>
                                            </c:if>
                                            <c:if test ="${trouble.status}">
                                                <option value="true" selected>Done</option>
                                                <option value="false">Not Yet</option>
                                            </c:if>
                                        </select>
                                        <input type="hidden" name="troubleId" value="${trouble.troubleId}"/>
                                        <input type="submit" name="action" value="UpdateTrouble"/> 

                                    </form>


                                </td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </c:if>
        </c:if>
    </body>
</html>
