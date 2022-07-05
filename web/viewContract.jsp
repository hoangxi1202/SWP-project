<%-- 
    Document   : viewContract
    Created on : Jun 12, 2022, 3:44:02 PM
    Author     : Trieu Do
--%>

<%@page import="java.util.List"%>
<%@page import="dto.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract Page</title>
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
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ContractDTO contract : listContract) {
                %>
            <form action="MainController" >
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
                        <input type="text" name="startDate" value="<%= contract.getStartDate()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="endDate" value="<%= contract.getEndDate()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="status" value="<%= contract.getStatus()%>" readonly=""/>
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
</html>
