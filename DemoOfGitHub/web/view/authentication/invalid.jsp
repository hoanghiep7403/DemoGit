

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="text-align: center">
            <h1 style="color: red">Invalid username or password</h1>
            <br/>
            <b style="color: red">You will be directed to /login after <span id="time"></span> seconds</b>
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
