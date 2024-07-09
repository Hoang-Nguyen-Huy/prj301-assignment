<%-- 
    Document   : allProducts
    Created on : Jul 8, 2024, 2:57:07 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Features Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/allProducts.css" rel="stylesheet">
    </head>
    <body>
        <!--header of the page start here-->
        <%@include file="assets/header.jsp" %>
        <!--header of the page end here-->

        <div class="container">
            <div class="row">
                <c:forEach var="product" items="${requestScope.LIST_SHOPPING_PRODUCTS}">
                    <div class="col-md-3 main-content">
                        <div class="card card-item" style="width: 18rem;">
                            <img src="${product.getPicture()}" class="card-img-top" alt="${product.getName()}">
                            <div class="card-body">
                                <h5 class="card-title">${product.getName()}</h5>
                                <p class="card-text">${product.getPrice()}$</p>
                                <p class="card-text">${product.getBrand()}</p>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="cmbShoes" value="${product.getId()}-${product.getName()}-${product.getPrice()}-${1}-${product.getPicture()}-${product.getBrand()}">
                                    <button class="btn btn-primary add-to-cart" type="submit" name="action" value="Add">
                                        Add to Cart
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!--footer of the page start here-->
        <%@include file="assets/footer.jsp" %>
        <!--footer of the page end here-->

        <script src="assets/js/section.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
