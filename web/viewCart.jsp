<%-- 
    Document   : viewCart
    Created on : Jun 15, 2024, 4:30:07 PM
    Author     : Dell Latitude 7490
--%>

<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu Tu Store</title>
    </head>
    <body>
        <h1>Your selected product here !</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
        %>
        <table border="1">
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
                <%
                    int count = 1;
                    double total = 0;
                    for (Product product : cart.getCart().values()) {
                        total += (product.getPrice() * product.getQuantity());
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++ %></td>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity() %>" required="" min="1"/>
                    </td>
                    <td><%= product.getPrice() %>$</td>
                    <td><%= product.getPrice() * product.getQuantity() %>$</td>
                    <td>
                        <a href="MainController?action=Remove&id=<%= product.getId() %>">Remove</a>
                    </td>
                    <td>
                        <input type="hidden" name="id" value="<%= product.getId() %>"/>
                        <button type="submit" name="action" value="Edit">
                            Edit
                        </button>                        
                    </td>
                </tr>
            </form>
                <%
                        
                    }
                %>
            </tbody>
        </table>
            <h2> Total: <%= total %>$ </h2>
        <%
            }
        %>
        <a href="MainController?action=Shopping_Page">Add more !</a>
    </body>
</html>
