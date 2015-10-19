/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Factory;

import com.cripisi.Employee.Employee;
import com.cripisi.Employee.EmployeeDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author deathman28
 */
public class MySqlDBEmployeeDAO implements EmployeeDAO {
    
     private static final String SQL_INSERT_NEW_EMPLOYEE = "insert into employee(employeeId,userId,dept_name,first_name,last_name,middle_name,job_position,email,contact_num) values (?,?,?,?,?,?,?,?,?)";
     private static final String SQL_GET_JOBLIST_EMPLOYEE = "Select employeeId, first_name,last_name, job_position from employee where job_positon = ?";
     private static final String SQL_GET_EMPLOYEEID_EMPLOYEE = "Select employeeId, first_name,last_name, job_position from employee where userId = ?";
     private static final String SQL_UPDATE_DETAILS_EMPLOYEE = "update employee set userId = ?, deptName = ?, first_name = ?, last_name = ?, middle_name = ? , job_position = ?, email = ?, contact_num = ?";
     private static final String SQL_DELETE_RECORD_EMPLOYEE = "delete from employee where userId = ?";
     @Override
    public void insertEmployee(Employee employee1){
         try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement( SQL_INSERT_NEW_EMPLOYEE );
            pstmt.setString(1, employee1.getEmployeeId());
            pstmt.setInt(2, employee1.getUserId());
            pstmt.setString(3,employee1. getDeptName());
            pstmt.setString(4,employee1. getFirst_name());
            pstmt.setString(5,employee1. getLast_name());
            pstmt.setString(6,employee1. getMiddle_name());
            pstmt.setString(7,employee1. getJob_position());
            pstmt.setString(8,employee1. getEmail());
            pstmt.setInt(9,employee1. getContact_num());
             
            
            pstmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }
    
     @Override
      public ArrayList<Employee> getEmployeestByPosition(Employee employee1){
            ResultSet rs = null;
           ArrayList<Employee> ListEmployees = new ArrayList<>();
          try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement( SQL_GET_JOBLIST_EMPLOYEE );
            pstmt.setString(1, employee1.getJob_position());
            rs = pstmt.executeQuery();
            while(rs.next())
             {
                Employee employee2 = new Employee();
                employee2.setEmployeeId(rs.getString("employeeId"));
                employee2.setFirst_name(rs.getString("first_name"));
                employee2.setLast_name(rs.getString("last_name"));
                employee2.setJob_position(rs.getString("job_position"));
                ListEmployees.add(employee2);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
          return ListEmployees;
      }
      
       @Override
      public Employee getEmployeeById(Employee employee1){
            ResultSet rs = null;
           Employee employee2 = new Employee();
           Connection conn =  MySqlDbDAOFactory.createConnection();
          try {
            PreparedStatement pstmt = conn.prepareStatement( SQL_GET_EMPLOYEEID_EMPLOYEE );
            pstmt.setInt(1, employee1.getUserId());
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                employee2.setEmployeeId(rs.getString("employeeId"));
                employee2.setFirst_name(rs.getString("first_name"));
                employee2.setLast_name(rs.getString("last_name"));
                employee2.setJob_position(rs.getString("job_position"));
            }
            conn.close();
        } catch (SQLException ex) { 
             Logger.getLogger(MySqlDBEmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
         } 
          return employee2;
      }

    @Override
    public void updateEmployee(Employee employee1) {
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_UPDATE_DETAILS_EMPLOYEE );
            pstmt.setInt(1, employee1.getUserId());
            pstmt.setString(2,employee1. getDeptName());
            pstmt.setString(3,employee1. getFirst_name());
            pstmt.setString(4,employee1. getLast_name());
            pstmt.setString(5,employee1. getMiddle_name());
            pstmt.setString(6,employee1. getJob_position());
            pstmt.setString(7,employee1. getEmail());
            pstmt.setInt(8,employee1. getContact_num());
            pstmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }
    
     @Override
    public void deleteEmployee(Employee employee1) {
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement( SQL_DELETE_RECORD_EMPLOYEE  );
            pstmt.setInt(1, employee1.getUserId());
            pstmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }
}
