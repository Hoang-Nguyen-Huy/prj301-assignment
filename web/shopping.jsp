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
    </head>
    <body>
        <div>Tu xin chao cac ban</div>
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
    </body>
</html>
