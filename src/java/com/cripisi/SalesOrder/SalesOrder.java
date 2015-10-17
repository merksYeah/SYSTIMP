/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.SalesOrder;

import java.sql.Date;
/**
 *
 * @author Dea
 */
public class SalesOrder {
    private int order_id;
     private Date date_issued;
    private String deliver_to;
    private Date date_delivered;
    private String comments;
    private String customer_name;
     private int customer_tin;
    private String statusCode;
    
    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
   

    public void setCustomer_tin(int customer_tin) {
        this.customer_tin = customer_tin;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    

    public int getCustomer_tin() {
        return customer_tin;
    }

    public String getStatusCode() {
        return statusCode;
    }

   
    private Date order_date;

    public Date getDate_issued() {
        return date_issued;
    }

    public void setDate_issued(Date date_issued) {
        this.date_issued = date_issued;
    }
   

    public String getStock_status() {
        return stock_status;
    }

    public void setStock_status(String stock_status) {
        this.stock_status = stock_status;
    }
    private String stock_status;

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public String[] getOrderIds() {
        return orderIds;
    }

    public void setOrderIds(String[] orderIds) {
        this.orderIds = orderIds;
    }
    private String[] orderIds;
    private String[] products;
    private String[] quantity;

    public String[] getFulfilledquantity() {
        return fulfilledquantity;
    }

    public void setFulfilledquantity(String[] fulfilledquantity) {
        this.fulfilledquantity = fulfilledquantity;
    }
    private String[] fulfilledquantity;

    public String[] getPrices() {
        return prices;
    }

    public void setPrices(String[] prices) {
        this.prices = prices;
    }
    private String[] prices;

    public String[] getProducts() {
        return products;
    }

    public void setProducts(String[] products) {
        this.products = products;
    }

   
    public String[] getQuantity() {
        return quantity;
    }

    public void setQuantity(String[] quantity) {
        this.quantity = quantity;
    }
 



    public int getClientID() {
        return customer_tin;
    }

    public void setClientID(int clientID) {
        this.customer_tin = clientID;
    }

   

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }


    public String getDeliver_to() {
        return deliver_to;
    }

    public void setDeliver_to(String deliver_to) {
        this.deliver_to = deliver_to;
    }

    public Date getDate_delivered() {
        return date_delivered;
    }

    public void setDate_delivered(Date date_delivered) {
        this.date_delivered = date_delivered;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
    
    
    
}
