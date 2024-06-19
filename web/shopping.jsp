<%-- 
    Document   : shopping
    Created on : Jun 15, 2024, 4:21:13 PM
    Author     : Dell Latitude 7490
--%>

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
                <option value="S01-NIKE-100">NIKE-100$</option>                
                <option value="S02-Adidas-150">Adidas-150$</option>
                <option value="S03-Thuong Dinh-50">Thuong Dinh-50$</option>
                <option value="S04-Bitis-200">Bitis-200$</option>
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
        <% 
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>      
        <%=  message %>
    </body>
</html>
