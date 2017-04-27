<%-- 
    Document   : StringBean
    Created on : Nov 21, 2016, 1:45:53 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>String Bean</title>
    </head>
    <body>
        <table border="5" align="center">
            <tr>
                <th class="title">Using JavaBeans with JSP</th>
            </tr>
        </table>
        <jsp:useBean id="stringBean" class="Bean.StringBean" />
        <ol>
            <li>Initial value (from jsp:getProperty):
                <I><jsp:getProperty name="stringBean" property="message"/></I>
            </li>
            <li>
                Initial value (from JSP expression):
                <i><%= stringBean.getMessage()%></i>
            </li>
            <li>
                <jsp:setProperty name="stringBean" property="message"
                                 value="Best string bean: Fortex"/>
                Value after setting property with jsp:setProperty:
                <i><jsp:getProperty name="stringBean" property="message" /></i>
            </li>
            <li>
                <%
                    stringBean.setMessage("My favortie: Kentucky Wonder");
                %>
                Value after setting property with scriptlet:
                <i><%= stringBean.getMessage()%></i>
            </li>
        </ol>
            <ol>
                <li>Get the total value:
                    <jsp:getProperty name="stringBean" property="total"/>
                </li>
                <li>Change the value of total:
                    <jsp:setProperty name="stringBean" property="total"
                                     value="6"/>
                    <jsp:getProperty name="stringBean" property="total"/>
                </li>
            </ol>
    </body>
</html>
