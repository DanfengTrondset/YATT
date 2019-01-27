<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>YATT - Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
    </head>
    <body>
        <div id="header">
            <img src="img/YATTlogo.png" id="logoText_start" alt="Yatt logo text">
        </div>
        <div id="container_login">
            <p id="yatt_login">LOGIN</p>
            <form action="AccountServlet?action=login" method="post">
                <label for="email">Email</label><br>
                <input type="email" id="email" name="email" required><br><br>
                <label for="password" style="text-align:left">Password</label><br>
                <input type="password" id="password" name="password" required><br><br>
                <button id="btn_login" type="submit">Login</button>
            </form>
        </div>
        <%
            if (request.getAttribute("errorMessage") != null) {
                String errorMessage = request.getAttribute("errorMessage").toString();
        %>
        <div class="error">
            <p class="error_text"><%=errorMessage%></p>
        </div>
        <%}%>
        <div class="register_text">
            <label>Don't have an account?</label>
            <a href="register.jsp">
                Register
            </a>
        </div>
    </body>
</html>
