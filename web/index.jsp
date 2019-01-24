<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jan 22, 2019, 11:23:05 PM
    Author     : safaa
--%>

<sql:query var="categories" dataSource="jdbc/yatt">
    SELECT * FROM category
</sql:query>
    

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
                <c:forEach var="category" items="${categories.rows}">
                    <div class="categoryBox">
                        <a href="category?${category.id}">
                            <span class="categoryLabel"></span>
                            <span class="categoryLabelText">${category.name}</span>

                            <img src="${initParam.categoryImagePath}${category.name}.jpg"
                                 alt="${category.name}" class="categoryImage">
                        </a>
                    </div>
                </c:forEach> 
            </div>

            <div id="footer">
                <hr>
                <p id="footerText"> Location: Kristianstad,Sweden </p>
                <p id="footerText"> Email Us: Yatt@gmail.com </p>
            </div>
        </div>
    </body>
</html>
