<%-- 
    Document   : requestResident
    Created on : Jun 7, 2022, 8:26:33 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Resident Page</title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>
        <jsp:include page="headerEmp.jsp"></jsp:include>
            Add:
            </br>
        <c:if test="${requestScope.LIST_RESIDENT_ADD != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT_ADD }">
                <c:forEach var="request" items="${requestScope.LIST_RESIDENT_ADD}" varStatus="counter" >

                    Request ID: ${request.requestId}    </br>                
                    Owner Name: ${request.fullName} 
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="hidden" name="todo" value="add" />
                        <input type="submit" name="action" value="AcceptRequest" />

                    </form>
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="submit" name="action" value="RejectRequest" />
                    </form>
                    List Resident: <c:forEach var="resident" items="${request.listRes}" varStatus="counter2" > </br>
                        Tên: ${resident.name} </br>
                        Giới tính: 
                        <c:if test="${resident.gender}">
                            Nam
                        </c:if>
                        <c:if test="${!resident.gender}">
                            Nữ
                        </c:if> </br>
                        Ngày sinh: ${resident.dob} </br>
                        Nghề nghiệp: ${resident.job} </br>
                        Số điện thoại: ${resident.phone}</br>
                        <hr>
                    </c:forEach>
                </c:forEach>
            </c:if>
        </c:if>
        <hr>
        <hr>
        Delete:
        </br>
        <c:if test="${requestScope.LIST_RESIDENT_DEL != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT_DEL }">
                <c:forEach var="request" items="${requestScope.LIST_RESIDENT_DEL}" varStatus="counter" >
                    Request ID: ${request.requestId}</br>
                    Owner Name: ${request.fullName} 
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="hidden" name="todo" value="delete" />
                        <input type="submit" name="action" value="AcceptRequest" />

                    </form>
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="submit" name="action" value="RejectRequest" />
                    </form>
                    List Resident: <c:forEach var="resident" items="${request.listRes}" varStatus="counter2" > </br>
                        Tên: ${resident.name} </br>
                        Giới tính: 
                        <c:if test="${resident.gender}">
                            Nam
                        </c:if>
                        <c:if test="${!resident.gender}">
                            Nữ
                        </c:if> </br>
                        Ngày sinh: ${resident.dob} </br>
                        Nghề nghiệp: ${resident.job} </br>
                        Số điện thoại: ${resident.phone}</br>
                        <hr>
                    </c:forEach>
                </c:forEach>
            </c:if>
        </c:if>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>    
</html>
