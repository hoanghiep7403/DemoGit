<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
        <title>
            Check Attendance
        </title>

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
        tr, td{
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
        caption{
            border:2px solid white;
            padding:5px;
            margin-left: 100px;
            background-color: rgba(107,142,35, 0.5);
            align-content: center;
            width:500px;
            height:100px;
            border-radius: 3px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: whitesmoke;
        }
        </style>
    </head>
    
    <body>
        <div class="container" style="margin-left: 100px">

            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <a style="margin-left: 20px;" href="timetable"><h3 style="margin-top: 8px;"><strong>Timetable</strong></h3></a>
                    </c:forEach>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 600px">
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
            <div class="row" style="margin-top: 100px; display: flex">
                <div>
                    <table style=" border: 2px solid black; margin-top: 40px;">
                        <caption style="text-align: center; font-size: large"><h1>Select a course</h1></caption>
                        <thead style="background-color: rgb(0, 179, 255);">
                            <tr>
                                <th scope="col" style="width: 100px; text-align: center;">Campus</th>
                                <th scope="col" style="width: 420px; text-align: center;">Course</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table border="1">
                                        <tr>
                                            <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                            <strong>${cs.name}</strong>
                                        </c:forEach>
                            </tr>
                    </table> 
                    </td>
                    <td valign="top">
                        <table border="1">
                            <tr>
                                <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                <a style="margin-bottom: 5px" href="checkAtt?course=${c.id}" name="course"><strong>${c.name}</strong> </a><strong>(${c.code})</strong><br/>
                                    </c:forEach>
                            </tr>
                        </table> 
                    </td>
                    </tr>
                    </tbody>
                    </table>
                </div>
                <div>
                    <table style=" border: 2px solid black">
                        <caption style="text-align: center; font-size: large; margin-left: 200px; margin-bottom: 24px"><h1>Record of Attendance here</h1></caption>
                        <br/>
                        <thead style="background-color: rgb(0, 179, 255);">
                            <tr>
                                <th scope="col" style="height: 50px;width: 40px; text-align: center;">NO</th>
                                <th scope="col" style="width: 170px; text-align: center;">DATE</th>
                                <th scope="col" style="width: 110px; text-align: center;">SLOT</th>
                                <th scope="col" style="width: 60px; text-align: center;">ROOM</th>
                                <th scope="col" style="width: 100px; text-align: center;">LECTURER</th>
                                <th scope="col" style="width: 80px; text-align: center;">GROUP NAME</th>
                                <th scope="col" style="width: 120px; text-align: center;">ATTENDANCE STATUS</th>
                                <th scope="col" style="width: 120px; text-align: center;">LECTURER'S COMMENT</th>
                            </tr>
                        </thead>
                        <tbody>
                        <script>
                            var absent = 0;
                        </script>
                        <c:forEach items="${requestScope.ses1}" var="ss" varStatus="loop">
                            <tr>
                                <td valign="top" style="height: 50px">
                                    ${loop.index+1}
                                </td>
                                <td valign="top">
                                    <button style="background-color: #337ab7; color: white; border: 0px">
                                        
                                        <fmt:formatDate value="${ss.date}" type="date"/><br/><fmt:formatDate value="${ss.date}" pattern="EEEE"/>
                                    
                                    </button>
                                </td>
                                <td valign="top">
                                    <button style="background-color: #d9534f; color: white; border: 0px">
                                        ${ss.slot.id}_${ss.slot.name}
                                    </button>
                                </td>
                                <td valign="top">${ss.room.name}</td>
                                <td valign="top">${ss.lecturer.code}</td>
                                <td valign="top">${ss.group.name}</td>
                                <td valign="top">
                                    <c:if test="${ss.status eq true}">
                                        <c:if test="${ss.attendance.status eq true}">
                                            <b style="color: rgb(67, 205, 128)">Present</b><br/>
                                        </c:if>
                                        <c:if test="${ss.attendance.status eq false}">
                                            <b style="color: red">Absent</b><br/>
                                            <script>
                                                absent = absent + 1;
                                            </script>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${ss.status eq false}">
                                        <b style="color: black">Future</b><br/>
                                    </c:if>
                                </td>
                                <td valign="top">${ss.attendance.description}</td>
                            </tr>
                            <script>
                                var count = "${loop.index+1}";
                            </script>
                        </c:forEach>
                        <script>
                            var average = absent / count * 100;
                        </script>
                        </tbody>
                        <tfoot>                       
                        <td colspan="8">
                            <h3>                                
                                <script>
                                    document.write("ABSENT: " + average + "% ABSENT SO FAR(" + absent + " ABSENT ON " + count + " TOTAL)");
                                </script>
                            </h3>
                        </td>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div>
    </body>

</html>