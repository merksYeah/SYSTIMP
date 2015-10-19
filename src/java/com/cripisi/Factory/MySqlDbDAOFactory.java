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
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author deathman28
 */
public class MySqlDbDAOFactory extends DAOFactory {
       private static final String username="root";
       private static final String password="omegaman123";
       private static final String url="jdbc:mysql://localhost:3306/mydb";
       private static final String driverName="com.mysql.jdbc.Driver";  
       private static final String dataSourceName ="java:comp/env/jdbc/appsdevDB";
    
       public static Connection createConnection() {
           try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSourceName);
            Connection conn = ds.getConnection();
            return conn;
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(MySqlDbDAOFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        }
       
    /**
     *
     * @return
     */
    @Override
  public UserDAO getUserDAO() {
    // OracleDbCustomerDAO implements CustomerDAO
    return new MySqlDbUserDAO();
  }
  
       @Override
  public EmployeeDAO getEmployeeDAO(){
      return new MySqlDBEmployeeDAO();
  }

    @Override
    public CustomerDAO getCustomerDAO() {
      return new MySqlDBCustomerDAO();
    }
    
    @Override
    public ProductDAO getProductDAO() {
      return new MySqlDBProductDAO();
    }
    
     @Override
    public SalesOrderDAO getSalesOrderDAO() {
      return new MySqlDBSalesOrderDAO();
    }
    
    @Override
    public PurchaseOrderDAO getPurchaseOrderDAO() {
        return new MySqlDBPurchaseOrderDAO();
    }


    
}
