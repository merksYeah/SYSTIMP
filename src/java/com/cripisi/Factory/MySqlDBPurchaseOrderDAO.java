package com.cripisi.Factory;

import com.cripisi.Employee.Employee;
import com.cripisi.Product.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;

import com.cripisi.PurchaseOrder.PurchaseOrder;
import com.cripisi.PurchaseOrder.PurchaseOrderDAO;
import java.sql.Connection;
import java.util.logging.Logger;

public class MySqlDBPurchaseOrderDAO implements PurchaseOrderDAO {
	
	 private static final String SQL_GET_ALL_PURCHASE_ORDER = "select * from PurchaseOrder p join orderstatus o on p.orderStatus = o.statusCode";
         private static final String SQL_GET_PO_FORUPDATING = "select * from PurchaseOrder p join orderstatus o on p.orderStatus = o.statusCode where statusCode = 'P' or statusCode = 'I'";
	 private static final String SQL_ADD_PRODUCTS_TO_PURCHASE_ORDER="insert into product_has_purchaseorder (productCode, purchaseOrderId, orderQuantity) values(?,?,?)";
          private static final String SQL_GET_PRODUCT_SUPPLIERS="select s.supplierTin, s.supplierName from supplier s join product_has_supplier ps on s.supplierTin=ps.supplierTin where ps.productcode = ?";
	 private static final String SQL_ADD_PURCHASE_ORDER = "insert INTO PurchaseOrder(employeeID, orderDate, orderStatus) values (?,?,?) ";
	 private static final String SQL_DELETE_PURCHASE_ORDER = "delete from PurchaseOrder where PurchaseOrderID = ?";
	 private static final String SQL_UPDATE_PURCHASE_ORDER_STATUS="update PurchaseOrder set orderStatus=? where PurchaseOrderID = ?";

	@Override
	public ArrayList<PurchaseOrder> getAllPurchaseOrder() {
		ResultSet rs = null;
		ArrayList<PurchaseOrder> purchaseOrderList = new ArrayList<>();
                Connection conn = MySqlDbDAOFactory.createConnection();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL_GET_ALL_PURCHASE_ORDER);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PurchaseOrder po = new PurchaseOrder();
				po.setPOID(rs.getInt("PurchaseOrderID"));
				po.setDate_issued(rs.getDate("dateIssued"));
				po.setOrder_date(rs.getDate("orderDate"));
				po.setDate_delivered(rs.getDate("dateDelivered"));
				po.setStatus(rs.getString("statusDesc"));
				purchaseOrderList.add(po);
			} 
                        conn.close();
		} catch(SQLException ex){
			Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
		} finally{
			try{
				MySqlDbDAOFactory.createConnection().close();
			} catch(SQLException ex){
				Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
			}
		}
		return purchaseOrderList;
	}

	@Override
	public int addPurchaseOrder(PurchaseOrder p) {
		ResultSet rs = null;
        boolean value = false;
        int key = 0;
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {
                conn.setAutoCommit(false);
                PreparedStatement pstmt = conn.prepareStatement(SQL_ADD_PURCHASE_ORDER,PreparedStatement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, p.getEmployeeID());
                pstmt.setDate(2, p.getOrder_date());
                pstmt.setString(3, p.getStatus());
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
	public void updatePurchaseOrderStatus(PurchaseOrder p) {
	Connection conn = MySqlDbDAOFactory.createConnection();	
            try{
                         conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE_PURCHASE_ORDER_STATUS);
			pstmt.setString(1, p.getStatus());
                        pstmt.setInt(2, p.getPurchaseOrderID());
			pstmt.executeUpdate();
                        conn.commit();
                        conn.close();
		} catch(SQLException ex){
			Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
		} 
		
		
	}

	@Override
	public void deletePurchaseOrder(PurchaseOrder p) {
		
		try{
			PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_DELETE_PURCHASE_ORDER);
			pstmt.setInt(1, p.getPurchaseOrderID());
			pstmt.executeQuery();
		} catch(SQLException ex){
			Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
		} finally{
			try{
				MySqlDbDAOFactory.createConnection().close();
			}	catch(SQLException ex){
				Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
			}
		}
	}
        
        @Override
        public void addProducts(PurchaseOrder p){
            String[] product = p.getProducts();
        String[] quantity = p.getQuantity();
        Connection conn = MySqlDbDAOFactory.createConnection();
        try {            
             PreparedStatement pstmt = conn.prepareStatement(SQL_ADD_PRODUCTS_TO_PURCHASE_ORDER);
               conn.setAutoCommit(false);
                for (int i=0; i<product.length; i++){
                    pstmt.setString(1, product[i]);
                    pstmt.setInt(2, p.getPurchaseOrderID());
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
    public ArrayList<PurchaseOrder> getPurchaseOrderForUpdating() {
        ResultSet rs = null;
		ArrayList<PurchaseOrder> purchaseOrderList = new ArrayList<>();
		try{
			PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_GET_PO_FORUPDATING);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PurchaseOrder po = new PurchaseOrder();
				po.setPOID(rs.getInt("PurchaseOrderID"));
				po.setDate_issued(rs.getDate("dateIssued"));
				po.setOrder_date(rs.getDate("orderDate"));
				po.setDate_delivered(rs.getDate("dateDelivered"));
				po.setStatus(rs.getString("statusDesc"));
				purchaseOrderList.add(po);
			} 
		} catch(SQLException ex){
			Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
		} finally{
			try{
				MySqlDbDAOFactory.createConnection().close();
			} catch(SQLException ex){
				Logger.getLogger(MySqlDBPurchaseOrderDAO.class.getName(), null).log(Level.SEVERE, null, ex);
			}
		}
		return purchaseOrderList;
    }
	

}
