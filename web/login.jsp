<!DOCTYPE html>
<html>
    <head>
        <style>
            #btn_login {
                background-color: #FF8C00;
                color: white;
                font-size: 16px;
                border: none;
                cursor: pointer;
                width: 100%;
                padding: 13px;
            }

            #btn_login:hover {
                opacity: 0.8;
            }
            #email, #password{
                width: 94%;
                padding: 13px;
            }
            #container_login{
                padding: 0px;
                width: 37%;
                margin: auto;
            }

            #yatt_login{
                text-align: center;
                size: 18px;
                font-family: Arial Black;
            }
            #welcome{
                text-align: center;
            }
        </style>
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/yatt.css">
    </head>
    <body>
        <div id="container_login">
            <p id="yatt_login">LOGIN</p>
            <p id="welcome">Welcome to YATT !</p>
            <form action="AccountServlet?action=login" method="post">
                <label for="email">Email</label><br>
                <input type="email" id="email" name="email" required><br><br>
                <label for="password" style="text-align:left">Password</label><br>
                <input type="password" id="password" name="password" required><br><br><br>
                <button id="btn_login" type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
