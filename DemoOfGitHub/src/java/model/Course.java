/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Course {
    private String cID;
    private String cname;
    private int noCredit;
    private String degLevel;
    private String timeAllo;
    private int scoreScale;
    private boolean isApproved;
    private float minAvg;
    private int numSlot;
    private ArrayList<Student> students = new ArrayList<>();
    private ArrayList<Instructor> instructors = new ArrayList<>();

    public String getcID() {
        return cID;
    }

    public void setcID(String cID) {
        this.cID = cID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getNoCredit() {
        return noCredit;
    }

    public void setNoCredit(int noCredit) {
        this.noCredit = noCredit;
    }

    public String getDegLevel() {
        return degLevel;
    }

    public void setDegLevel(String degLevel) {
        this.degLevel = degLevel;
    }

    public String getTimeAllo() {
        return timeAllo;
    }

    public void setTimeAllo(String timeAllo) {
        this.timeAllo = timeAllo;
    }

    public int getScoreScale() {
        return scoreScale;
    }

    public void setScoreScale(int scoreScale) {
        this.scoreScale = 10;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public float getMinAvg() {
        return minAvg;
    }

    public void setMinAvg(float minAvg) {
        this.minAvg = (float) 5.0;
    }

    public int getNumSlot() {
        return numSlot;
    }

    public void setNumSlot(int numSlot) {
        this.numSlot = numSlot;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    public ArrayList<Instructor> getInstructors() {
        return instructors;
    }

    public void setInstructors(ArrayList<Instructor> instructors) {
        this.instructors = instructors;
    }
    
}
