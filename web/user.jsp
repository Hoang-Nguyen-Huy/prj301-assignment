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
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        UserID: ${sessionScope.LOGIN_USER.userID}
        <br> FullName ${sessionScope.LOGIN_USER.fullName}
        </br> RoleID: ${sessionScope.LOGIN_USER.roleID}
        </br> Password: ${sessionScope.LOGIN_USER.password}
            
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="View"/>
        </form>
    </body>
</html>
