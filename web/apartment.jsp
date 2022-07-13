<%-- 
    Document   : apartment
    Created on : Jul 11, 2022, 2:18:39 PM
    Author     : Trieu Do
--%>

<%@page import="dto.ApartmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartment Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <h1>Heloo</h1>
        <form action="MainController">
            <input type="submit" name="action" value="ViewApartmentType"/>
        </form>
        <%
            List<ApartmentDTO> listApartmentType = (List<ApartmentDTO>) request.getAttribute("LIST_APARTMENT_TYPE");
            if (listApartmentType != null) {
                if (!listApartmentType.isEmpty()) {
        %>
        <div class="table-wrapper">
            <table border="1" class="fl-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type Name</th>
                        <th>Rent Price</th>
                        <th>Sale Price</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ApartmentDTO elem : listApartmentType) {
                    %>
                <form action="MainController">
                </form>
                <tr>
                    <td>
                        <input type="text" name="apartmentTypeId" value="<%= elem.getApartmentTypeId() %>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="apartmentTypeId" value="<%= elem.getTypeName() %>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="apartmentTypeId" value="<%= elem.getRentPrice() %>" required=""/>
                    </td>
                    <td>
                        
                    </td>
                    <td></td>
                </tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <%          }
            }
        %>
    </body>
</html>
