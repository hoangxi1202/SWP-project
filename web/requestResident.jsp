<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yêu cầu khách hàng</title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>
        <jsp:include page="headerEmp.jsp"></jsp:include>            
            Add:
            </br>
        <c:if test="${requestScope.LIST_RESIDENT_REQ != null}">
            <c:if test="${not empty requestScope.LIST_RESIDENT_REQ}">
                <c:forEach var="request" items="${requestScope.LIST_RESIDENT_REQ}" varStatus="counter" >
                    Request ID: ${request.requestId}    </br>                
                    Owner Name: ${request.fullName} 
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="hidden" name="todo" value="${request.todo}"/>
                        <input type="submit" name="action" value="AcceptRequest"/>
                    </form>
                    Action: ${request.todo}
                    <form action="MainController">
                        <input type="hidden" name="requestId" value="${request.requestId}"/>
                        <input type="submit" name="action" value="RejectRequest" />
                    </form>
                    List Resident: 
                    <c:forEach var="resident" items="${request.listRes}" varStatus="counter2" > </br>
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
        <jsp:include page="footer.jsp"></jsp:include>
    </body>    
</html>
