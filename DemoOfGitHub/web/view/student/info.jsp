

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info</title>
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }

            body{
                background-color: cyan;
                background-image: url('870517.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 120%;
            }

            p{
                font-size: 50px;
                margin-right: 50px;
            }
            td{
                background-color: rgba(127,255,212, 0.5);
                text-align: center;

            }
            .head_title{
                border:2px solid white;
                padding:5px;
                margin-left: 300px;
                background-color: rgba(107,142,35, 0.5);
                align-content: center;
                width:500px;
                height:100px;
                border-radius: 3px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            span{
                align-content: center;
                color: whitesmoke;
                margin-left: 20px;
            }
            tr{
                text-align: center;
                border: 2px solid black;
            }
            th{
                text-align: center;
            }
        </style>
    </head>

    <body>
        <div class="container" style="margin-left: 200px">
            <div class="head_title">
                <h1><span>FPT University Academic Portal</span></h1>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 50px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px;"><strong>Timetable</strong></h3></a>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3></a>                </div>
                <div class="col-md-6" style="margin-left: 600px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="">${s.account.accountName}</a>
                        </button>
                    </c:forEach>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/DemoOfGitHub/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <table style="margin-top: 30px;margin-left: 320px;border: 2px solid black; border-radius: 2px;">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 30px;">User detail</h2><br/>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">
                                        <tr>
                                            <td style="width: 150px;border-bottom: solid brown 1px"><b>Username</b></td>
                                            <td style="width: 300px; border-bottom: solid brown 1px">${s.account.accountName}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Full name</b></td>
                                            <td style=" border-bottom: solid brown 1px">${s.name}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Image</b></td>
                                            <td style=" border-bottom: solid brown 1px"><img style="height: 150px; width: 120px" src="${s.img}" alt="alt"/></td>
                                        </tr>
                                        <tr>
                                            <td><b>Email</b></td>
                                            <td>${s.email}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </td> 
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
