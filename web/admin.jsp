<%-- 
    Document   : admin
    Created on : May 29, 2024, 4:52:09 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/admin.css" rel="stylesheet">        
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <!--header of the page start here-->
        <div id="header">
            <!--Navigate-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <div class="container-fluid">
                    <!--Logo-->
                    <a class="navbar-brand" href="#">
                        <img src="assets/logo.png" width="40" height="40">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--Logo--> 

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#aboutSection">About</a>
                            </li>
                        </ul>
                        <!--Search, Cart, Profile--> 
                        <form class="d-flex" action="MainController" method="POST">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search" value="${param.search}">
                            <button class="btn btn-outline-success" type="submit" name="action" value="Search">Search</button>
                            
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <li class="nav-item dropdown profile-menu" style="display: flex;">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProfile" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="${sessionScope.LOGIN_USER.picture == null || sessionScope.LOGIN_USER.picture == "" ? 'assets/avatar.jpg' : sessionScope.LOGIN_USER.picture}" width="35" height="35" class="rounded-circle">
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownProfile">
                                        <li><button class="dropdown-item" name="action" value="Logout" type="submit">Log Out</button></li>
                                    </ul>
                                </li>
                            </c:if>
                        </form>                                                       
                        <!--Search, Cart, Profile end-->
                    </div>
                </div>
            </nav>
            <!--Navigation-->
        </div>
        <!--header of the page end here-->

        <div class="container">
            <div class="row main-content">
                <h1> Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <table border="1" class="table table-hover">
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
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>
                                            <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" value="${user.roleID}" required=""/>                                    
                                        </td>
                                        <td>
                                            ${user.password}
                                        </td>
                                        <td>
                                            <input class="btn btn-primary" type="submit" name="action" value="Update"/>
                                            <input type="hidden" name="search" value="${param.search}"/>
                                        </td>
                                        <td>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"></c:param>
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                                <c:param name="search" value="${param.search}"></c:param>                                        
                                            </c:url>  
                                            <a href="${deleteLink}" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>                                                                   
                            </tbody>
                        </table>
                        ${requestScope.DELETE_ERROR}
                    </c:if>
                </c:if>
            </div>
        </div>

        <!--footer of the page start here-->
        <%@include file="assets/footer.jsp" %>
        <!--footer of the page end here-->

        <script src="assets/js/section.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
