<%-- 
    Document   : account
    Created on : Nov 21, 2016, 2:43:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Page</title>
    </head>
    <body>
        <h1 align="center">Please provide your account information</h1>
        <form action="ShoppingServlet" method="get">
        <table align="center">
            <tr>
                <th align="left">Name:</th>
                <td><input type="text" name="name" size="30px"/></td>
            </tr>
            <tr>
                <th align="left">VISA Card Number:</th>
                <td><input type="text" name="visa" size="30px"/></td>
            </tr>
            <tr>
                <th align="left">Address:</th>
                <td><input type="text" name="address" size="30px"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="action" value="Submit"/></td>
            </tr>
            <input type='hidden' name='do' value='0'/>
        </table>
            </form>
    </body>
</html>
