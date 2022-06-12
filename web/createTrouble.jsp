<%-- 
    Document   : createTrouble
    Created on : May 27, 2022, 10:36:10 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo sự cố</title>
    </head>
    <body>
        <form action="MainController">
            Căn hộ số: <input type="text" name="apartmentId" alt="" readonly="" value="${requestScope.APARTMENT_ID}"/></br>
            <select name="typeId">
                <c:if test="${requestScope.LIST_TYPE_TROUBLE !=null}">
                    <c:if test="${not empty requestScope.LIST_TYPE_TROUBLE}">
                        <c:forEach var="typeTrouble" items="${requestScope.LIST_TYPE_TROUBLE}" varStatus="counter">
                            <option value="${typeTrouble.typeId}">${typeTrouble.detail}</option>
                        </c:forEach>
                    </c:if>
                </c:if>
            </select>
            Nội dung: <input type="text" name="detail" required="" placeholder="Nội dung chi tiết" />
            <input type="submit" name="action" value="SendTrouble"/>

        </form>
        <a href="user.jsp">Hủy<a/>
    </body>
</html>
