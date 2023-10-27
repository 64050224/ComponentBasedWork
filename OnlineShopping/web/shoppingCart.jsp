<%-- 
    Document   : shoppingCart
    Created on : Oct 26, 2023, 10:45:52 PM
    Author     : AreYouG
--%>

<%@page import="model.TableManager"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String[] movieIds = (String[]) session.getAttribute("ids");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Second</title>
    </head>
    <body>
        <center>
            <h1>Shopping Cart</h1>
            <table border="1">
                <tr>
                    <th>DVD Names</th>
                    <th>Rate</th>
                    <th>Year</th>
                    <th>Price/Unit</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <% for (String movieId : movieIds) { %>
                    <tr>
                        <%Products product = TableManager.getProductById(Integer.parseInt(movieId));%>
                        <td><%= product.getMovie()%></td>
                        <td><%= product.getRating()%></td>
                        <td><%= product.getYearcreate()%></td>
                        <td><%= product.getPrice()%></td>
                        <td><%= session.getAttribute("qty_" + movieId)%></td>
                        <td><%= request.getAttribute("price_" + movieId)%></td>
                    </tr>
                <% } %>
                <tr>
                    <td colspan="5">Total</td>
                    <td><%= session.getAttribute("totalPrice")%></td>
                </tr>
            </table><form method="POST" action="CheckOutServlet">
                <input type="submit" value="Checkout" name="button1" />
            </form>
            
        </center>
    </body>
</html>
