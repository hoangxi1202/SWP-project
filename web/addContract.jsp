<%-- 
    Document   : addContract
    Created on : Jul 14, 2022, 12:20:39 AM
    Author     : Trieu Do
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add contract Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            Mã hợp đồng<input type="text" name="contractId" required=""/><br>
            Mã căn hộ<input type="text" name="apartmentId" required=""/><br>

            Mã chủ hộ<select name="ownerId">
                <%
                    try {
                        String sql = "SELECT ownerId FROM Owners";
                        Connection conn = utils.Utils.getConnection();
                        PreparedStatement ptm = conn.prepareStatement(sql);
                        ResultSet rs = ptm.executeQuery();
                        while (rs.next()) {
                %>
                <option value=" <%=rs.getString("ownerId")%>"><%=rs.getString("ownerId")%></option>
                <%
                        }
                    } catch (Exception e) {
                    }
                %>

            </select><br>

            Ngày khởi tạo<input type="date" name="startDate" required=""/><br>
            Ngày kết thúc<input type="date" name="endDate" required=""/><br>
            <input type="submit" name="action" value="CreateContract"/>
        </form>
        <%
            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
            if (error_message == null) {
                error_message = "";
            }
        %>
        <h1 ><%= error_message%></h1>
    </body>
</html>
