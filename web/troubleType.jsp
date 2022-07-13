<%-- 
    Document   : troubleType
    Created on : Jun 14, 2022, 4:22:55 PM
    Author     : Trieu Do
--%>

<%@page import="dto.TroubleTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trouble Type Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <form action="MainController">
            <input type="submit" name="action" value="CreateTypeTrouble"/>
        </form>

        <%
            String searchTypeTrouble = (String) request.getParameter("searchTypeTrouble");
            if (searchTypeTrouble == null) {
                searchTypeTrouble = "";
            }
        %>
        <form action="MainController">
            <input type="submit" name="action" value="SearchTypeTrouble"/>
        </form>


        <%
            List<TroubleTypeDTO> listTypeTrouble = (List<TroubleTypeDTO>) request.getAttribute("LIST_TYPE_TROUBLE");
            if (listTypeTrouble != null) {
                if (listTypeTrouble.size() > 0) {
        %>
        <div class="table-wrapper">
            <table border="1" class="fl-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Trouble Id</th>
                        <th>Trouble Name</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (TroubleTypeDTO troubleType : listTypeTrouble) {
                    %>
                <form action="MainController" >
                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="typeId" value="<%= troubleType.getTypeId()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="troubleName" value="<%= troubleType.getDetail()%>" required=""/>
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
