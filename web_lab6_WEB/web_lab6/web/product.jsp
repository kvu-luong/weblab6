<%-- 
    Document   : product
    Created on : Nov 21, 2016, 3:41:28 PM
    Author     : ASUS
--%>

<%@page import="Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>

        <h1 align="center">Hi <%= request.getParameter("name")%></h1>

        <h3 align='center'>Please select our product and it's quantity</h3>
        <hr>
        <form action='ShoppingServlet' method='get'>
            <table align='center'>
                <tr>
                    <th>Product:</th>
                    <td>
                        <select name='product'>
                            <%
                                ConnectDB con = new ConnectDB();
                                con.open("weblab6");
                                ArrayList list = con.selectProduct("product");
                                con.close();

                                for (int i = 0; i < list.size(); i++) {
                                    Product p = (Product) list.get(i);
                                    String listElement = p.getName() + "|" + p.getManufacturer() + "|" + p.getCountry() + "|" + p.getPrice();
                            %>
                            <option><%= listElement%></option>
                            <% }%>
                        </select>
                    </td>
                    <th>Quantity:</th>
                    <td><input type='text' name='quantity' size='5px' value='1'/>
                    <input type='hidden' name='username' value='<%= request.getParameter("name")%>'/></td>
                    <td><input type='submit' name='action' value='Add to Cart'</td>
                </tr>
            </table>
            <%

                if (Integer.parseInt(request.getParameter("do")) == 1) {

            %>
            <form action='#' method='get'>
                <table width='100%' border="1px">
                    <tr bgcolor='yellow'>
                        <th> PRODUCT </th>      
                        <th> MANUFACTURER </th> 
                        <th> MADE IN </th> 
                        <th> PRICE  </th> 
                        <th> QUANTITY </th> 
                        <th> ACTION </th>
                    </tr>
                    <%                        
                        ArrayList pro = (ArrayList) session.getAttribute("product");
                        System.out.println(pro.size()+" pro in product.jsp");
                        for (int i = 0; i < pro.size(); i++) {
                            Product prod = new Product();
                            prod = (Product)pro.get(i);
                            
                    %>
                    <tr>
                        <td><%=prod.getName()%></td>
                        <td><%=prod.getManufacturer()%></td>
                        <td><%=prod.getCountry()%></td>
                        <td><%=prod.getPrice()%></td>
                        <td><%=prod.getQuantity() %></td>
                       
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan='6' align='center'><input type='submit' name='action' value='CheckOut' /></td>
                    </tr>
                </table>
            </form>
            <% }%>
        </form>
    </body>
</html>
