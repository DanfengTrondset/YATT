<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBController"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
        <title>YATT - Home</title>
    </head>
    <%
        String email = (String) request.getAttribute("email");
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
                        <a href="CategoryServlet?action=viewCart&email=<%=email%>">Shopping Cart</a>  
                    </div>
                </div>
                <a href="#">
                    <img src="img/YATT.png" id="logo" alt="YATT logo">
                </a>
                <img src="img/YATTlogo.png" id="logoText" alt="Yatt logo text">
            </div>
            <div id="indexRightColumn">              
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Tops&email=<%=email%>">
                            <img src="<%=topImageUrl%>" alt="Top category image">
                            <div class="overlay">
                                <div class="text">Tops</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Bottoms&email=<%=email%>">
                            <img src="<%=bottomImageUrl%>" alt="Bottom category image">
                            <div class="overlay">
                                <div class="text">Bottoms</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Dresses&email=<%=email%>">
                            <img src="<%=dressImageUrl%>" alt="Dress category image">
                            <div class="overlay">
                                <div class="text">Dresses</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Accessories&email=<%=email%>">
                            <img src="<%=accImageUrl%>" alt="Accessory category image">
                            <div class="overlay">
                                <div class="text">Accessories</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Underwear&email=<%=email%>">
                            <img src="<%=underwearImageUrl%>" alt="Underwear category image">
                            <div class="overlay">
                                <div class="text">Underwear</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="categoryBox">
                    <div class="container">
                        <a href="http://localhost:8080/YATT/CategoryServlet?action=viewCategory&category=Gift Card&email=<%=email%>">
                            <img src="<%=giftImageUrl%>" alt="Gift card category image">
                            <div class="overlay">
                                <div class="text">Gift Cards</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: <a href="mailto: service@yatt.com">service@yatt.com</a> </p>
            </div>
        </div>
    </body>
</html>
