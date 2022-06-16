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
    </head>
    <body>

        <c:if test="${requestScope.RESIDENT_ERROR!=null}">
            <c:if test="${not empty requestScope.RESIDENT_ERROR }">
                <div id="nhap">
                    <c:forEach var="error" items="${requestScope.RESIDENT_ERROR}" varStatus="s" >
                        <hr>
                        <form action="MainController" method="POST">
                            <div>
                                Name<input type="text" name="name" value="${requestScope.RESIDENT[s.count-1].name}" /></br>
                                ${error.nameError}</br>
                                DoB<input type="date" name="dob" value="${requestScope.RESIDENT[s.count-1].dob}" /></br>
                                ${error.dobError}</br>
                                Sex<select name="gender" type="checkbox">
                                    <option value="" selected>Choose Gender</option>
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select></br>
                                ${error.sexError}</br>
                                Job<input type="text" name="job" value="${requestScope.RESIDENT[s.count-1].job}" /></br>
                                ${error.jobError}</br>
                                Phone<input type="text" name="phone" value="${requestScope.RESIDENT[s.count-1].phone}" /></br>
                                ${error.phoneError}</br>
                            </div>
                        </form>

                    </c:forEach>
                </div>
                <input type="submit" name="action" value="AddResident"/>
            </c:if>
        </c:if>
        <c:if test="${requestScope.RESIDENT_ERROR==null}">
            <form action="MainController" method="POST">
                <div id="nhap">
                    <div>
                        Name<input type="text" name="name"  /></br>
                        DoB<input type="date" name="dob"  /></br>
                        Sex<select name="gender" type="checkbox">
                            <option value="" selected>Choose Gender</option>
                            <option value="1">Nam</option>
                            <option value="0">Nữ</option>
                        </select></br>
                        Job<input type="text" name="job" /></br>
                        Phone<input type="text" name="phone" /></br>
                    </div>
                </div>
                <input type="submit" name="action" value="AddResident"/>
            </form>
        </c:if>
        <button onclick="addElement()">+</button>
        <script>
            function addElement() {
                let nhap = document.getElementById("nhap");
                let div = document.createElement("div");
                div.innerHTML = '<div> <hr>'
                        + '\nName<input type="text" name="name"  /></br>'
                        + '\nDoB<input type="date" name="dob"  /></br>'
                        + '\nSex<select name="gender">'
                        + '\n<option value="" selected disabled hidden>Choose Gender</option>'
                        + '\n    <option value="1">Nam</option>'
                        + '\n   <option value="0">Nữ</option>'
                        + '\n </select></br>'
                        + '\nJob<input type="text" name="job" /></br>'
                        + '\nPhone<input type="tel" name="phone" /></br>'
                        + '\n</div>';
                nhap.appendChild(div);
            }


        </script>
    </body>
</html>
