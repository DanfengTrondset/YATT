<%-- 
    Document   : category
    Created on : Jan 22, 2019, 11:19:01 PM
    Author     : safaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="controller.DBController"%>
<!DOCTYPE html>
<html>
    <%
        String category = request.getParameter("category");
        List<Product> products = DBController.getProductForCategory(category);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
        <title><%=category%></title>
    </head>

    <body>
        <div id="main">
            <div id="header">
                <div id="widgetBar">

                    <div class="headerWidget">
                        <a href="cart.jsp">shopping cart</a>
                    </div>

                </div>

                <a href="#">
                    <img src="img/YATT.png" id="logo" alt="YATT logo">
                </a>
            </div>

            <div id="categoryRightColumn">
                <p id="categoryTitle"> selected category </p>

                <table id="productTable">
                    <%
                        Iterator<Product> iterator = products.iterator();
                        while (iterator.hasNext()) {
                            Product product = iterator.next();
                            int id = product.getId();
                            String name = product.getName();
                            String description = product.getDescription();
                            String image = product.getImageUrl();
                            int price = product.getPrice();
                            System.out.println("in category.jsp: " + image);
                    %>
                    <tr>
                        <td class="lightBlue">
                            <img src=<%=image%>
                        </td>
                        <td class="lightBlue">
                            <%=name%><br>
                            <span class="smallText"><%=description%></span>
                        </td>
                        <td class="lightBlue"> <%=price%> </td>
                        <td class="lightBlue">
                            <form action="#" method="post">
                                <input type="submit" value="purchase button">
                            </form>
                        </td>
                    </tr>
                    <%}%>

                </table>
            </div>

        </div>
    </body>
</html>
