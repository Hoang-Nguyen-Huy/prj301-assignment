<%@page import="sample.user.UserError"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Create User page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/create.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css"/>
    </head>
    <body>
        <div class="row sign-up-form">
            <div class="col-md-12 sign-up-header">
                <h1>Sign Up</h1>
            </div>

            <div class="col-md-12 error-message">
                ${requestScope.ERROR}
            </div>

            <div class="row infomationform">
                <form action="MainController" method="POST">
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="text" name="userID" required="" placeholder="User ID"/>${requestScope.USER_ERROR.userIDError}
                    </div>                                            
                    </br>
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="text" name="fullName" required="" placeholder="Full Name"/>${requestScope.USER_ERROR.fullNameError}
                    </div>                                                           
                     <input class="form-control" type="hidden" name="roleID" value="US" required="" readonly=""/>
                    </br>
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="password" name="password" required="" placeholder="Password"/>
                    </div>
                    </br>
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="password" name="confirm" required="" placeholder="Confirm Password"/>${requestScope.USER_ERROR.confirmError}
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <input class="btn btn-primary create-reset-btn" type="submit" name="action" value="Create"/>
                        </div>
                        <div class="col-md-6">
                            <input class="btn btn-primary create-reset-btn" type="reset" value="Reset"/>      
                        </div>
                    </div>                    
                    ${requestScope.USER_ERROR.error}
                </form>
            </div>            
        </div>
    </body>
</html>
