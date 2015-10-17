package com.cripisi.PurchaseOrder;

import com.cripisi.Employee.Employee;
import java.util.ArrayList;

public interface PurchaseOrderDAO {
	
	public ArrayList<PurchaseOrder> getAllPurchaseOrder();
        
        public void addProducts(PurchaseOrder p);
	
	public int addPurchaseOrder(PurchaseOrder p);
	
	public void deletePurchaseOrder(PurchaseOrder p);
	
	public void updatePurchaseOrderStatus(PurchaseOrder p);
        
        public ArrayList<PurchaseOrder> getPurchaseOrderForUpdating();
        
	

}
