
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.ContractDTO"%>
<%@page import="dto.ApartmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Admin Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </head>
    <body>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <header class="header">
                <nav class="navbar">
                    <ul>
                        <li><a href="managerAccount.jsp">Manager Account</a></li>
                        <li><a href="troubleType.jsp">Trouble Type</a></li>
                        <li><a href="viewContract.jsp">Contract</a></li>
                    </ul>
                </nav>
            </header>
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
            <div class="table-wrapper">
                <table border="1" class="fl-table">
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
                    <form action="addOwner.jsp" method="POST">
                        <input type="hidden" name="userId" value="<%=user.getUserID()%>">
                        <button type="submit">AddOwner</button>
                    </form>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
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
            <form action="MainController">
                <input type="submit" name="action" value="ViewTrouble"/>
            </form>
            <form action="MainController">
                <input type="text" name="search" value="${param.search}"/>
                <input type="submit" name="action" value="ViewResident"/>
            </form>

            <%
                String searchApartment = (String) request.getParameter("searchApartment");
                if (searchApartment == null) {
                    searchApartment = "";
                }
            %>
            <a href="MainController?action=Statistic">Thống kê</a>
            <form action="MainController">
                <input type="text" name="searchApartment" value="<%= searchApartment%>"/>
                <input type="submit" name="action" value="SearchApartment"/>
            </form>


            <%
                List<ApartmentDTO> listApartment = (List<ApartmentDTO>) request.getAttribute("LIST_APARTMENT");
                if (listApartment != null) {
                    if (listApartment.size() > 0) {
            %>
            <div class="table-wrapper">
                <table border="1" class="fl-table">
                    <thead>
                        <tr>
                            <th style="width:15px">Apartment ID</th>
                            <th style="width:79px">Size</th>
                            <th style="width:194px">Image</th>
                            <th style="width:108px">Building Name</th>
                            <th style="width:115px">Rent Price</th>
                            <th style="width:120px">Sale Price</th>
                            <th style="width:120px">Status</th>
                        </tr>
                    </thead>
                </table>
                <table>
                    <tbody>
                        <%
                            for (ApartmentDTO apartment : listApartment) {
                        %>
                    <form action="MainController" >

                        <tr>
                            <td class="id">
                                <input type="text" name="apartmentId" value="<%= apartment.getApartmentId()%>" readonly="" style="width:154px"/>
                            </td>
                            <td>
                                <input type="text" name="size" value="<%= apartment.getSize()%>" readonly="" style="width:110px"/>
                            </td>
                            <td>
                                <input type="text" name="image" value="<%= apartment.getImage()%>" required="" style="width:275px"/>
                                <div class="img">
                                    <img class="rounded" src="<%=apartment.getImage()%>" width="100px" height="100px"/>
                                </div>
                            </td>
                            <td>
                                <input type="text" name="buildingName" value="<%= apartment.getBuildingName()%>" readonly="" style="width:163px"/>
                            </td>
                            <td>
                                <input type="number" name="rentPrice" value="<%= apartment.getRentPrice()%>" required="" style="width:162px"/>
                            </td>
                            <td>
                                <input type="number" name="salePrice" value="<%= apartment.getSalePrice()%>" required="" style="width:168px"/>
                            </td>
                            <td>
                                <input type="text" name="status" value="<%= apartment.getStatus()%>" required="" style="width:170px"/>
                            </td>

                            <td>

                                <button class="btn btn-outline-secondary" type="submit" name="action" value="UpdateApartmentStatus" style="width: 150px">Update status</button>
                                <input type="hidden" name="searchApartment" value="<%= searchApartment%>"/>
                            </td>
                            <td>
                                <button class="btn btn-outline-secondary" type="submit" name="action" value="UpdateApartment" style="width: 150px">Update</button>
                                <input type="hidden" name="searchApartment" value="<%= searchApartment%>"/>
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
            <c:forEach begin="1" end="${endP}" var="i">
                <a href="MainController?action=SearchApartment&index=${i}">${i}</a>
            </c:forEach>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
