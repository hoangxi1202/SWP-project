<%-- 
    Document   : employee
    Created on : May 23, 2022, 9:37:19 PM
    Author     : Minh Hoàng
--%>

<%@page import="dao.ServiceDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="entity.Service"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
//            if (loginUser == null || !"EM".equals(loginUser.getRoleID())) {
//                response.sendRedirect("login.jsp");
//                session.setAttribute("ERROR_MESSAGE", "Please Login as employee!");
//                return;
//            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>


        <a href="managerService.jsp">Quan Ly Dich vu</a>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <form action="MainController">
            Search<input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="SearchService"/>
        </form>
        <%
            List<Service> list = (List<Service>) request.getAttribute("LIST_SERVICE");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Create Date</th>
                    <th>Price</th>
                    <th>Update</th>
                    <th>Add detail</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Service s : list) {
                        int statusDetail = 0; // dont sow anything (0)
                        // show add detail with elec and water bill (1)
                        // show detail added (2)
                        ServiceDAO dao = new ServiceDAO();
                        if (dao.checkServiceHasDetail(s.getServiceId())){
                            statusDetail = 2;
                        }else{
                            statusDetail = 1;
                        }
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td><%= s.getServiceId()%></td>
                    <td>                  
                        <input type="text" name="serName" value="<%=s.getServiceName()%>"/>
                    </td>              
                     <td>
                        <input type="text" name="serDate" value="<%=s.getCreatedDate()%>"/>
                    </td>
                    <td>
                        <input type="text" name="serPrice" value="<%=s.getPrice()%>"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="UpdateService"/>
                        <input type="hidden" name="serID" value="<%=s.getServiceId()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/> 
                    </td>
                    <%
                        if (statusDetail == 1) {
                    %>
                    <td>
                        <input type="hidden" name="serID" value="<%=s.getServiceId()%>"/>
                        <input type="submit" name="action" value="AddDetailService"/>
                    </td>
                    <%
                        }
                        else if (statusDetail == 2) {
                    %>
                    <td>
                        <input type="hidden" name="serID" value="<%=s.getServiceId()%>"/>
                        <input type="submit" name="action" value="ViewDetailService"/>
                    </td>
                    <%
                    } else {
                    %>
                    <td>No detail
                    </td>
                    <%
                        }
                    %>
                    <td>
                        <input type="submit" name="action" value="RemoveService"/>
                        <input type="hidden" name="serID" value="<%=s.getServiceId()%>"/>
                        <input type="hidden" name="search" value="<%=search%>"/> 
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

        <form action="MainController">
            <input type="submit" name="action" value="ViewTrouble"/>
        </form>
        <a href="MainController?action=befResidentRequest" >Resident Request</a>
        <form action="MainController">
    <input type="text" name="search" value="${param.search}"/>
    <input type="submit" name="action" value="ViewResident"/>
</form>
    </body>

</html>
