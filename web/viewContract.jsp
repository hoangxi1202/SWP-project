<%-- 
    Document   : viewContract
    Created on : Jun 12, 2022, 3:44:02 PM
    Author     : Trieu Do
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="dto.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract Page</title>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>

    </head>
    <body>
        <%
            String searchContract = (String) request.getParameter("searchContract");
            if (searchContract == null) {
                searchContract = "";
            }
        %>
        <form action="MainController">
            Search Contract<input type="text" name="searchContract" value="<%= searchContract%>"/>
            <input type="submit" name="action" value="SearchContract"/>
        </form>
        <%
            List<ContractDTO> listContract = (List<ContractDTO>) request.getAttribute("LIST_CONTRACT");
            if (listContract != null) {
                if (listContract.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Contract ID</th>
                    <th>Apartment ID</th>
                    <th>Full name</th>
                    <th>Service name</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ContractDTO contract : listContract) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="contractId" value="<%= contract.getContractId()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="apartmentId" value="<%= contract.getApartmentId()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= contract.getFullName()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="serviceName" value="<%= contract.getServiceName()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="date" name="startDate" value="<%= contract.getStartDate()%>" required>
                    </td>
                    <td>
                        <input type="date" name="endDate" value="<%= contract.getEndDate()%>"/>
                    </td>
                    <td>
                        <input type="text" name="status" value="<%= contract.getStatus()%>" readonly=""/>
                    </td>
                    <td>
                        <button type="submit" name="action" value="UpdateContract">Sửa</button>
                        <button type="submit" name="action" value="DeleteContract">Xóa</button>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>


    <%
            }
        }
    %>   

</body>
<c:if test="${requestScope.SUCCESS!=null}">
    <c:if test="${not empty requestScope.SUCCESS}">
        <script>
            $(document).ready(function () {
                alert("${requestScope.SUCCESS}");
            });
        </script>
    </c:if>
</c:if>
<c:if test="${requestScope.ERROR!=null}">
    <c:if test="${not empty requestScope.ERROR}">
        <script>
            $(document).ready(function () {
                alert("${requestScope.ERROR}");
            });
        </script>
    </c:if>
</c:if>
</html>
