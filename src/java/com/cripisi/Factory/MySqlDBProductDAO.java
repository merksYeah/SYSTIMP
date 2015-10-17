/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Factory;

import com.cripisi.Product.Product;
import com.cripisi.Product.ProductDAO;
import com.cripisi.charts.Doughnut;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dea
 */
class MySqlDBProductDAO implements ProductDAO{

    public static final String SQL_ADD_ITEM= "insert into product(productCode,  productName, package, net_weight_per_package, quantity,MSRP) values(?,?,?,?,?,?)";
    public static final String SQL_GET_LIST="Select * from product";
    public static final String SQL_SEARCH_LIST="Select * from product where productName LIKE ? or productCode LIKE ?";
    public static final String SQL_UPDATE_PRODUCT_DETAILS="update product set quantity=?";
    public static final String SQL_GET_SUPPLIER_UPDATELIST = "SELECT productCode,productName \n" +
                                                              "from product\n" +
                                                               "where productCode not in(select productCode from product_has_supplier where supplierTin = ?)";
    private static final String SQL_GET_ORDERPRODUCTS_MONTHLY = "SELECT p.productName, sum(orderquantity) as productQuantity, p.package\n" +
                                                                "from salesorder s join salesorder_has_product sp on s.salesorderid = sp.salesorderid\n" +
                                                                "				   join product p on sp.productCode = p.productCode\n" +
                                                                "where year(date_issued) = year(?) and month(date_issued) = month(?)\n" +
                                                                "group by p.productCode";
    private static final String SQL_GET_MONTHLY_INVENTORY_REPORT = "SELECT d.package,d.productName,d.productCode,sum(orderquantity) as prodIn , prodOut FROM mydb.salesorder_has_product sp \n" +
                                                                    "		 join salesorder s on s.salesorderid = sp.SalesOrderId\n" +
                                                                    "         join product d on d.productCode = sp.productCode\n" +
                                                                    "         join(SELECT d.productCode,sum(orderquantity) as prodOut FROM mydb.product_has_purchaseorder pp\n" +
                                                                    "				join purchaseorder p on p.purchaseOrderId= pp.purchaseOrderId\n" +
                                                                    "                join product d on pp.productCode = d.productCode\n" +
                                                                    "				where MONTH(dateDelivered) = MONTH(NOW())) m on m.productCode = sp.productCode\n" +
                                                                    "          where MONTH(date_delivered) = MONTH(NOW()) \n" +
                                                                    "         group by productCode\n" +
"        ";
     @Override
    public void addItem(Product two) {
    Connection conn = MySqlDbDAOFactory.createConnection();
        try {
            conn.setAutoCommit(false);
            PreparedStatement pstmst = conn.prepareStatement(SQL_ADD_ITEM);
            pstmst.setString(1, two.getProductCode());
            pstmst.setString(2, two.getProductName());
            pstmst.setString(3, two.getPackageType());
            pstmst.setDouble(4, two.getnetweight());
            pstmst.setDouble(5, two.getQuantity());
            pstmst.setDouble(6, two.getMSRP());
            pstmst.executeUpdate();
            conn.commit();
            conn.close();
        } catch (SQLException ex) {
        try {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            conn.rollback();
        } catch (SQLException ex1) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex1);
        }
            
        }  
    }

    @Override
    public ArrayList<Product> getList() {
       ResultSet rs = null;
        ArrayList<Product> searches = new ArrayList<>();
       PreparedStatement pstmst;
       Connection conn = MySqlDbDAOFactory.createConnection();
        try {
            pstmst = conn.prepareStatement(SQL_GET_LIST);
             rs = pstmst.executeQuery();
             while(rs.next())
             {
                 Product two = new Product();
                 two.setProductName(rs.getString("productName"));
                 two.setProductCode(rs.getString("productCode"));
                 //System.out.println(Integer.parseInt(rs.getString("quantity")));
                 two.setQuantity(rs.getInt("quantity"));
                 two.setPackageType(rs.getString("package"));
                 two.setNetWeightPerPackage(rs.getDouble("net_weight_per_package"));
                 two.setMSRP(rs.getDouble("MSRP"));
                 two.setReorderquantity(rs.getInt("reorderquantity"));
                 two.setReorderlevel(rs.getInt("reorderlevel"));
                 searches.add(two);
                 
             }
             
             conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return searches;
    }

    @Override
    public ArrayList<Product> searchList(Product one) {
       ResultSet rs = null;
        ArrayList<Product> searches = new ArrayList<>();
       PreparedStatement pstmst;
        try {
            pstmst = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_SEARCH_LIST);
            pstmst.setString(1, "%" + one.getProductName() + "%");
            pstmst.setString(2, "%" + one.getProductCode() + "%");
             rs = pstmst.executeQuery();
             while(rs.next())
             {
                 Product two = new Product();
                 two.setProductName(rs.getString("productName"));
                 two.setProductCode(rs.getString("productCode"));
                 two.setQuantity(rs.getInt("quantity"));
                 two.setPackageType(rs.getString("package"));
                 two.setNetWeightPerPackage(rs.getDouble("netweightperpackage"));
                 searches.add(two);
                 
             }
             //System.out.println(searches.get(0).getProductName());
             MySqlDbDAOFactory.createConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return searches;
       
    }

    @Override
    public void updateProduct(Product one) {
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement( SQL_UPDATE_PRODUCT_DETAILS);
            pstmt.setInt(1, one.getQuantity());
            pstmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }

    @Override
    public ArrayList<Doughnut> getOrderedProductsMonthly(String year) {
         ResultSet rs = null;
        ArrayList<Doughnut> values = new ArrayList<>();
       PreparedStatement pstmst;
       Connection conn = MySqlDbDAOFactory.createConnection();
        try {
            pstmst = conn.prepareStatement(SQL_GET_ORDERPRODUCTS_MONTHLY);
            pstmst.setString(1, year);
            pstmst.setString(2, year);
             rs = pstmst.executeQuery();
             while(rs.next())
             {
                 Doughnut dough = new Doughnut();
                 dough.setLabel(rs.getString("productName"));
                 dough.setValue(rs.getInt("productQuantity"));
                 values.add(dough);
                 
             }
             //System.out.println(searches.get(0).getProductName());
             conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return values;
    }

    @Override
    public ArrayList<Product> getMonthlyInventoryReport() {
        ResultSet rs = null;
        ArrayList<Product> report = new ArrayList<>();
       PreparedStatement pstmst;
       Connection conn = MySqlDbDAOFactory.createConnection();
        try {
            pstmst = conn.prepareStatement(SQL_GET_MONTHLY_INVENTORY_REPORT);
             rs = pstmst.executeQuery();
             while(rs.next())
             {
                 Product prod = new Product();
                 prod.setProductName(rs.getString("productName"));
                 prod.setQuantity(rs.getInt("prodIn"));
                 prod.setFulfilledQuantity(rs.getInt("prodOut"));
                 prod.setPackageType(rs.getString("package"));
                 report.add(prod);
             }
              conn.close();
             
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDBProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
      
       return report;
    }

    
}
