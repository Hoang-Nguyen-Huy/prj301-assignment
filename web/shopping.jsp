<%-- 
    Document   : shopping
    Created on : Jun 15, 2024, 4:21:13 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tu Tu Store</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/shopping.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <!--header of the page start here-->
            <div id="header">
                <!--Navigate-->
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Men
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Sport</a></li>
                                        <li><a class="dropdown-item" href="#">Luxury</a></li>
                                    </ul>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Women
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Sport</a></li>
                                        <li><a class="dropdown-item" href="#">Luxury</a></li>
                                    </ul>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="#">Kids</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                            </ul>
                            <!--Search--> 
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                            <!--Search end-->
                        </div>
                    </div>
                </nav>
                <!--Navigation-->
            </div>
            <!--header of the page end here-->

            <form action="MainController" method="POST">
                Select your shoes: 
                <select name="cmbShoes">
                    <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                        <option value="${product.getId()}-${product.getName()}-${product.getPrice()}">${product.getId()}-${product.getName()}-${product.getPrice()}$</option>
                    </c:forEach>
                </select>
                <select name="cmbQuantity">
                    <option value="1">1</option>                
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="50">50</option>
                </select>
                <input type="submit" name="action" value="Add"/>
                <input type="submit" name="action" value="View"/>
            </form>
            ${requestScope.MESSAGE}
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
