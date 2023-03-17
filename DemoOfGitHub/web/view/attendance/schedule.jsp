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
    <body>
        <div class="container" style="margin-left: 200px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4" style="margin-left: 400px">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg"
                                         style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg"
                                         style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 740px">
                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                        </button>
                    </c:forEach>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/PRJ_Assignment/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <form style="margin-left: 200px" action="schedule" method="GET">
                <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                    <h1>Activities for ${s.code} (${s.name})</h1>
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
            <div style="margin-left: 200px">
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
                                        <c:forEach items="${requestScope.l.sessions}" var="ses">
                                            <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                at ${ses.room.name} <br/>
                                                <c:if test="${ses.status eq true}">
                                                    <a style="color: blue" href="attendance?sesid=${ses.id}">(Update)</a>
                                                </c:if>
                                                <c:if test="${ses.status eq false}">
                                                    <a style="color: red" href="attendance?sesid=${ses.id}">(Take attendance)</a>
                                                </c:if>
                                                <button style="background-color: rgb(67, 205, 128); color: white">
                                                    ${ses.slot.name}
                                                </button>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
            <div style="margin-bottom: 200px; margin-top: 100px" class="row">
                <div style="margin-left: 150px">
                    <b>Mọi góp ý, thắc mắc xin liên hệ: </b>
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>
                    : Email: 
                    <a style="color: blue" href="">dichvusinhvien@fe.edu.vn</a>
                    . Điện thoại: 
                    <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(098)2.730.924 </span>
                </div>
                <tr>
                    <td>
                        <p style="text-align: center; margin-right: 20px">
                            © Powered by <a style="color: blue" href="" target="_blank">FPT University</a>&nbsp;|&nbsp;
                            <a style="color: blue" href="" target="_blank">CMS</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">library</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">books24x7</a>
                            <span id="ctl00_lblHelpdesk"></span>
                        </p>
                    </td>
                </tr>
            </div>
        </div>
    </body>
</html>
