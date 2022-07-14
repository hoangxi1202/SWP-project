<%-- 
    Document   : viewContract
    Created on : Jun 12, 2022, 3:44:02 PM
    Author     : Trieu Do
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="dto.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <a href="addContract.jsp">Tạo hợp đồng</a>
        <%
            String searchContract = (String) request.getParameter("searchContract");
            if (searchContract == null) {
                searchContract = "";
            }
        %>
        <form action="MainController">
            Search Contract<input type="text" name="searchContract" value="<%=searchContract%>"/>
            <input type="submit" name="action" value="SearchContract"/>
        </form>
        <%
            List<ContractDTO> listContract = (List<ContractDTO>) request.getAttribute("LIST_CONTRACT");
            if (listContract != null) {
                if (listContract.size() > 0) {
        %>
        <div class="table-wrapper">
            <table border="1" class="fl-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mã hợp đồng</th>
                        <th>Mã căn hộ</th>
                        <th>Tên chủ hộ</th>
                        <th></th>
                        <th>Ngày khởi tạo</th>
                        <th>Ngày kết thúc</th>
                        <th>Trạng thái</th>
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
                            <input type="text" name="fullName" value="<%= contract.getOwnerId()%>" readonly=""/>
                        </td>
                        <td>
                            <select>
                                <%
                                    try {
                                        String sql = "SELECT serviceName\n"
                                                + " FROM ContractDetail\n"
                                                + " GROUP BY serviceName";
                                        Connection conn = utils.Utils.getConnection();
                                        PreparedStatement ptm = conn.prepareStatement(sql);
                                        ResultSet rs = ptm.executeQuery();
                                        while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("serviceName")%>"><%=rs.getString("serviceName")%></option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                            </select>
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
        </div>

        <%
                }
            }
        %>   


    </body>
</html>
