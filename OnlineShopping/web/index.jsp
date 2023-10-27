<%-- 
    Document   : index
    Created on : Oct 26, 2023, 10:14:11 AM
    Author     : AreYouG
--%>

<%@page import="model.TableManager"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    List<Products> allProduct = TableManager.getAllProducts();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>First</title>
    </head>
    <body>
        <center>
            <h1>DVD Catalog</h1>
            <form name="main" action="AddToCart" method="POST">
                <table border="1">
                    <tr>
                        <th>DVD Names</th>
                        <th>Rate</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    <% for (Products product : allProduct) { %>
                    <tr>
                        <td><input type="checkbox" name="movies" value="<%= product.getId()%>" />
                            <%= product.getMovie()%></td>
                        <td><%= product.getRating()%></td>
                        <td><%= product.getYearcreate()%></td>
                        <td><%= product.getPrice()%></td>
                        <td><input type="text" name="qty_<%= product.getId()%>" value="" size="3"/></td>
                    </tr>
                    <% } %>
                </table>
                <input type="submit" value="Add To Cart" name="button1" />
            </form>
        </center>
    </body>
</html>
