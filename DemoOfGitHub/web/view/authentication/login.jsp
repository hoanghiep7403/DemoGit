
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=Edge" /><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
        <title>
            FPT Campus Portal
        </title><link rel="Stylesheet" href="view/authentication/login.css" type="text/css" />
        
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }

            body {
                background-image: url('1271205.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 120% 100%;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            legend{
                font-size: 40px;
                border: 2px solid #1b34b2;
                border-radius: 2px;
            }
            p{
                font-size: 50px;
                margin-right: 50px;
            }

            h1 {
                font-size: 36px;
                color: #ffffff;
                text-align: center;
                margin-top: 100px;
                margin-bottom: 50px;
                margin-left: 550px;
                letter-spacing: 2px;
                text-shadow: 2px 2px #000000;
                width: 400px;
                border: 2px solid green;
                border-radius: 4px;
                background-color: rgba(135,206,250,0.5);
                line-height: 50px;
            }

            form {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px #000000;
                width: 400px;
                margin: 0 auto;
                margin-top: 100px;
            }

            label {
                font-size: 18px;
                color: #000000;
                display: block;
                margin-bottom: 10px;
            }

            input[type="username"], input[type="password"] {
                font-size: 16px;
                padding: 10px;
                border-radius: 5px;
                border: none;
                width: 100%;
                margin-bottom: 20px;
            }

            button[type="submit"] {
                font-size: 18px;
                color: #ffffff;
                background-color: #f8c300;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-left: 150px;
            }

            button[type="submit"]:hover {
                background-color: #fcb900;
            }
        </style>


    </head>

    <body>

        <div class="container">

            <div class="row">

                <div class="col-md-8">

                    <h1><span>FPT University Academic Portal</span>
                    </h1>

                </div>
                
            </div>

            <form action="login" method="POST">
                <div class="content">
                    <div class="input-field">
                        <input name="username" type="username" placeholder="Username" autocomplete="nope">
                    </div>
                    <div class="input-field">
                        <input name="password" type="password" placeholder="Password" autocomplete="new-password">
                    </div>
                    <div class="input-field">
                        <select name="campus" class="btn btn-default" required>
                            <option selected="selected" value="">Select Campus</option>
                            <option value="1">FU-Hoà Lạc</option>
                            <option value="2">FU-Hồ Chí Minh</option>
                            <option value="3">FU-Đà Nẵng</option>
                            <option value="4">FU-Cần Thơ</option>
                            <option value="5">FU-Quy Nhơn</option>
                        </select>
                    </div>
                    <br/>
                  
                </div>
                <div class="action">
                    <button type="submit">Log in</button>
                </div>
            </form>
        </div>
    </body>
</html>
