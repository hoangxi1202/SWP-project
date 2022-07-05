<%-- 
    Document   : deleteResident
    Created on : Jun 7, 2022, 11:08:32 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Resident Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <div class="container">
                <form action="MainController" method="POST">
                <c:if test="${requestScope.LIST_RESIDENT != null}">
                    <c:if test="${not empty requestScope.LIST_RESIDENT }">
                        <c:forEach var="resident" items="${requestScope.LIST_RESIDENT}" varStatus="counter" >
                            <!--bat dau-->
                            <div class="resident">                            
                                <div class="form-row">                                
                                    <div class="col-md-8 mb-3">                                    
                                        <label for="validationServer01">Họ và tên: </label>
                                        <input type="text" class="form-control" id="validationServer03" readonly="" value="${resident.name}">
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="validationServer01">Giới tính: </label>
                                        <select class="custom-select form-control">
                                            <c:if test="${resident.gender}">
                                                <option selected="">Nam</option>
                                            </c:if>
                                            <c:if test="${!resident.gender}">
                                                <option selected="">Nữ</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row" >
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Sinh ngày: </label>
                                        <input type="date" class="form-control" id="validationServer01" value="${resident.dob}" readonly="" >
                                    </div>
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Nghề nghiệp: </label>
                                        <input type="text" class="form-control is-valid" id="validationServer01" value="${resident.job}" readonly="">
                                    </div>
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Số điện thoại: </label>
                                        <input type="text" class="form-control" id="validationServer01" value="${resident.phone}" readonly="">

                                    </div>
                                </div>
                                <div class="form-check-inline float-right">
                                    <label class="form-check-label">
                                        <input type="checkbox" name="delete" class="form-check-input" value="${resident.residentId}">Chọn
                                    </label>
                                </div>
                                </br>
                                <hr>
                            </div>

                            <!--ket thuc-->


                        </c:forEach>
                    </c:if>
                </c:if>
                <button type="submit" class="btn btn-primary float-right" name="action" style="padding: 0px 40px; margin: 10px 10px" value="DeleteResident">Xóa các mục đã chọn</button>
                <!--            <input type="submit" name="action" value="DeleteResident">-->
            </form>
            <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button><a/>
        </div>

    </body>
    <script>

    </script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="js/js.js" ></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
