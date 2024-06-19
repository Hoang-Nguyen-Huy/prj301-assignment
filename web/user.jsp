<%-- 
    Document   : user
    Created on : May 29, 2024, 4:52:05 PM
    Author     : Dell Latitude 7490
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <% 
            String checkRole = "US";
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null || !checkRole.equals(user.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        UserID: <%= user.getUserID() %>
        <br> FullName <%= user.getFullName() %>
        </br> RoleID: <%= user.getRoleID() %>
        </br> Password: <%= user.getPassword() %>
        

    </body>
</html>
