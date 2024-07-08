<%-- 
    Document   : checkout
    Created on : Jun 22, 2024, 8:43:51 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.OrderDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>

        <link href="styles/checkout.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <!--header of the page start here-->
        <%@include file="assets/header.jsp" %>
        <!--header of the page end here-->

        <div class="content-wrapper">
            <div class="row">
                <c:if test="${requestScope.ORDER != null}">
                    <h3>Buyer: ${requestScope.ORDER.getUserID()}</h3>

                    <div class="col-md-12">
                        <table border="1" class="table table-hover table-bordered checkout-content">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>OrderID</th>
                                    <th>ProductID</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderDetail" varStatus="counter" items="${requestScope.LIST_ORDER_DETAIL}">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${orderDetail.getOrderID()}</td>
                                        <td>${orderDetail.getProductID()}</td>
                                        <td>${orderDetail.getPrice()}$</td>
                                        <td>${orderDetail.getQuantity()}</td>
                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-md-6 content-footer">
                        <h3>Checkout date: ${requestScope.ORDER.getDate()}</h3>
                    </div>

                    <div class="col-md-6 content-footer">
                        <h3>Total: ${requestScope.ORDER.getTotal()}$</h3>
                    </div>

                    <div class="col-md-12 text-end">
                        <a type="button" class="btn btn-success" href="MainController?action=Payment&orderID=${requestScope.ORDER.getOrderID()}&total=${requestScope.ORDER.getTotal()}">Payment</a>
                    </div>
                </c:if>   

                <h1 style="color: red">${requestScope.ERROR_MESSAGE}</h1>
                <h1 style="color: red">${requestScope.ERROR_CART_MESSAGE}</h1>

            </div>
        </div>

        <!--footer of the page start here-->
        <%@include file="assets/footer.jsp" %>
        <!--footer of the page end here-->

        <script src="assets/js/section.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>