/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Employee;

import com.cripisi.User.User;
import java.util.ArrayList;

/**
 *
 * @author deathman28
 */
public interface EmployeeDAO {
    
    public void insertEmployee(Employee employee1);
    public void updateEmployee(Employee employee1);
    public void deleteEmployee(Employee employee1);
    public  ArrayList<Employee> getEmployeestByPosition(Employee employee1);
    public Employee getEmployeeById(Employee employee1);
    //public void assignUserID(Employee employee1, User user1);
}
