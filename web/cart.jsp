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
        <title>Shopping Cart</title>
    </head>
    <%
        String orderid = request.getAttribute("orderid").toString();
        List<OrderedProduct> orderedProducts = DBController.getOrderedProductsOf(Integer.parseInt(orderid));
    %>
    <body>
        <div id="main">
            <div id="header">
                <div id="widgetBar">

                    <div class="headerWidget">
                        <a href="login.jsp">Account</a>
                    </div>
                </div>
            </div>

            <div id="centerColumn">

                <p>Your shopping cart contains x items.</p>

                <div id="actionBar">
                    <a href="#" class="bubble hMargin">clear cart</a>
                    <a href="index.jsp" class="bubble hMargin">continue shopping</a>
                    <a href="checkout.jsp" class="bubble hMargin">checkout</a>
                </div>

                <h4 id="subtotal">[ subtotal: xxx ]</h4>

                <table id="cartTable">

                    <tr class="header">
                        <th>product</th>
                        <th>name</th>
                        <th>price</th>
                        <th>quantity</th>
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
                        <td class="lightBlue">
                            <img src="<%=image%>" alt="product image">
                        </td>
                        <td class="lightBlue"><%=name%></td>
                        <td class="lightBlue"><%=price%></td>
                        <td class="lightBlue">

                            <form action="updateCart" method="post">
                                <input type="text"
                                       maxlength="2"
                                       size="2"
                                       value="<%=quantity%>"
                                       name="quantity">
                                <input type="submit"
                                       name="submit"
                                       value="update button">
                            </form>
                        </td>
                    </tr>
                    <%}%>

                </table>

            </div>

            <div id="footer">
                <hr>
                <p id="footerText">[ footer text ]</p>
            </div>
        </div>
    </body>
</html>