<%-- 
    Document   : user
    Created on : May 29, 2024, 4:52:05 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/user.css" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <!--header of the page start here-->
        <%@include file="assets/header.jsp" %>
        <!--header of the page end here-->

        <div>
            <!--main content of the page start here-->
            <div class="content-wrapper">
                <div class="main-content">
                    UserID: ${sessionScope.LOGIN_USER.userID}
                    <br> FullName: ${sessionScope.LOGIN_USER.fullName}
                    </br> RoleID: ${sessionScope.LOGIN_USER.roleID}
                    </br> Password: ${sessionScope.LOGIN_USER.password}
                </div>
            </div>
            <!--main content of the page end here--> 

            <h1 style="color: white">${requestScope.SEND_MAIL_SUCCESS}</h1>
            <h1 style="color: white">${requestScope.SEND_MAIL_ERROR}</h1>  
        </div>

        <!--footer of the page start here-->
        <%@include file="assets/footer.jsp" %>
        <!--footer of the page end here-->

        <script src="assets/js/section.js"></script>        
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
