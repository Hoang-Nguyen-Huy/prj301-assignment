<%-- 
    Document   : checkout
    Created on : Jun 22, 2024, 8:43:51 PM
    Author     : Dell Latitude 7490
--%>

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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            OrderDTO order = (OrderDTO) request.getAttribute("ORDER");
            if (order != null) {
        %>

        <h3>Ma dat hang: <%= order.getOrderID()%>, Nguoi mua: <%= order.getUserID()%>, Tong tien: <%= order.getTotal()%>$, Ngay checkout: <%= order.getDate()%></h3>

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
                <%
                    int count = 1;
                    List<OrderDetailDTO> listOrderDetail = (List<OrderDetailDTO>) request.getAttribute("LIST_ORDER_DETAIL");
                    for (OrderDetailDTO orderDetail : listOrderDetail) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= orderDetail.getOrderID()%></td>
                    <td><%= orderDetail.getProductID()%></td>
                    <td><%= orderDetail.getPrice()%>$</td>
                    <td><%= orderDetail.getQuantity()%></td>
                </tr>                
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }

            String error = (String) request.getAttribute("ERROR_MESSAGE");
            if (error == null) {
                error = "";
            }
        %>

        <h1 style="color: red"><%= error%></h1>


        <%
            String cartError = (String) request.getAttribute("ERROR_CART_MESSAGE");
            if (cartError == null) {
                cartError = "";
            }
        %>    
        <h1 style="color: red"><%= cartError%></h1>

        <a href="MainController?action=Shopping_Page">Buy more !</a>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="View">
                Back to Cart
            </button>
        </form>

    </body>
</html>