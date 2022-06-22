<%-- 
    Document   : addResident
    Created on : Jun 6, 2022, 10:44:57 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Residents</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">

            <c:if test="${requestScope.RESIDENT_ERROR!=null}">
                <c:if test="${not empty requestScope.RESIDENT_ERROR }">
                    <form action="MainController" method="POST">
                        <div id="nhap">
                            <c:forEach var="error" items="${requestScope.RESIDENT_ERROR}" varStatus="s" >
                                <div>
                                    <div class="form-row">
                                        <div class="col-md-8 mb-3">
                                            <label for="validationServer01">Họ và tên: </label>
                                            <c:if test="${error.nameError eq ''}">
                                                <input type="text" class="form-control is-valid" id="validationServer01" name="name" placeholder="Name" value="${requestScope.RESIDENT[s.count-1].name}" required="">
                                                <div class="valid-feedback">
                                                    Tên hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.nameError ne ''}">
                                                <input type="text" class="form-control is-invalid" id="validationServer03" name="name" placeholder="Name" value="${requestScope.RESIDENT[s.count-1].name}" required>
                                                <div class="invalid-feedback">
                                                    ${error.nameError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationServer01">Giới tính: </label>
                                            <c:if test="${error.sexError eq ''}">
                                                <select class="custom-select form-control is-valid" name="gender">
                                                    <c:if test="${requestScope.RESIDENT[s.count-1].gender}">
                                                        <option value="1" selected="">Nam</option>
                                                        <option value="0">Nữ</option>
                                                    </c:if>
                                                    <c:if test="${!requestScope.RESIDENT[s.count-1].gender}">
                                                        <option value="1">Nam</option>
                                                        <option value="0" selected="">Nữ</option>
                                                    </c:if>
                                                </select>
                                                <div class="valid-feedback">
                                                    Hợp lệ!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.sexError ne ''}">
                                                <select class="custom-select form-control is-invalid" name="gender">
                                                    <option selected value="-1">Giới tính</option>
                                                    <option value="1">Nam</option>
                                                    <option value="0">Nữ</option>

                                                </select>
                                                <div class="invalid-feedback">
                                                    ${error.sexError}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-row" >
                                        <div class="col-md-4 mb-3" >
                                            <label for="validationServer02">Sinh ngày: </label>
                                            <c:if test="${error.dobError eq ''}">
                                                <input type="date" class="form-control is-valid" id="validationServer01" name="dob" placeholder="Date" value="${requestScope.RESIDENT[s.count-1].dob}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.dobError ne ''}">
                                                <input type="date" class="form-control is-invalid" id="validationServer03" name="dob" placeholder="Name" value="${requestScope.RESIDENT[s.count-1].dob}" required>
                                                <div class="invalid-feedback">
                                                    ${error.dobError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label for="validationServer02">Nghề nghiệp: </label>
                                            <c:if test="${error.jobError eq ''}">
                                                <input type="text" class="form-control is-valid" id="validationServer01" name="job" placeholder="Giáo viên..." value="${requestScope.RESIDENT[s.count-1].job}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.jobError ne ''}">
                                                <input type="text" class="form-control is-invalid" id="validationServer03" name="job" placeholder="Giáo viên..." value="${requestScope.RESIDENT[s.count-1].job}" required>
                                                <div class="invalid-feedback">
                                                    ${error.jobError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label for="validationServer02">Số điện thoại: </label>
                                            <c:if test="${error.phoneError eq ''}">
                                                <input type="text" class="form-control is-valid" id="validationServer01" name="phone" placeholder="0123456789..." value="${requestScope.RESIDENT[s.count-1].phone}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.phoneError ne ''}">
                                                <input type="text" class="form-control is-invalid" id="validationServer03" name="phone" placeholder="0123456789..." value="${requestScope.RESIDENT[s.count-1].phone}" required>
                                                <div class="invalid-feedback">
                                                    ${error.phoneError}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <input type="submit" class="btn btn-primary float-right" name="action" value="AddResident"/>
                    </form>
                </c:if>
            </c:if>

            <!-- Lần đầu chạy -->
            <c:if test="${requestScope.RESIDENT_ERROR==null}">
                <form action="MainController" method="POST">
                    <div id="nhap">
                        <div>
                            <div class="form-row">
                                <div class="col-md-8 mb-3">
                                    <label for="validationServer01">Họ và tên: </label>
                                    <input type="text" class="form-control" id="validationServer01" name="name" placeholder="Name" value="" required="">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationServer01">Giới tính: </label>
                                    <select class="custom-select" name="gender">
                                        <option selected>Giới tính</option>
                                        <option value="1">Nam</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row" >
                                <div class="col-md-4 mb-3" >
                                    <label for="validationServer02">Sinh ngày: </label>
                                    <input type="date" class="form-control" id="validationServer02" name="dob" placeholder="" value="2001-01-01" required="">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label for="validationServer02">Nghề nghiệp: </label>
                                    <input type="text" class="form-control" id="validationServer02" name="job" placeholder="Giáo viên..." value="" required="">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label for="validationServer02">Số điện thoại: </label>
                                    <input type="text" class="form-control" id="validationServer02" name="phone" placeholder="0123456789..." value="" required="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-primary float-right" name="action" value="AddResident"/>
                </form>
            </c:if>
        </div>

        <button onclick="addElement()" class="btn btn-outline-info">+</button>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function addElement() {
                let nhap = document.getElementById("nhap");
                let div = document.createElement("div");
                div.innerHTML = '<div> <hr>'
                        + '\n     <div class="form-row">'
                        + '\n          <div class="col-md-8 mb-3">'
                        + '\n             <label for="validationServer01">Họ và tên: </label>'
                        + '\n           <input type="text" class="form-control" id="validationServer01" name="name" placeholder="Name" value="" required="">'
                        + '\n         </div>'
                        + '\n          <div class="col-md-4 mb-3">'
                        + '\n             <label for="validationServer01">Giới tính: </label>'
                        + '\n               <select class="custom-select" name="gender">'
                        + '\n                 <option selected>Giới tính</option>'
                        + '\n                   <option value="1">Nam</option>'
                        + '\n                   <option value="0">Nữ</option>'
                        + '\n              </select>'

                        + '\n          </div>'
                        + '\n      </div>'
                        + '\n      <div class="form-row" >'
                        + '\n          <div class="col-md-4 mb-3" >'
                        + '\n               <label for="validationServer02">Sinh ngày: </label>'
                        + '\n              <input type="date" class="form-control" id="validationServer02" name="dob" placeholder="" value="" required="">'
                        + '\n          </div>'
                        + '\n         <div class="col-md-4 mb-3" >'
                        + '\n             <label for="validationServer02">Nghề nghiệp: </label>'
                        + '\n              <input type="text" class="form-control" id="validationServer02" name="job" placeholder="Giáo viên..." value="" required="">'
                        + '\n           </div>'
                        + '\n           <div class="col-md-4 mb-3" >'
                        + '\n              <label for="validationServer02">Số điện thoại: </label>'
                        + '\n              <input type="text" class="form-control" id="validationServer02" name="phone" placeholder="" value="" required="">'
                        + '\n          </div>'
                        + '\n      </div>'
                        + '\n  <button class="btn btn-outline-warning" onclick="removeElement()">-</button>'
                        + '\n   </div>';
                nhap.appendChild(div);
            }


        </script>
    </body>
</html>
