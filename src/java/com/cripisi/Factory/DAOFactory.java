/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Factory;

import com.cripisi.Customer.CustomerDAO;
import com.cripisi.Employee.EmployeeDAO;
import com.cripisi.Product.ProductDAO;
import com.cripisi.PurchaseOrder.PurchaseOrderDAO;
import com.cripisi.SalesOrder.SalesOrderDAO;
import com.cripisi.User.UserDAO;

/**
 *
 * @author deathman28
 */
public abstract class DAOFactory {
   public static final int MYSQL = 1;
   
  public abstract UserDAO getUserDAO();
  public abstract EmployeeDAO getEmployeeDAO();
  public abstract CustomerDAO getCustomerDAO();
  public abstract ProductDAO getProductDAO();
  public abstract SalesOrderDAO getSalesOrderDAO();
  public abstract PurchaseOrderDAO getPurchaseOrderDAO();

    
   public static DAOFactory getDAOFactory(int whichFactory){
      switch (whichFactory){
       case MYSQL: 
          return new MySqlDbDAOFactory();
       default           : 
          return null;
      }
   }

    
           
    
}
