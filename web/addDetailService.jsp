<%-- 
    Document   : addDetailService
    Created on : May 31, 2022, 11:35:29 AM
    Author     : Minh Hoàng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Detail Service Page</title>
    </head>
    <body>
        <%
            String mess = (String) request.getAttribute("MESSAGE");
            if (mess == null) {
                mess = "";
            }
            String serID = (String) request.getParameter("serID");
        %>
        <form action="MainController" method="POST">
            Detail ID<input type="text" name="detailID" required=""><br>
            New Index<input type="number" name="nIndex" required=""><br>
            Old Index<input type="number" name="oIndex" required=""><br>
            Price<input type="text" name="price" required=""><br>
            <input type="hidden" name="serID" value="<%=serID%>">
            <input type="submit" name="action" value="AddDetailService"><br>
        </form>      
        <h1><%=mess%></h1>
    </body>
</html>
