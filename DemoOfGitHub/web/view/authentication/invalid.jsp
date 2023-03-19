

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style type="text/css">

        p{
            font-size: 50px;
            margin-right: 50px;
        }
        h1{
            margin-top: 200px;
            color: black;
            font-size: 50px;
        }
        span{
            margin-top: 200px;
            font-size: 40px;
            background-color: rgba(107,142,35, 0.5);
            color: whitesmoke;
        }
        h2{
            color: black;
            font-size: 40px;
        }
    </style>
    <body>
        <div style="text-align: center">
            <h1 style="color: red">Invalid username or password</h1>
            <br/>
            <h2 style="color: red">You will be directed to login page after <span id="time"></span> seconds</h2>
        </div>
        <script>
            var count = 3;
            var time = document.getElementById('time');
            time.innerHTML = count;
            function counting()
            {
                count--;
                time.innerHTML = count;
                if (count <= 0)
                {
                    window.location.href = 'login';
                }
            }
            setInterval(counting, 1000);

        </script>
    </body>
</html>
