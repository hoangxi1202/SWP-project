<%-- 
    Document   : viewBill
    Created on : Jun 16, 2022, 8:57:46 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin hóa đơn</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <!--NEW-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="text-center">
                            Hóa đơn
                        </h2>
                    </div>
                <c:if test="${requestScope.LIST_BILL != null}">
                    <c:if test="${not empty requestScope.LIST_BILL}">
                        <div class="table-responsive" id="no-more-tables">
                            <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                                <thead class="cf">
                                    <tr>
                                        <th>Số hóa đơn</th>
                                        <th>Tổng</th>
                                        <th>Ngày xuất hóa đơn</th>
                                        <th>Trạng thái</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="bill" items="${requestScope.LIST_BILL}" varStatus="counter">
                                        <tr>
                                            <td data-title="Số hóa đơn: " >${bill.billId}                               
                                            </td>                                       
                                            <td  data-title="Tổng: " >
                                                ${bill.total} VNĐ
                                            </td>
                                            <td data-title="Ngày xuất hóa đơn: " >
                                                <input class="text-center" type="date" value="${bill.date}" readonly="">                                               
                                            </td>
                                            <td data-title="Trạng thái: ">
                                                <c:if test="${bill.status}">
                                                    <button style="padding: 0px 28px; margin: 10px 10px" class="btn btn-primary btn-success">Đã Thanh toán</button>
                                                </c:if>
                                                <c:if test="${!bill.status}">
                                                    <form action="payment.jsp">
                                                        <input type="hidden" name="billId" value="${bill.billId}"/>
<<<<<<< HEAD
=======
                                                        <input type="hidden" name="total" value="${bill.total}"/>
>>>>>>> 6c99997a84b07f1e7c89e87c7685c2c0f839732b
                                                        <button type="submit" style="padding: 0px 40px; margin: 10px 10px" class="btn btn-warning" name="action" value="Payment">Thanh toán</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                            <td data-title="Chi tiết: " >
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="billId" value="${bill.billId}"/>
<<<<<<< HEAD
=======
                                                    <input type="hidden" name="total" value="${bill.total}"/>
>>>>>>> 6c99997a84b07f1e7c89e87c7685c2c0f839732b
                                                    <button type="submit" style="padding: 0px 40px; margin: 10px 10px" class="btn btn-primary" name="action" value="ViewDetail">Chi tiết</button>
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
                        <a class="page-link" href="MainController?action=ViewBill&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${tag-1!=0}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewBill&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${endP}" var="i">
                    <li class="page-item ${tag==i?"active":""}"><a class="page-link" href="MainController?action=ViewBill&index=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${tag==endP}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewBill&index=${tag+1}">Next</a>
                    </li>
                </c:if>
                <c:if test="${tag!=endP}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewBill&index=${tag+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!--END PAGING-->       

        <!--END-NEW-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".bill").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>
</html>
