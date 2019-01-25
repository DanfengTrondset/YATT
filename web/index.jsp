<%-- 
    Document   : index
    Created on : Jan 22, 2019, 11:23:05 PM
    Author     : safaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBController"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
        <title>YATT Online Store</title>
    </head>
    <%
        List<Category> categories = DBController.getCategories();
        Category tops = null, bottoms = null, dresses = null, accessories = null, underwear = null, gift_card = null;
        for (Category category : categories) {
            if (category.getName().equals("Tops")) {
                tops = category;
            }
            if (category.getName().equals("Bottoms")) {
                bottoms = category;
            }
            if (category.getName().equals("Dresses")) {
                dresses = category;
            }
            if (category.getName().equals("Accessories")) {
                accessories = category;
            }
            if (category.getName().equals("Underwear")) {
                underwear = category;
            }
            if (category.getName().equals("Gift Card")) {
                gift_card = category;
            }
            System.out.println(category.getName());
        }

        String topImageUrl = tops.getImageUrl();
        String topName = tops.getName();
        String bottomImageUrl = bottoms.getImageUrl();
        String bottomName = bottoms.getName();
        String dressImageUrl = dresses.getImageUrl();
        String dressName = dresses.getName();
        String accImageUrl = accessories.getImageUrl();
        String accName = accessories.getName();
        String underwearImageUrl = underwear.getImageUrl();
        String underwearName = underwear.getName();
        String giftImageUrl = gift_card.getImageUrl();
        String giftName = gift_card.getName();
    %>
    <body>
        <div id="main">

            <div id="header">
                <div id="widgetBar">

                    <div class="headerWidget">
                        <a href="cart.jsp">shopping cart</a>  
                    </div>
                    <div class="headerWidget">
                        <a href="login.jsp">Account</a>
                    </div>
                </div>
                <a href="#">
                    <img src="img/YATT.png" id="logo" alt="YATT logo">
                </a>
                <img src="img/YATTlogo.png" id="logoText" alt="Yatt logo text">
            </div>

            <div id="indexRightColumn">              
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Tops">
                        <img src=<%=topImageUrl%> alt="Top category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=topName%></span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Bottoms">
                        <img src=<%=bottomImageUrl%> alt="Bottom category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=bottomName%></span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Dresses">
                        <img src=<%=dressImageUrl%> alt="Dress category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=dressName%></span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Accessories">
                        <img src=<%=accImageUrl%> alt="Accessory category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=accName%></span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Underwear">
                        <img src=<%=underwearImageUrl%> alt="Underwear category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=underwearName%></span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="http://localhost:8080/YATT/CategoryServlet?category=Gift Card">
                        <img src=<%=giftImageUrl%> alt="Gift card category image" style="height: 176px;width: 212px;">
                             <span class="categoryLabelText"><%=giftName%></span>
                    </a>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: service@yatt.com </p>
            </div>
        </div>
    </body>
</html>
