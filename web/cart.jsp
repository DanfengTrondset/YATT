<%@page import="java.util.Iterator"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="controller.DBController"%>
<%@page import="model.OrderedProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
        <title>YATT - Shopping Cart</title>
    </head>
    <%
        String orderid = request.getAttribute("orderid").toString();
        String email = request.getParameter("email");
        List<OrderedProduct> orderedProducts = DBController.getOrderedProductsOf(Integer.parseInt(orderid));
    %>
    <body>
        <div id="main">
            <div id="header">
                <div id="widgetBar">
                    <div class="headerWidget">
                        <a href="home.jsp">Home</a>
                    </div>
                </div>
                <a href="#">
                    <img src="img/YATT.png" id="logo" alt="YATT logo">
                </a>
                <img src="img/YATTlogo.png" id="logoText" alt="Yatt logo text">
            </div>

            <div id="centerColumn">
                <p id="categoryTitle"> [ Subtotal: xxx ] </p>

                <table id="cartTable">

                    <tr class="headerList">
                        <th>Product</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    <%
                        for (Iterator<OrderedProduct> iterator = orderedProducts.iterator(); iterator.hasNext();) {
                            OrderedProduct orderedProduct = iterator.next();
                            int pid = orderedProduct.getId().getProductId();
                            Product product = DBController.getProduct(pid);
                            String image = product.getImageUrl();
                            String name = product.getName();
                            int price = product.getPrice();
                            int quantity = orderedProduct.getQuantity();
                    %>
                    <tr>
                        <td>
                            <img id="item_image" src="<%=image%>" alt="product image">
                        </td>
                        <td><%=name%></td>
                        <td><%=price%></td>
                        <td>

                            <form action="CategoryServlet?action=editCart&orderid=<%=orderid%>&pid=<%=pid%>&email=<%=email%>" method="post">
                                <input type="text"
                                       maxlength="2"
                                       size="2"
                                       value="<%=quantity%>"
                                       name="quantity">
                                <input type="submit"
                                       name="submit"
                                       value="Update">
                            </form>
                        </td>
                    </tr>
                    <%}%>

                </table>

            </div>

            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: <a href="mailto: service@yatt.com">service@yatt.com</a> </p>
            </div>
        </div>
    </body>
</html>