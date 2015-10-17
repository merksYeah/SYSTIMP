/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.barchart;

/**
 *
 * @author deathman28
 */
public class barchart {
    private String customerName;
    private int salesOrderId;

    public int getSalesOrderId() {
        return salesOrderId;
    }

    public void setSalesOrderId(int salesOrderId) {
        this.salesOrderId = salesOrderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getYear() {
        return year;
    }

    public int getValue() {
        return value;
    }

    
    public void setValue(int value) {
        this.value = value;
    }
    String year;

    public void setYear(String year) {
        this.year = year;
    }
    int January;
    int February;
    int March;
    int April;

   
    public void setJanuary(int January) {
        this.January = January;
    }

    public void setFebruary(int February) {
        this.February = February;
    }

    public void setMarch(int March) {
        this.March = March;
    }

    public void setApril(int April) {
        this.April = April;
    }

   

    public int getJanuary() {
        return January;
    }

    public int getFebruary() {
        return February;
    }

    public int getMarch() {
        return March;
    }

    public int getApril() {
        return April;
    }
      String label;
    int value;
  

    
    
}
