<%-- 
    Document   : addService
    Created on : May 30, 2022, 8:33:29 PM
    Author     : Minh Hoàng
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="entity.ServiceTypes"%>
<%@page import="dao.ServiceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add service Page</title>
    </head>
    <%
        ServiceDAO dao = new ServiceDAO();
        List<ServiceTypes> listType = dao.getListServiceType();
    %>
    <body>
        <form action="MainController" method="POST">
            Service ID
            <input type="text" name="serID" required=""><br>
            Service Name<input type="text" name="serName" required=""><br>
            Create Date<input type="date" name="serDate" required=""><br>
            Price<input type="text" name="serPrice" required=""><br>
            Type<select name="type">
                <%
                    for (ServiceTypes st : listType) {
                %>
                <option value="<%=st.getTypeId()%>"><%=st.getTypeName()%></option>
                <%
                    }
                %>
            </select><br>
            <input type="submit" name="action" value="AddService" >           
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
