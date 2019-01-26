<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="controller.DBController"%>
<!DOCTYPE html>
<html>
    <%
        String category = request.getParameter("category");
        String email = request.getParameter("email");
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
                        <a href="cart.jsp">Shopping Cart</a>  
                    </div>
                    <div class="headerWidget">
                        <a href="index.jsp">Home</a>
                    </div>
                </div>
                <a href="#">
                    <img src="img/YATT.png" id="logo" alt="YATT logo">
                </a>
                <img src="img/YATTlogo.png" id="logoText" alt="Yatt logo text">
            </div>

            <div id="categoryRightColumn">
                <p id="categoryTitle"> <%=category%> </p>

                <table id="productTable">
                    <tr class="headerList">
                        <th>Product</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th> </th>
                    </tr>
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
                        <td>
                            <img src="<%=image%>" alt="product image">
                            
                        </td>
                        <td>
                            <%=name%><br>
                            <span class="smallText"><%=description%></span>
                        </td>
                        <td> <%=price%> </td>
                        <td>
                            <form action="CategoryServlet?action=addToCart&pid=<%=id%>&email=<%=email%>" method="post">
                                <input type="submit" value="Add to Cart">
                            </form>
                                
                        </td>
                    </tr>
                    
                    <%}%>

                </table>
            </div>
            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: service@yatt.com </p>
            </div>
        </div>
    </body>
</html>
