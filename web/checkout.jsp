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
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:if test="${requestScope.ORDER != null}">
            <h3>Ma dat hang: ${requestScope.ORDER.getOrderID()}, Nguoi mua: ${requestScope.ORDER.getUserID()}, Tong tien: ${requestScope.ORDER.getTotal()}$, Ngay checkout: ${requestScope.ORDER.getDate()}</h3>

            <table border="1">
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
        </c:if>   
        <h1 style="color: red">${requestScope.ERROR_MESSAGE}</h1>
        <h1 style="color: red">${requestScope.ERROR_CART_MESSAGE}</h1>

        <a href="MainController?action=Shopping_Page">Buy more !</a>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="View">
                Back to Cart
            </button>
        </form>

    </body>
</html>