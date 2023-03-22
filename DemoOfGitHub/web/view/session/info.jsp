
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                border: 2px solid black;
            }
            th{
                text-align: center;
            }
        </style>
    </head>

    <body>
        <div class="container" style="margin-left: 150px">
            <div class="head_title">
                <h1><span>FPT University Academic Portal</span></h1>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px;"><strong>Timetable</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../schedule"><h3 style="margin-top: 8px;"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| View</strong></h3></a>               
                </div>
                <div class="col-md-6" style="margin-left: 640px">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../student/info">${s.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
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
            <table style="margin-top: 30px;margin-left: 350px;border: 2px solid black; border-radius: 2px;">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 30px">Activity detail</h2>
                                <br/>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.sessions}" var="s" varStatus="loop">
                                        <tr>
                                            <td style="width: 200px; border-bottom: solid brown 1px"><b>Date:</b></td>
                                            <td style="width: 350px; border-bottom: solid brown 1px"><fmt:formatDate value="${s.date}" pattern="EEEE"/> - <fmt:formatDate value="${s.date}" type="date"/></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Slot:</b></td>
                                            <td style=" border-bottom: solid brown 1px">${s.slot.id}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Student group:</b></td>                                    
                                            <td style=" border-bottom: solid brown 1px"><a style="color: blue" href="../student/group?class=${s.group.id}">${s.group.name}</a></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Instructor:</b></td>
                                            <td style=" border-bottom: solid brown 1px"><a style="color: blue" href="../lecturer/info?lecturer=${s.lecturer.id}">${s.lecturer.code}</a></td>

                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Course:</b></td>
                                            <td style=" border-bottom: solid brown 1px">${s.course.name}(${s.course.code})</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Course session number:</b></td>
                                            <td style=" border-bottom: solid brown 1px"></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid brown 1px"><b>Course session description:</b></td>
                                            <td style="border-bottom: solid brown 1px"></td>
                                        </tr>
                                        <tr>
                                            <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                                                <td style=" border-bottom: solid brown 1px"><b>Campus/Programme:</b></td>
                                                <td style=" border-bottom: solid brown 1px">${cs.name}</td>
                                            </c:forEach>
                                        </tr>
                                        <tr>
                                            <td><b>Attendance:</b></td>
                                            <c:if test="${s.status eq true}">
                                                <%--<c:if test="${s.status eq true}">--%>
                                                <td>Attended</td>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${s.status eq false}">--%>
                                                <!--<td style=" border-bottom: solid lightgray 1px">Absent</td>-->
                                                <%--</c:if>--%>                                      
                                            </c:if>
                                            <c:if test="${s.status eq false}">
                                                <td>Not yet</td>
                                            </c:if>
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
