<%-- 
    Document   : showConfirmation
    Created on : Oct 26, 2023, 11:45:24 PM
    Author     : AreYouG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Last</title>
    </head>
    <body>
        <h1>Your Order is confirmed!</h1>
        <h1>The total amount is $<%= request.getAttribute("totalPrice")%>!</h1>
        <h3>Your order ID:<%= request.getAttribute("test")%></h3>
    </body>
</html>
