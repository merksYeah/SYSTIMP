package com.cripisi.PurchaseOrder;


import com.cripisi.Product.Product;
import java.sql.Date;

public class PurchaseOrder {
	private int POID;

    public void setPOID(int POID) {
        this.POID = POID;
    }

    public int getPOID() {
        return POID;
    }
	private int PurchaseOrderID;

    public void setPurchaseOrderID(int PurchaseOrderID) {
        this.PurchaseOrderID = PurchaseOrderID;
    }
	private String employeeID;

    public Date getDate_issued() {
        return date_issued;
    }

    public void setDate_issued(Date date_issued) {
        this.date_issued = date_issued;
    }

    public Date getDate_delivered() {
        return date_delivered;
    }

    public void setDate_delivered(Date date_delivered) {
        this.date_delivered = date_delivered;
    }
        private Date date_delivered;
        private Date date_issued;
	private Date order_date;
	private int supplierID;
	private String status;
        private Product product;
	private String comments;

    public String[] getProducts() {
        return products;
    }

    public String[] getQuantity() {
        return quantity;
    }

    public void setProducts(String[] products) {
        this.products = products;
    }

    public void setQuantity(String[] quantity) {
        this.quantity = quantity;
    }
        private String[] products;
	 private String[] quantity;
	public int getPurchaseOrderID() {
		return PurchaseOrderID;
	}
	
	public String getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	 public Product getProduct() {
            return product;
        }

        public void setProduct(Product p) {
            this.product=p;
        }
        
        public void setComments(String c){
            this.comments= c;
        }
        
        public String getComments(){
            return comments;
        }

   
}
