<%-- 
    Document   : listBill
    Created on : Jun 18, 2022, 10:13:36 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Bill</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="headerEmp.jsp"></jsp:include>
        <!--NEW-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">
                        Hóa đơn
                    </h2>
                </div>
                <c:if test="${requestScope.LIST_ALL_BILL != null}">
                    <c:if test="${not empty requestScope.LIST_ALL_BILL}">
                        <div class="table-responsive" id="no-more-tables">
                            <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                                <thead class="cf">
                                    <tr>
                                        <th>Số hóa đơn</th>
                                        <th>Chung cư số</th>
                                        <th>Tổng</th>
                                        <th>Ngày xuất hóa đơn</th>
                                        <th>Trạng thái</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bill" items="${requestScope.LIST_ALL_BILL}" varStatus="counter">
                                        <tr>
                                            <td data-title="Số hóa đơn: " >${bill.billId}                               
                                            </td>
                                            <td data-title="Chung cư số: " >${bill.apartmentId}                                
                                            </td>                                          
                                            <td  data-title="Tổng: " >
                                                ${bill.total} VNĐ
                                            </td>
                                            <td data-title="Ngày xuất hóa đơn: " >
                                                <input class="text-center" type="date" value="${bill.date}" readonly="">                                               
                                            </td>
                                            <td  data-title="Trạng thái: " >
                                                <select name="status">
                                                    <c:if test="${bill.status == true}">
                                                        <option value="1">Đã thanh toán</option>
                                                    </c:if>
                                                    <c:if test="${bill.status == false}">
                                                        <option value="0">Chưa thanh toán</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                            <td data-title="Chi tiết: " >
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="billId" value="${bill.billId}"/>



                                                    <button type="submit" name="action" class="btn btn-outline-primary btn-form" value="ViewDetail">Chi tiết</button>

                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>                           
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </div>
        <!--PAGING-->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${tag-1==0}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewAllBill&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${tag-1!=0}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewAllBill&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${endP}" var="i">
                    <li class="page-item ${tag==i?"active":""}"><a class="page-link" href="MainController?action=ViewAllBill&index=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${tag==endP}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewAllBill&index=${tag+1}">Next</a>
                    </li>
                </c:if>
                <c:if test="${tag!=endP}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewAllBill&index=${tag+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!--END PAGING-->       

        <!--END-NEW-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="js/js.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".bill").addClass("active");
        });
    </script>
 </html>
