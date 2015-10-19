/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Employee;

import java.sql.Date;

/**
 *
 * @author deathman28
 */
public class Employee {
    private String employeeId;
    private int contact_num;
    private String first_name;
    private String last_name;
    private String middle_name;
    private String job_position;
    private String email;
    private Date hireDate;
    private int userId;
    private String deptName;
    
     public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public int getContact_num() {
        return contact_num;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public String getJob_position() {
        return job_position;
    }

    public String getEmail() {
        return email;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public void setContact_num(int contact_num) {
        this.contact_num = contact_num;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public void setJob_position(String job_position) {
        this.job_position = job_position;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }
   
}
