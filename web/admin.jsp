
<%@page import="dto.ContractDTO"%>
<%@page import="dto.ApartmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                session.setAttribute("ERROR_MESSAGE", "Please Login as admin!");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <a href="managerAccount.jsp">Manager Account</a>

            <form action="MainController">
                <input type="submit" name="action" value="Logout"/>
            </form>
            <!--        <form action="MainController" method="POST">
                        Email<input type="email" name="email" />
                        <input type="submit" name="action" value="SendMail"/>
                    </form>-->
            <form action="MainController">
                Search User<input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>


        <%
            List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Delete</th>
                    <!--                    <th>Update</th>-->
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : list) {
                %>
            <form action="MainController" >
                <tr>
                    <td><%= count++%></td>
                    <td><%= user.getUserID()%></td>          
                    <td>
                        <%=user.getRoleID()%>
                    </td>                   
                    <td><%= user.getPassword()%></td>
                    <td>
             <!--//            <a href="MainController?action=Delete&userID=<%=user.getUserID()%>&search=<%=search%> " >Delete</a>--> 
                        <input type="submit" name="action" value="Delete"/>
                        <input type="hidden" name="userID" value="<%=user.getUserID()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/> 
                    </td>
                    <!--                    <td>
                                            <input type="submit" name="action" value="Update"/>
                                            <input type="hidden" name="userID" value="<%=user.getUserID()%>"/>
                                            <input type="hidden" name="search" value="<%=search%>"/> 
                                        </td>-->
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        }
        String error_message = (String) request.getAttribute("ERROR_MESSSAGE");
        if (error_message == null) {
            error_message = "";
        }
    %>
    <h1 ><%= error_message%></h1>
    <%
        }
    %>
</body>

<form action="MainController">
    <input type="submit" name="action" value="ViewTrouble"/>
</form>
<form action="MainController">
    <input type="text" name="search" value="${param.search}"/>
    <input type="submit" name="action" value="ViewResident"/>
</form>

<a href="troubleType.jsp">View Trouble Type</a><br>
<a href="viewContract.jsp">View Contract</a><br>


<%
    String searchApartment = (String) request.getParameter("searchApartment");
    if (searchApartment == null) {
        searchApartment = "";
    }
%>
<div class="input-group mb-3">
    <form action="MainController">
        <div class="input-group-prepend">
            <input type="text" name="searchApartment" class="form-control" value="<%= searchApartment%>"/>
        </div>
        <input type="submit" class="btn btn-outline-secondary" name="action" value="SearchApartment"/>
    </form>
</div>
<%
    List<ApartmentDTO> listApartment = (List<ApartmentDTO>) request.getAttribute("LIST_APARTMENT");
    if (listApartment != null) {
        if (listApartment.size() > 0) {
%>
<table border="1" class="table">
    <thead class="thead-light">
        <tr>
            <th scope="col">No</th>
            <th scope="col">Apartment ID</th>
            <th scope="col">Size</th>
            <th scope="col">Image</th>
            <th scope="col">Building Name</th>
            <th scope="col">Rent Price</th>
            <th scope="col">Sale Price</th>
            <th scope="col">Status</th>
        </tr>
    </thead>
    <tbody>

        <%
            int count = 1;
            for (ApartmentDTO apartment : listApartment) {
        %>
    <form action="MainController" >
        <tr>
            <td><%= count++%></td>
            <td>
                <input type="text" name="apartmentId" value="<%= apartment.getApartmentId()%>" readonly=""/>
            </td>
            <td>
                <input type="text" name="size" value="<%= apartment.getSize()%>" readonly=""/>
            </td>
            <td>
                <input type="text" name="image" value="<%= apartment.getImage()%>" required=""/>
                <div class="text-center">
                    <img  class="rounded"  src="<%=apartment.getImage()%>" width="50px" height="50px"/>
                </div>
            </td>
            <td>
                <input type="text" name="buildingName" value="<%= apartment.getBuildingName()%>" readonly=""/>
            </td>
            <td>
                <input type="number" name="rentPrice" value="<%= apartment.getRentPrice()%>" required=""/>
            </td>
            <td>
                <input type="number" name="salePrice" value="<%= apartment.getSalePrice()%>" required=""/>
            </td>
            <td>
                <input type="text" name="status" value="<%= apartment.getStatus()%>" required=""/>
            </td>

            <td>
                <input type="submit" name="action" value="UpdateApartmentStatus"/>
                <input type="hidden" name="searchApartment" value="<%= searchApartment%>"/>
            </td>
            <td>
                <input type="submit" name="action" value="UpdateApartment"/>
                <input type="hidden" name="searchApartment" value="<%= searchApartment%>"/>
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
<a href="MainController?action=Statistic">Thống kê</a>

</body>

</html>
