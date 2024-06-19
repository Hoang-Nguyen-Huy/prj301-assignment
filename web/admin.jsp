<%-- 
    Document   : admin
    Created on : May 29, 2024, 4:52:09 PM
    Author     : Dell Latitude 7490
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <% 
            String checkRole = "AD";
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !checkRole.equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String item = request.getParameter("search");
            if (item == null) item = "";
        %>
        
        <h1>Welcome: <%= loginUser.getFullName() %></h1>
        <a href="MainController?action=Logout">Logout</a>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/>
        </form>
        
        <form action="MainController">
            Search:<input type="text" name="search" value="<%= item %>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <% 
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    int count = 1;
                    for (UserDTO user: listUser) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++ %></td>
                    <td><%= user.getUserID() %></td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID() %>" required=""/>
                    </td>
                    <td><%= user.getPassword() %></td>
                    <!--update o day-->
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="userID" value="<%= user.getUserID() %>"/>
                        <input type="hidden" name="search" value="<%= item %>"
                    </td>
                    <!--delete o day-->
                    <td>
                        <a href="MainController?search=<%= item %>&userID=<%= user.getUserID() %>&action=Delete">Delete</a>
                    </td>
                </tr>
            </form>
                <%
                    }
                %>
            </tbody> 
        </table>
            
        <%
               String error = (String) request.getAttribute("DELETE_ERROR");
            if (error == null) error = "";
        %>
        <%= error %>
        
        <%
                } 
            }
        %>
    </body>
</html>
