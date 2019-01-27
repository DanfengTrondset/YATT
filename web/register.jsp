<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>YATT - Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
    </head>
    <body>
        <div id="header">
            <img src="img/YATTlogo.png" id="logoText_start" alt="Yatt logo text">
        </div>
        <div id="container_register">
            <p id="yatt_register">CREATE AN ACCOUNT</p>
            <form action="AccountServlet?action=register" method="post">
                <label for="username_register">Username</label><br>
                <input type="text" id="username_register" name="username_register" required><br><br>
                <label for="email_register">Email</label><br>
                <input type="email" id="email_register" name="email_register" required><br><br>
                <label for="password_register">Password</label><br>
                <input type="password" id="password_register" name="password_register" required><br><br>
                <label for="password_register">Repeat Password</label><br>
                <input type="password" id="repeat_password_register" name="repeat_password_register" required><br><br>
                <button id="btn_register" type="submit">Register</button>
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
            <label>Have an account?</label>
            <a href="index_login.jsp">
                Login
            </a>
        </div>
    </body>
</html>
