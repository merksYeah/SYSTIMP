/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Factory;

import com.cripisi.Customer.Customer;
import com.cripisi.Employee.Employee;
import com.cripisi.HomePage.OrderList;
import com.cripisi.Product.Product;
import com.cripisi.SalesOrder.SalesOrder;
import com.cripisi.SalesOrder.SalesOrderDAO;
import com.cripisi.barchart.barchart;
import com.cripisi.calendar.FullCalendar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Dea
 */
public class MySqlDBSalesOrderDAO implements SalesOrderDAO{
     
    private static final String SQL_GET_ALL_ORDERED_PRODUTS="select * from salesorder_has_product sp join product p on sp.productCode = p.productCode where salesorderid=? group by p.productCode";
    private static final String SQL_NEW_SALES_ORDER="insert into salesorder(customer_tin, deliver_to, order_date) values (?,?,?)";
    private static final String SQL_ADD_PRODUCTS_TO_SALES_ORDER="insert into salesorder_has_product (productCode, salesorderid, orderQuantity) values(?,?,?)";
        private static final String SQL_ADD_PRODUCTDELIVERED_TO_SALES_ORDER="insert into salesorder_has_product (productCode, salesorderid, orderQuantity,fulfilledQuantity) values(?,?,?,?)";
    private static final String SQL_GET_ALL_SALES_ORDER="select * from salesorder s join customer c on s.customer_tin = c.customerTin join orderstatus o on s.statusCode = o.statusCode where s.statusCode != ?";
    private static final String SQL_UPDATE_SALES_ORDER="update salesorder set statusCode =? where SalesOrderId = ?";
    private static final String SQL_UPDATE_SALES_ORDER_COMMENTS = "update salesorder set comments = ? where SalesOrderId = ?";
    private static final String SQL_GET_CUSTOMER_ORDERS = "select * from salesorder s join customer c on c.customerTin = s.customer_tin join orderstatus o on s.statusCode = o.statusCode where customer_tin = ? and s.statusCode like ? order by date_issued desc";
    private static final String SQL_GET_SALESAGENT_ORDERS ="SELECT * FROM salesorder so\n" +
                                                            "join customer cs on cs.customerTin = so.customer_tin\n" +
                                                            "where EmployeeId = ?";
    private static final String SQL_GET_ORDER_ORDERDETAILS ="SELECT package,productName,orderQuantity ,quantity FROM salesorder_has_product sp join product p on sp.productCode = p.productCode where SalesOrderId = ?";
    private static final String SQL_GET_PRODUCT_SALES = "select * from productssoldpermonth\n" +
                                                        "where month = ? and year = ? LIMIT 8";
    private static final String SQL_GET_INPROCESS_ORDERS = "SELECT * from salesorder where statuscode = ?";
    private static final String SQL_GET_INPROCESS_ORDERDETAILS = "SELECT salesorderId,p.productCode,productName, orderQuantity,sum(fulfilledQuantity) as fulfilledQuantity \n" +
                                                                    "FROM salesorder_has_product sp\n" +
                                                                    "join product p on sp.productCode = p.productCode\n" +
                                                                    "where salesorderId = ?\n" +
                                                                    "group by productCode";
    private static final String SQL_UPDATE_PRICEMODEL = "update salesorder_has_product set priceEach = ? where salesorderid = ? and productCode = ?";
    private static final String SQL_GET_PRICEMODEL = "SELECT * FROM mydb.salesorder_has_product sp join product p on sp.productCode = p.productCode where salesorderid = ? group by sp.productCode";
    private static final String SQL_UPDATE_DELIVERYDATE = "update salesorder set statusCode = ?, order_date = ? where salesorderid = ?";
    private static final String SQL_GET_AGENT_ORDERS = "Select o.statusDesc, s.date_delivered,s.deliver_to,cs.clientName,s.statusCode,s.salesOrderId, s.customer_tin, date_issued,order_date, IF(p.STOCKSTATUS > 0,'O','F') as stockStatus from salesorder s \n" +
                                                        "left join(SELECT salesorderid, count(*) as STOCKSTATUS FROM mydb.salesorder_has_product sp \n" +
                                                        "join product p on sp.productCode = p.productCode\n" +
                                                        "where p.quantity <= sp.orderquantity group by salesorderid) p on s.SalesOrderId = p.salesorderid\n" +
                                                         "join orderstatus o on o.statusCode = s.statusCode\n" +
                                                        "join customer cs on cs.customerTin = s.customer_tin\n" +
                                                        "where customer_tin like ? and s.statusCode like ? and EmployeeId = ? order by s.salesorderid";
    private static final String SQL_GET_CURRENT_ORDERS = "SELECT * from salesorder s join orderstatus o on s.statusCode = o.statusCode where s.statuscode = ? and customer_tin = ? and DATE(date_issued) = DATE(NOW()) order by date_issued desc";
     private static final String SQL_GET_CURRENT_ORDERS_SALESAGENT = "SELECT * from salesorder s join orderstatus o on s.statusCode = o.statusCode join customer c on s.customer_tin = c.customerTin where s.statuscode = ? and employeeID = ? and DATE(date_issued) = DATE(NOW()) order by date_issued desc";
     private static final String SQL_GET_CURRENT_DELIVEREDORDERS = "SELECT * from salesorder s join orderstatus o on s.statusCode = o.statusCode where s.statuscode = ?  and customer_tin = ? and DATE(date_delivered) = DATE(NOW()) order by date_delivered desc";
     private static final String SQL_ORDERLIST_NUMBERS_CUSTOMER = "Select 	SUM(statusCode = 'D') AS DELIVERED,\n" +
                                                                        "		SUM(statusCode = 'I') AS INPROCESS, SUM(statusCode ='R') AS REORDERING, SUM(statusCode='C') as CANCELED\n" +
                                                                        "        from salesorder\n" +
                                                                        "	    where customer_tin = ? and DATE(date_issued) = DATE(NOW()) or DATE(date_delivered) = DATE(NOW()); ;";
     private static final String SQL_ORDERLIST_NUMBERS_SALESAGENT = "Select 	SUM(statusCode = 'D') AS DELIVERED,\n" +
                                                                    "SUM(statusCode = 'I') AS INPROCESS, \n" +
                                                                    "SUM(statusCode ='R') AS REORDERING, \n" +
                                                                    "SUM(statusCode='C') as CANCELED\n" +
                                                                    "from salesorder s join customer c on s.customer_tin = c.customerTin\n" +
                                                                    "where DATE(date_issued) = DATE(NOW()) or DATE(date_delivered) = DATE(NOW()) and employeeId = ?";
    private static final String SQL_CHECK_SUFFICIENCY = "SELECT s.salesorderid, count(*) as countStock \n" +
                                                        "from salesorder_has_product sp \n" +
                                                        "		join product p on sp.productCode = p.productCode \n" +
                                                        "        join salesorder s on s.salesOrderID = sp.salesOrderID\n" +
                                                        "        where sp.orderQuantity > p.quantity and s.salesorderId = ?\n" +
                                                        "        group by s.salesorderid";
    private static final String SQL_MONTHLY_REVENUE = "Select s.salesorderid,MONTHNAME(date_delivered) as Month, year(date_delivered) as Year, sum(orderquantity * priceEach) as revenue\n" +
                                                        "from salesorder s\n" +
                                                        "	join salesorder_has_product sp on s.salesorderid = sp.SalesOrderId join customer c on c.customerTin = s.customer_tin \n" +
                                                        "    where YEAR(date_delivered) = YEAR(now()) and employeeId = ?\n" +
                                                        "    group by Month\n" +
                                                        "    order by month\n" +
                                                        "    ";
    private static final String SQL_MONTHLY_REVENUEBREAKDOWN = "Select s.salesorderid,clientName,MONTHNAME(date_delivered) as Month, year(date_delivered) as Year, sum(orderquantity * priceEach) as revenue\n" +
"from salesorder s\n" +
"	join salesorder_has_product sp on s.salesorderid = sp.SalesOrderId\n" +
"    join customer c on c.customerTin = s.customer_tin\n" +
"    where YEAR(date_delivered) = Year(now()) and employeeId = ?\n" +
"    group by salesorderid\n" +
"    order by month";
     @Override
    public ArrayList<Product> getOrderedProducts(SalesOrder so){
        ResultSet rs = null;
        Connection conn = MySqlDbDAOFactory.createConnection();
        ArrayList<Product> productsList = new ArrayList<>();
        try {   
            PreparedStatement pstmt = conn.prepareStatement( SQL_GET_ALL_ORDERED_PRODUTS);
            pstmt.setInt(1, so.getOrder_id());
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                Product prod = new Product();
                prod.setProductName(rs.getString("ProductName"));
                prod.setProductCode(rs.getString("ProductCode"));
                prod.setQuantity(rs.getInt("OrderQuantity"));
                productsList.add(prod);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return productsList;
    }
    
    @Override
    public int newSalesOrder(SalesOrder so) {
        ResultSet rs = null;
        boolean value = false;
        int key = 0;
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {
                conn.setAutoCommit(false);
                PreparedStatement pstmt = conn.prepareStatement(SQL_NEW_SALES_ORDER,PreparedStatement.RETURN_GENERATED_KEYS);
                pstmt.setInt(1, so.getCustomer_tin());
                pstmt.setString(2, so.getDeliver_to());
                pstmt.setDate(3, so.getOrder_date());
                pstmt.executeUpdate();
                rs = pstmt.getGeneratedKeys();
                conn.commit();
                if(rs.next()){
                value = true;
                key = rs.getInt(1);
                }
                 conn.close();
            } catch (SQLException ex) {
            try {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            }
       
        if(value){
             return key;
        }
        else
            return 0;
       
        }
    
    
    @Override
    public void addProducts(SalesOrder so){
        String[] product = so.getProducts();
        String[] quantity = so.getQuantity();
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_ADD_PRODUCTS_TO_SALES_ORDER);
               conn.setAutoCommit(false);
                for (int i=0; i<product.length; i++){
                    pstmt.setString(1, product[i]);
                    pstmt.setInt(2, so.getOrder_id());
                    pstmt.setInt(3, Integer.parseInt(quantity[i]));
                    pstmt.addBatch();
            }
               	pstmt.executeBatch();
        	conn.commit();
                conn.close();
            } catch (SQLException ex) {
            try {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            }
    }

    @Override
    public ArrayList<SalesOrder> getAllSalesOrder() {
    ResultSet rs = null;
    Connection conn = MySqlDbDAOFactory.createConnection();
        ArrayList<SalesOrder> salesOrderList = new ArrayList<>();
        try {   
            PreparedStatement pstmt = conn.prepareStatement(SQL_GET_ALL_SALES_ORDER);
            pstmt.setString(1,"P");
            rs = pstmt.executeQuery();
            while(rs.next()){
                SalesOrder so = new SalesOrder();
                so.setCustomer_name(rs.getString("clientName"));
                so.setOrder_id(rs.getInt("SalesOrderID"));
                so.setClientID(rs.getInt("customer_tin"));
                so.setDeliver_to(rs.getString("deliver_to"));
                so.setDate_issued(rs.getDate("date_issued"));
                so.setOrder_date(rs.getDate("order_date"));
                so.setDate_delivered(rs.getDate("date_delivered"));
                so.setStatusCode(rs.getString("statusDesc"));                        
               // so.setFlag(rs.getInt("flag"));
                salesOrderList.add(so);
            }
             conn.close();
           
        } catch (SQLException ex) {
            Logger.getLogger(SalesOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
         return salesOrderList;
    }
    
    @Override
    public void updateSalesOrder(SalesOrder so){
        Connection conn = MySqlDbDAOFactory.createConnection();
        String[] orderids = so.getOrderIds();
        try {
            PreparedStatement pstmt = conn.prepareStatement( SQL_UPDATE_SALES_ORDER );
             conn.setAutoCommit(false);
              for (int i=0; i<orderids.length; i++){
                  pstmt.setString(1, so.getStatusCode());
                  pstmt.setInt(2,Integer.parseInt(orderids[i]));
                  pstmt.addBatch();
              }
            	pstmt.executeBatch();
                conn.commit();
                 conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBEmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void updateSalesOrderComments(SalesOrder so){
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {
            PreparedStatement pstmt = conn.prepareStatement( SQL_UPDATE_SALES_ORDER_COMMENTS );
             conn.setAutoCommit(false);
                  pstmt.setInt(2, so.getOrder_id());
                  pstmt.setString(1,so.getComments());
                  pstmt.executeUpdate();
                conn.commit();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBEmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<SalesOrder> getSalesOrdersByCustomer(Customer one,SalesOrder so) {
        ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_CUSTOMER_ORDERS );
                    pstmt.setInt(1, one.getCustomerTin());
                    pstmt.setString(2, "%" + so.getStatusCode() + "%");
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder two = new SalesOrder();
                    two.setOrder_id(rs.getInt("SalesOrderId"));
                    two.setDeliver_to(rs.getString("deliver_to"));
                    two.setDate_issued(rs.getDate("date_issued"));
                    two.setOrder_date(rs.getDate("order_date"));
                    two.setDate_delivered(rs.getDate("date_delivered"));
                    two.setStatusCode(rs.getString("statusDesc"));
                    orderList.add(two);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public ArrayList<Product> getOrderDetailsByOrder(SalesOrder so) {
       ResultSet rs = null;
         ArrayList<Product> productList = new ArrayList<Product>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_ORDER_ORDERDETAILS );
                pstmt.setInt(1,so.getOrder_id());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    Product two = new Product();
                    two.setProductName(rs.getString("productName"));
                    two.setQuantity(rs.getInt("orderQuantity"));
                    two.setFulfilledQuantity(rs.getInt("quantity"));
                    two.setPackageType(rs.getString("package"));
                    productList.add(two);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return productList;
    }

    @Override
    public ArrayList<SalesOrder> getSalesOrdersBySalesAgent(Employee one, Customer cs, SalesOrder so) {
           ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_AGENT_ORDERS);     
             if(cs.getCustomerTin() == 1){
                 pstmt.setString(1, "%");
                   
             }
             else{
                 pstmt.setString(1, "%" + cs.getCustomerTin() + "%");
             }
              pstmt.setString(2, "%" + so.getStatusCode() + "%");
             pstmt.setString(3, one.getEmployeeId());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder SO = new SalesOrder();
                    SO.setCustomer_name(rs.getString("clientName"));
                    SO.setOrder_id(rs.getInt("SalesOrderId"));
                    SO.setDeliver_to(rs.getString("deliver_to"));
                    SO.setDate_issued(rs.getDate("date_issued"));
                    SO.setOrder_date(rs.getDate("order_date"));
                    SO.setDate_delivered(rs.getDate("date_delivered"));
                    SO.setStatusCode(rs.getString("statusDesc"));
                    SO.setStock_status(rs.getString("stockStatus"));
                    orderList.add(SO);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public HashMap<String, Double> getProductSalesPerMonth(String month, int year) {
      
      ResultSet rs = null;  
      HashMap<String,Double> report = new HashMap<String,Double>();
      Connection conn = MySqlDbDAOFactory.createConnection();
       try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_PRODUCT_SALES );   
             pstmt.setString(1,month);
             pstmt.setInt(2,year);
             rs = pstmt.executeQuery();
             while(rs.next()){
                 report.put(rs.getString("Product"),rs.getDouble("TotalSales"));
             }
             
              } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                 try {
                    conn.close();
                 } catch (SQLException ex) {
                     Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                 }
            }
      return report;
    }

    @Override
    public ArrayList<SalesOrder> getOrders(SalesOrder so) {
          ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_INPROCESS_ORDERS );
                    pstmt.setString(1, so.getStatusCode());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder so2 = new SalesOrder();
                    so2.setOrder_id(rs.getInt("SalesOrderId"));
                    so2.setDeliver_to(rs.getString("deliver_to"));
                    so2.setDate_issued(rs.getDate("date_issued"));
                    so2.setOrder_date(rs.getDate("order_date"));
                    so2.setDate_delivered(rs.getDate("date_delivered"));
                    so2.setStatusCode(rs.getString("statusCode"));
                    orderList.add(so2);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public ArrayList<Product> getInProcessOrderDetails(SalesOrder so) {
         ResultSet rs = null;
         ArrayList<Product> productList = new ArrayList<Product>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_INPROCESS_ORDERDETAILS );
                pstmt.setInt(1,so.getOrder_id());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    Product prod = new Product();
                    prod.setProductName(rs.getString("productName"));
                    prod.setProductCode(rs.getString("productCode"));
                    prod.setQuantity(rs.getInt("orderQuantity"));
                    prod.setFulfilledQuantity(rs.getInt("fulfilledQuantity"));
                    productList.add(prod);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return productList;
    }
    
     @Override
    public void addProductDelivered(SalesOrder so){
        String[] product = so.getProducts();
        String[] quantity = so.getQuantity();
        String[] fulfilledQuantity = so.getFulfilledquantity();
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_ADD_PRODUCTDELIVERED_TO_SALES_ORDER);
               conn.setAutoCommit(false);
                for (int i=0; i<product.length; i++){
                    pstmt.setString(1, product[i]);
                    pstmt.setInt(2, so.getOrder_id());
                    pstmt.setInt(3, Integer.parseInt(quantity[i]));
                    pstmt.setInt(4, Integer.parseInt(fulfilledQuantity[i]));
                    pstmt.addBatch();
            }
               	pstmt.executeBatch();
        	conn.commit();
                conn.close();

            } catch (SQLException ex) {
            try {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            }
    }

    @Override
    public void updateProductPriceModel(SalesOrder so) {
         Connection conn = MySqlDbDAOFactory.createConnection();
         String[] products = so.getProducts();
         String[] prices = so.getPrices();
        try {
            PreparedStatement pstmt = conn.prepareStatement( SQL_UPDATE_PRICEMODEL );
             conn.setAutoCommit(false);
              for (int i=0; i<products.length; i++){
                  pstmt.setInt(1, Integer.parseInt(prices[i]));
                  pstmt.setInt(2,so.getOrder_id());
                  pstmt.setString(3,products[i]);
                  pstmt.addBatch();
              }
            	pstmt.executeBatch();
                conn.commit();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBEmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<Product> getPriceModel(SalesOrder so) {
         ResultSet rs = null;
         ArrayList<Product> productList = new ArrayList<Product>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_PRICEMODEL);
                pstmt.setInt(1,so.getOrder_id());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    Product prod = new Product();
                    prod.setProductCode(rs.getString("productCode"));
                    prod.setProductName(rs.getString("productName"));
                    prod.setNetweight(rs.getDouble("net_weight_per_package"));
                    prod.setPackageType(rs.getString("package"));
                    prod.setQuantity(rs.getInt("orderQuantity"));
                    prod.setMSRP(rs.getDouble("priceEach"));
                    productList.add(prod);
                }
        	
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return productList;
    }

    @Override
     public void updateSalesOrderDeliveryDate(SalesOrder so){
        Connection conn = MySqlDbDAOFactory.createConnection();
        String[] orderids = so.getOrderIds();
        try {
            PreparedStatement pstmt = conn.prepareStatement( SQL_UPDATE_DELIVERYDATE );
             conn.setAutoCommit(false);
              for (int i=0; i<orderids.length; i++){
                  pstmt.setString(1, "I");
                  pstmt.setDate(2, so.getOrder_date());
                  pstmt.setInt(3,Integer.parseInt(orderids[i]));
                  pstmt.addBatch();
              }
            	pstmt.executeBatch();
                conn.commit();
                conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBEmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<SalesOrder> getNonDeliveredOrders(SalesOrder so, Customer cust) {
         ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_CURRENT_ORDERS );
                    pstmt.setString(1, so.getStatusCode());
                    pstmt.setInt(2, cust.getCustomerTin());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder so2 = new SalesOrder();
                    so2.setOrder_id(rs.getInt("SalesOrderId"));
                    so2.setDeliver_to(rs.getString("deliver_to"));
                    so2.setDate_issued(rs.getDate("date_issued"));
                    so2.setOrder_date(rs.getDate("order_date"));
                    so2.setStatusCode(rs.getString("statusDesc"));
                    orderList.add(so2);
                }
        	conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }
    
    @Override
    public ArrayList<SalesOrder> getNonDeliveredOrdersSalesAgent(SalesOrder so, Employee emp) {
         ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_CURRENT_ORDERS_SALESAGENT );
                    pstmt.setString(1, so.getStatusCode());
                    pstmt.setString(2, emp.getEmployeeId());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder so2 = new SalesOrder();
                    so2.setOrder_id(rs.getInt("SalesOrderId"));
                    so2.setDeliver_to(rs.getString("deliver_to"));
                    so2.setDate_issued(rs.getDate("date_issued"));
                    so2.setOrder_date(rs.getDate("order_date"));
                    so2.setStatusCode(rs.getString("statusDesc"));
                    orderList.add(so2);
                }
        	
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }
    
    @Override
    public ArrayList<SalesOrder> getDeliveredOrders(SalesOrder so, Customer cust) {
         ResultSet rs = null;
         ArrayList<SalesOrder> orderList = new ArrayList<SalesOrder>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_CURRENT_DELIVEREDORDERS );
                    pstmt.setString(1, so.getStatusCode());
                    pstmt.setInt(2, cust.getCustomerTin());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    SalesOrder so2 = new SalesOrder();
                    so2.setOrder_id(rs.getInt("SalesOrderId"));
                    so2.setDeliver_to(rs.getString("deliver_to"));
                    so2.setDate_issued(rs.getDate("date_issued"));
                    so2.setOrder_date(rs.getDate("order_date"));
                    so2.setDate_delivered(rs.getDate("date_delivered"));
                    so2.setStatusCode(rs.getString("statusDesc"));
                    orderList.add(so2);
                }
        	 conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public OrderList getOrderList(Customer cust) {
         ResultSet rs = null;
          OrderList list = new OrderList();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_ORDERLIST_NUMBERS_CUSTOMER );
             pstmt.setInt(1, cust.getCustomerTin());
             rs = pstmt.executeQuery();
                while(rs.next()){
                   list.setDeliveredOrderCount(rs.getInt("DELIVERED"));
                   list.setInprocessOrderCount(rs.getInt("INPROCESS"));
                   list.setForReOrderingCount(rs.getInt("REORDERING"));
                   list.setCanceledOrderCount(rs.getInt("CANCELED"));
                }
        	
                 conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return list;
    }
    
      @Override
    public OrderList getOrderListSalesAgent(Employee emp) {
         ResultSet rs = null;
          OrderList list = new OrderList();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_ORDERLIST_NUMBERS_SALESAGENT );
             pstmt.setString(1, emp.getEmployeeId());
             rs = pstmt.executeQuery();
                while(rs.next()){
                   list.setDeliveredOrderCount(rs.getInt("DELIVERED"));
                   list.setInprocessOrderCount(rs.getInt("INPROCESS"));
                   list.setForReOrderingCount(rs.getInt("REORDERING"));
                   list.setCanceledOrderCount(rs.getInt("CANCELED"));
                }
        	
                 conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return list;
    }

    @Override
    public boolean checkSufficiency(SalesOrder so) {
        ResultSet rs = null;
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_CHECK_SUFFICIENCY );
             pstmt.setInt(1, so.getOrder_id());
             rs = pstmt.executeQuery();
             while(rs.next()){
                 if(rs.getInt("countStock") > 0){
                     return false;
                 }
             }
              conn.close();
           }catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return true;
    }

    @Override
    public ArrayList<barchart> getMonthlyRevenue(Employee emp) {
        ResultSet rs = null;
          Connection conn = MySqlDbDAOFactory.createConnection();
          ArrayList<barchart> charts = new ArrayList<barchart>();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_MONTHLY_REVENUE);
             pstmt.setString(1, emp.getEmployeeId());
             rs = pstmt.executeQuery();
             while(rs.next()){
                barchart bar = new barchart();
               
                bar.setLabel(rs.getString("month"));
                bar.setYear(rs.getString("year"));
                bar.setValue(rs.getInt("revenue"));
                charts.add(bar);
             }
              conn.close();
           }catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return charts;
    }
    
     @Override
    public ArrayList<barchart> getMonthlyRevenueBreakdown(Employee emp) {
        ResultSet rs = null;
          Connection conn = MySqlDbDAOFactory.createConnection();
          ArrayList<barchart> charts = new ArrayList<barchart>();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_MONTHLY_REVENUEBREAKDOWN);
                pstmt.setString(1, emp.getEmployeeId());
             rs = pstmt.executeQuery();
             while(rs.next()){
                barchart bar = new barchart();
                 bar.setSalesOrderId(rs.getInt("salesorderid"));
                bar.setCustomerName(rs.getString("clientName"));
                bar.setLabel(rs.getString("month"));
                bar.setYear(rs.getString("year"));
                bar.setValue(rs.getInt("revenue"));
                charts.add(bar);
             }
              conn.close();
           }catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return charts;
    }

    @Override
    public ArrayList<FullCalendar> getSalesAgentCalendar(Employee emp) {
         ResultSet rs = null;
         ArrayList<FullCalendar> orderList = new ArrayList<FullCalendar>();
          Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_SALESAGENT_ORDERS );
                    pstmt.setString(1, emp.getEmployeeId());
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    FullCalendar calendar = new FullCalendar();
                    calendar.setId(rs.getInt("salesorderid"));
                    calendar.setTitle(rs.getString("clientName") + "'s order");
                    calendar.setStart(rs.getDate("order_date"));
                    calendar.setEnd(rs.getDate("order_date"));
                    orderList.add(calendar);
                    
                }
        	 conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public ArrayList<FullCalendar> getCustomerCalendar(Customer cust) {
         ResultSet rs = null; 
         ArrayList<FullCalendar> orderList = new ArrayList<FullCalendar>();
        Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_CUSTOMER_ORDERS );
                    pstmt.setInt(1, cust.getCustomerTin());
                    pstmt.setString(2, "%");
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    FullCalendar calendar = new FullCalendar();
                    calendar.setId(rs.getInt("SalesOrderId"));
                    calendar.setTitle(rs.getString("clientName") + "'s order");
                    calendar.setStart(rs.getDate("order_date"));
                    calendar.setEnd(rs.getDate("order_date"));
                    orderList.add(calendar);
                    
                }
        	
                 conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }

    @Override
    public ArrayList<FullCalendar> getPlantManagerCalendar() {
       ResultSet rs = null; 
         ArrayList<FullCalendar> orderList = new ArrayList<FullCalendar>();
        Connection conn = MySqlDbDAOFactory.createConnection();
           try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_GET_ALL_SALES_ORDER);
                    pstmt.setString(1,"Z");
               	rs = pstmt.executeQuery();
                while(rs.next()){
                    FullCalendar calendar = new FullCalendar();
                    calendar.setId(rs.getInt("SalesOrderId"));
                    calendar.setTitle(rs.getString("clientName") + "'s order");
                    calendar.setStart(rs.getDate("order_date"));
                    calendar.setEnd(rs.getDate("order_date"));
                    orderList.add(calendar);
                    
                }
        	 conn.close();

            } catch (SQLException ex) {
                Logger.getLogger(MySqlDBSalesOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
           return orderList;
    }
    
    
}
