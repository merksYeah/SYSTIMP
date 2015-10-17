/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.SalesOrder;

import com.cripisi.HomePage.OrderList;
import com.cripisi.Customer.Customer;
import com.cripisi.Employee.Employee;
import com.cripisi.Product.Product;
import com.cripisi.barchart.barchart;
import com.cripisi.calendar.FullCalendar;
import java.util.ArrayList;
import java.util.HashMap;
/**
 *
 * @author Dea
 */
public interface SalesOrderDAO {
    
    public ArrayList<Product> getOrderedProducts(SalesOrder so);
    
    public int newSalesOrder(SalesOrder so);
    
    public void addProducts(SalesOrder so);
    
    public ArrayList<SalesOrder> getAllSalesOrder();
    
    public void updateSalesOrder(SalesOrder so);
    
    public ArrayList<SalesOrder> getSalesOrdersByCustomer(Customer one,SalesOrder so);
    
    public ArrayList<SalesOrder> getSalesOrdersBySalesAgent(Employee one, Customer cs, SalesOrder so);
    
    public ArrayList<Product> getOrderDetailsByOrder(SalesOrder so);
    
    public HashMap<String,Double> getProductSalesPerMonth(String Month, int year);
    
    public ArrayList<SalesOrder> getOrders(SalesOrder so);
     
    public ArrayList<Product> getInProcessOrderDetails(SalesOrder so);
     
    public void addProductDelivered(SalesOrder so);
      
    public void updateProductPriceModel(SalesOrder so);
    
    public ArrayList<Product> getPriceModel(SalesOrder so);
    
    public void updateSalesOrderDeliveryDate(SalesOrder so);
    
    public void updateSalesOrderComments(SalesOrder so);
    
    public ArrayList<SalesOrder> getNonDeliveredOrders(SalesOrder so, Customer cust);
      public ArrayList<SalesOrder> getNonDeliveredOrdersSalesAgent(SalesOrder so, Employee emp);
    
     public ArrayList<SalesOrder> getDeliveredOrders(SalesOrder so, Customer cust);
     
     public OrderList getOrderList(Customer cust);
     
     public OrderList getOrderListSalesAgent(Employee emp);
     
     public boolean checkSufficiency(SalesOrder so);
     
     public ArrayList<barchart> getMonthlyRevenue(Employee emp);
     public ArrayList<barchart> getMonthlyRevenueBreakdown(Employee emp);
     public ArrayList<FullCalendar> getSalesAgentCalendar(Employee emp);
     public ArrayList<FullCalendar> getCustomerCalendar(Customer cust);
     public ArrayList<FullCalendar> getPlantManagerCalendar();
}