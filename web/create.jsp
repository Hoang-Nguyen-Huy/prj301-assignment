<%@page import="sample.user.UserError"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <div>Create new User</div>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/><%= userError.getUserIDError() %>
            </br>Full Name<input type="text" name="fullName" required=""/><%= userError.getFullNameError() %>
            </br>Role ID<input type="text" name="roleID" value="US" required="" readonly=""/>
            </br>Password<input type="password" name="password" required=""/>
            </br>Confirm<input type="password" name="confirm" required=""/><%= userError.getConfirmError() %>
            </br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>  
            <%= userError.getError() %>
        </form>
    </body>
</html>
