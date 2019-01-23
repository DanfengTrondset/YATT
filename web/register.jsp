<!DOCTYPE html>
<html>
    <head>
        <style>
            #btn_register {
                background-color: #FF8C00;
                color: white;
                font-size: 16px;
                border: none;
                cursor: pointer;
                width: 100%;
                padding: 13px;
            }

            #btn_register:hover {
                opacity: 0.8;
            }
            #username_register,#email_register, #password_register, #repeat_password_register{
                width: 94%;
                padding: 13px;
            }
            #container_register{
                padding: 0px;
                width: 37%;
                margin: auto;
            }

            #yatt_register{
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
        <div id="container_register">
            <p id="yatt_register">CREATE ACCOUNT</p>
            <p id="welcome">Welcome to YATT !</p>
            <form action="AccountServlet?action=register" method="post">
                <label for="username_register">Username</label><br>
                <input type="text" id="username_register" name="username_register" required><br><br>
                <label for="email_register">Email</label><br>
                <input type="email" id="email_register" name="email_register" required><br><br>
                <label for="password_register">Password</label><br>
                <input type="password" id="password_register" name="password_register" required><br><br>
                <label for="password_register">Repeat Password</label><br>
                <input type="password" id="repeat_password_register" name="repeat_password_register" required><br><br><br>
                <button id="btn_register" type="submit">Register</button>
            </form>
        </div>
    </body>
</html>
