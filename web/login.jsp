<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Login information: </h1>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID"/>
            <br/> Password:<input type="password" name="password"/>
            <br/><input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
        </form>
        <a href="MainController?action=Create_Page">Create User</a>
        <% 
            String error = (String) request.getAttribute("ERROR");
            if (error == null) error = "";
        %>
        <%= error %>
    </body>
</html>
