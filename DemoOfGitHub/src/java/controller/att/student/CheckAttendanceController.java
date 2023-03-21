/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.att.student;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.CourseDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Campus;
import model.Course;
import model.Session;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckAttendanceController", urlPatterns = {"/checkAtt"})
public class CheckAttendanceController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int a = (int) req.getSession().getAttribute("id");
        StudentDBContext studb = new StudentDBContext();
        ArrayList<Student> stu = studb.getStdCode(a);
        req.setAttribute("stu", stu);
        Student currentStu = stu.get(0);
        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(a);
        req.setAttribute("camps", camps);

        CourseDBContext cb = new CourseDBContext();
        ArrayList<Course> courses = cb.getStdCourse(currentStu.getId());
        req.setAttribute("courses", courses);
        String raw_course = req.getParameter("course");
        if (raw_course != null) {
            int course = Integer.parseInt(raw_course);
            SessionDBContext sdb = new SessionDBContext();
            ArrayList<Session> ses1 = sdb.checkAtt(course, currentStu.getId());
            req.setAttribute("ses1", ses1);
        }
        req.getRequestDispatcher("view/attendance/checkAtt.jsp").forward(req, resp);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

}
