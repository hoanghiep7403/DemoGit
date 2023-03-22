

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            a {
                color: blue;
                text-decoration: none;
            }
            a:hover {
                color: black;
                text-decoration: underline;
            }
            a:active {
                color: red;
            }
            body{
                background-image: url('870517.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 120%;
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
                text-align: center;
                color: whitesmoke;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container" style="margin-left: 200px">
            <div class="head_title">
                <h1><span>FPT University Academic Portal</span></h1>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 900px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.lec ne null}">
                        <c:forEach items="${requestScope.lec}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="schedule"><h3 style="margin-top: 8px;"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| Groups</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 420px">
                    <c:if test="${requestScope.lec ne null}">
                        <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
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
            <table style="margin-top: 50px; border: 2px solid black">
                <thead>
                    <tr style="background-color: rgb(0, 179, 255);">
                        <th style="width: 70px; text-align: center;">INDEX</th>
                        <th style="width: 190px; text-align: center;">IMAGE</th>
                        <th style="width: 100px; text-align: center;">CODE</th>
                        <th style="width: 170px; text-align: center;">FULL NAME</th>
                            <c:forEach items="${requestScope.ss}" var="ss" varStatus="loop">
                            <th style="width: 200px; text-align: center;">Session ${loop.index + 1}</th>
                            </c:forEach>
                        <th style="width: 170px; text-align: center;">ABSENT</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                    <script>
                        var absent = 0;
                    </script>
                    <tr style="background-color: #dddddd">
                        <td style="text-align: center"><strong>${loop.index + 1}</strong></td>
                        <td style="text-align: center"><img src="${s.img}" alt="alt"/></td>
                        <td style="text-align: center"><strong>${s.code}</strong></td>
                        <td style="text-align: center"><strong>${s.name}</strong></td>
                        <c:forEach items="${requestScope.att}" var="att" varStatus="loops">
                            <c:if test="${att.student.id eq s.id}">
                                <c:if test="${att.session.status eq true}">
                                    <c:if test="${att.status eq true}">
                                        <td style="text-align: center"><b style="color: rgb(67, 205, 128)">Present</b><br/></td>
                                        </c:if>
                                        <c:if test="${att.status eq false}">
                                        <td style="text-align: center"><b style="color: red">Absent</b><br/></td>
                                    <script>
                                        absent = absent + 1;
                                    </script>
                                </c:if>
                            </c:if>
                            <c:if test="${att.session.status eq false}">
                                <td style="text-align: center"><b>_</b><br/></td>
                                </c:if>
                            </c:if>
                        <script>
                            var count = "${loops.index+1}";
                        </script>
                    </c:forEach>
                    <script>
                        var average = absent / count * 100;
                        var round = Math.round((average + Number.EPSILON) * 100) / 100;
                    </script>    
                    <td style="text-align: center"><strong>
                            <script>
                                document.write(round + "%");
                            </script>
                        </strong>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </body>
</html>
