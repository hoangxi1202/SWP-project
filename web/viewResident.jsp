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
        <title>Thong tin Cu Dan</title>
    </head>
    <body>
        <form action="MainController">
            <input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="ViewResident"/>
        </form>
        <c:if test="${requestScope.LIST_RESIDENT != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT }">
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
                                <!--                                <td>
                                                                    <form action="MainController">
                                                                        <select name="status">
                                <%--<c:if test ="${!trouble.status}">--%>
                                    <option value="false" selected>Not Yet</option>
                                    <option value="true">Done</option>
                                <%--</c:if>--%>
                                <%--<c:if test ="${trouble.status}">--%>
                                    <option value="true" selected>Done</option>
                                    <option value="false">Not Yet</option>
                                <%--</c:if>--%>
                            </select>
                            <input type="hidden" name="troubleId" value="${trouble.troubleId}"/>
                            <input type="submit" name="action" value="UpdateTrouble"/> 

                        </form>


                    </td>-->

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </c:if>
        </c:if>

    </body>
</html>
