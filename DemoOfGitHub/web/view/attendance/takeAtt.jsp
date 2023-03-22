<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }

            body{
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
                margin-left: 400px;
                background-color: rgba(107,142,35, 0.5);
                align-content: center;
                width:500px;
                height:100px;
                border-radius: 3px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            span{
                text-align: center;
                color: whitesmoke;
                margin-left: 20px;
            }
            tr{
                text-align: center;

            }
            th{
                text-align: center;
            }
        </style>
    </head>

    <body> 
        <div class="container" style="margin-left: 100px">
            <div class="head_title">
                <h1><span>FPT University Academic Portal</span></h1>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 670px">
                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
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
            <form action="attendance" method="POST"> 
                <table style="margin-left: 100px; margin-top: 50px; border: 2px solid black">
                    <thead>
                        <tr style="background-color: rgb(0, 179, 255);text-align: center;">
                            <th style="width: 80px">INDEX</th>
                            <th style="width: 180px">IMAGE</th>
                            <th style="width: 140px">CODE</th>
                            <th style="width: 280px">FULL NAME</th>
                            <th style="width: 150px">ATTENDANCE STATUS</td>
                            <th style="width: 200px">LECTURER'S COMMENT</td>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.atts}" var="a" varStatus="loop">
                            <tr>
                                <td style="background-color: #dddddd"><strong>${loop.index +1}</strong></td>
                                <td><img src="${a.student.img}" alt="alt"/></td>
                                <td style="border:2px solid yellow;
                                    padding: 2px;
                                    margin: 2px;
                                    border-radius: 3px;
                                    font-family: 'Arial', Tahoma, Geneva, Verdana, sans-serif;
                                    color: white;
                                    font-size: 20px;
                                    font-weight: bold;
                                    background-color: rgba(0,250,154, 0.5);">${a.student.code}</td>
                                <td style="border:2px solid yellow;
                                    padding: 2px;
                                    margin: 2px;
                                    border-radius: 3px;
                                    font-family: 'Arial', Tahoma, Geneva, Verdana, sans-serif;
                                    color: white;
                                    font-size: 20px;
                                    font-weight: bold;
                                    background-color: rgba(0,250,154, 0.5);">${a.student.name}</td>
                                <td style="border:2px solid yellow;
                                    padding: 2px;
                                    margin: 2px;
                                    border-radius: 3px;
                                    font-family: 'Arial', Tahoma, Geneva, Verdana, sans-serif;
                                    color: white;
                                    font-size: 20px;
                                    font-weight: bold;
                                    background-color: rgba(0,250,154, 0.5);">
                                    <input type="radio" 
                                           <c:if test="${!a.status}">
                                               checked="checked" 
                                           </c:if>
                                           name="status${a.student.id}" value="Absent"/> Absent<br><!-- comment -->
                                    <input type="radio" 
                                           <c:if test="${a.status}">
                                               checked="checked" 
                                           </c:if>
                                           name="status${a.student.id}" value="Attended" /> Attended
                                </td>
                                <td>
                                    <input type="hidden" name="sid" value="${a.student.id}"/>
                                    <input type="hidden" name="aid${a.student.id}" value="${a.id}"/>
                                    <input type="text" name="description${a.student.id}" value="${a.description}"/></td>
                            </tr>    
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" name="sessionid" value="${param.sesid}"/>
                <div class="save"><!-- comment -->
                    <input style="width: 160px; height: 60px; margin-left: 500px; border: solid black 1px; border-radius: 3px;
                           background-color: aqua; color: white;
                           font-size: 30px;cursor:pointer;" type="submit" value="Save"/>
                </div>

            </form>

        </div>
    </body>
</html>
