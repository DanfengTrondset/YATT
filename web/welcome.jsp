<%-- 
    Document   : index
    Created on : Jan 22, 2019, 11:23:05 PM
    Author     : safaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
        <title>YATT Online Store</title>
    </head>
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
                    <a href="category.jsp">
                        <span class="categoryLabelText">Tops</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="category.jsp">
                        <span class="categoryLabelText">Bottoms</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="category.jsp">
                        <span class="categoryLabelText">Dresses</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="category.jsp">
                        <span class="categoryLabelText">Accessories</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="category.jsp">
                        <span class="categoryLabelText">Underwear</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="category.jsp">
                        <span class="categoryLabelText">Gift Card</span>
                    </a>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: Yatt@gmail.com </p>
            </div>
        </div>
    </body>
</html>
