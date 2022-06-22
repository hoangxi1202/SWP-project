<%-- 
    Document   : createTrouble
    Created on : May 27, 2022, 10:36:10 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo sự cố</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <form action="MainController" method="POST">
                <div class="form-row" >
                    <div class="col-md-3 mb-3" >
                        <label>Căn hộ số: </label>
                        <input type="text" class="form-control" name="apartmentId" alt="" readonly="" value="${requestScope.APARTMENT_ID}"/>
                    </div>
                    <div class="col-md-3 mb-3" >
                        <label>Ngày: </label>
                        <input type="date" class="form-control" readonly="" id="time"/>
                    </div>
                    <div class="col-md-6 mb-3" >
                        <label>Loại sự cố: </label>
                        <select class="custom-select" name="typeId">
                            <c:if test="${requestScope.LIST_TYPE_TROUBLE !=null}">
                                <c:if test="${not empty requestScope.LIST_TYPE_TROUBLE}">
                                    <c:forEach var="typeTrouble" items="${requestScope.LIST_TYPE_TROUBLE}" varStatus="counter">
                                        <option value="${typeTrouble.typeId}">${typeTrouble.detail}</option>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </select>
                    </div>

                </div>
                <div class="form-row" >
                    <div class="col-md-12 mb-6">
                        <label>Nội dung chi tiết: </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" placeholder="Nội dung chi tiết ... " rows="3" required=""></textarea>                    
                    </div>
                </div>               
                    <button type="submit" style="padding: 0px 40px; margin: 10px 10px" class="btn btn-primary float-right" name="action" value="SendTrouble">Gửi</button>
            </form>
            <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button><a/>     
        </div>
    </body>
    <script>
        function getDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd;
            }

            if (mm < 10) {
                mm = '0' + mm;
            }

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("time").value = today;
        }


        window.onload = function () {
            getDate();
        };
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
