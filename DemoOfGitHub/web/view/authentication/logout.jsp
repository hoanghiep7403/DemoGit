<%-- 
    Document   : login
    Created on : Mar 12, 2023, 5:34:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="text-align: center">

            <h1>Log out successful!</h1>
            <br/>
            You will be directed to /login after <span id="time"></span> seconds
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
