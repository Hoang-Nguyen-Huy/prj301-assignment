<%-- 
    Document   : viewCart
    Created on : Jun 15, 2024, 4:30:07 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/viewCart.css" rel="stylesheet">
    </head>
    <body>
        <!--header of the page start here-->
        <%@include file="assets/header.jsp" %>
        <!--header of the page end here-->

        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 content-header">
                    <h1>Your selected product here !</h1>
                </div>

                <div class="col-md-12 main-content">
                    <c:if test="${sessionScope.CART != null}">
                        <table border="1" class="table table-hover table-bordered cart-content">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                    <th>Edit</th>                   
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0"/>
                                <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                                    <c:set var="itemTotal" value="${product.getPrice() * product.getQuantity()}"/>
                                    <c:set var="total" value="${total + itemTotal}"/>
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${product.getId()}</td>
                                        <td>${product.getName()}</td>                                       
                                        <td>
                                            <input type="number" name="quantity" value="${product.getQuantity()}" required="" min="1"/>
                                        </td>
                                        <td>${product.getPrice()}$</td>
                                        <td>${product.getPrice() * product.getQuantity()}$</td>
                                        <td>
                                            <a type="button" class="btn btn-danger" href="MainController?action=Remove&id=${product.getId()}">Remove</a>
                                        </td>
                                        <td>
                                            <input type="hidden" name="id" value="${product.getId()}"/>
                                            <button type="submit" class="btn btn-primary" name="action" value="Edit">
                                                Edit
                                            </button>                        
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="col-md-12">
                            <h2> Total: ${total}$ </h2>            
                        </div>
                    </c:if>
                </div>
                
                <div class="col-md-12 checkout text-end">
                    <a type="button" class="btn btn-success" href="MainController?action=Checkout">Check out !</a>
                </div>
            </div>
        </div>

        

        <!--footer of the page start here-->
        <%@include file="assets/footer.jsp" %>
        <!--footer of the page end here-->

        <script src="assets/js/section.js"></script>        
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>