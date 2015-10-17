/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.HomePage;

/**
 *
 * @author deathman28
 */
public class OrderList {

    public int getDeliveredOrderCount() {
        return deliveredOrderCount;
    }

    public void setDeliveredOrderCount(int deliveredOrderCount) {
        this.deliveredOrderCount = deliveredOrderCount;
    }

    public int getInprocessOrderCount() {
        return inprocessOrderCount;
    }

    public void setInprocessOrderCount(int inprocessOrderCount) {
        this.inprocessOrderCount = inprocessOrderCount;
    }
    private int forReOrderingCount;

    public int getForReOrderingCount() {
        return forReOrderingCount;
    }

    public void setForReOrderingCount(int forReOrderingCount) {
        this.forReOrderingCount = forReOrderingCount;
    }
    private int deliveredOrderCount;
    private int inprocessOrderCount;
    private int canceledOrderCount;

    public int getCanceledOrderCount() {
        return canceledOrderCount;
    }

    public void setCanceledOrderCount(int canceledOrderCount) {
        this.canceledOrderCount = canceledOrderCount;
    }
    
    
}
