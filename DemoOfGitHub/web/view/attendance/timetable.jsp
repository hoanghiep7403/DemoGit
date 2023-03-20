<%-- 
    Document   : timetable
    Created on : Mar 12, 2023, 9:23:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
            align-content: center;
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
    <body>
        <div class="container" style="margin-left: 100px">
            <div class="head_title">
                <h1><span>FPT University Academic Portal</span></h1>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-8" style="text-align: left; display: flex">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Timetable</strong></h3></a>
                    </c:forEach>

                </div>
                <div class="col-md-4" style="margin-left: 680px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="student/info">${s.account.accountName}</a>
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
            <form style="margin-left: 100px" action="timetable" method="GET">
                <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                    <h1 style="width: 300px; height: 50px; margin-left: 100px; border: solid black 1px; border-radius: 3px; padding: 2px auto;
                        background-color: aqua; color: black;
                        font-size: 20px;">Activities for ${s.code} (${s.name})</h1>
                </c:forEach>
                <table style="border: solid 2px black">
                    <thead>
                        <tr style="background-color: orange">
                            <th style="text-align: left">From: <input type="date" name="from"/><br/>
                                To: <input type="date" name="to"/><br/>
                            </th>
                            <th>
                                <input style="height: 45px;background-color: orange" type="submit" value="Enter"/>
                            </th>
                        </tr>
                    </thead>
                </table>
            </form>
            <div style="margin-left: 100px">
                <c:if test="${requestScope.dates ne null}">
                    <table style="border: 2px solid black;" border="1px"> 
                        <tr style="background-color: orange">
                            <td></td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td><fmt:formatDate value="${d}" type="date"/><br/><fmt:formatDate value="${d}" pattern="EEEE"/>
                                </td>
                            </c:forEach>

                        </tr>
                        <c:forEach items="${requestScope.slots}" var="slot"> 
                            <tr>
                                <td style="background-color: rgb(234, 234, 234)">Slot ${slot.id}</td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <td style="width: 120px">
                                        <c:forEach items="${requestScope.s.groups}" var="g">
                                            <c:forEach items="${g.sessions}" var="ses" varStatus="loop">
                                                <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                    <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                    at ${ses.room.name} <br/>
                                                    <c:if test="${ses.status eq true}">
                                                        <c:if test="${ses.attendance.status eq true}">
                                                            <b style="color: rgb(67, 205, 128)">(Attended)</b><br/>
                                                        </c:if>
                                                        <c:if test="${ses.attendance.status eq false}">
                                                            <b style="color: red">(Absent)</b><br/>
                                                        </c:if>
                                                    </c:if>
                                                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                                        <c:if test="${ses.status eq false}">
                                                            <b style="color: red">(Not yet)</b><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <button style="background-color: rgb(67, 205, 128); color: white">
                                                        ${ses.slot.name}
                                                    </button>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>

        </div>
    </body>
</html>
