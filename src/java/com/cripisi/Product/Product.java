/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Product;

/**
 *
 * @author deathman28
 */
public class Product {
    private String productCode;
    private String supplierID;
    private String productName;
    private String packageType;
    private int quantity;

    public int getReorderlevel() {
        return reorderlevel;
    }

    public void setReorderlevel(int reorderlevel) {
        this.reorderlevel = reorderlevel;
    }

    public int getReorderquantity() {
        return reorderquantity;
    }

    public void setReorderquantity(int reorderquantity) {
        this.reorderquantity = reorderquantity;
    }
    private int reorderlevel;
    private int reorderquantity;

    public int getFulfilledQuantity() {
        return fulfilledQuantity;
    }

    public void setFulfilledQuantity(int fulfilledQuantity) {
        this.fulfilledQuantity = fulfilledQuantity;
    }
    private int fulfilledQuantity;

    public Double getNetweight() {
        return netweight;
    }

    public Double getMSRP() {
        return MSRP;
    }

    public void setNetweight(Double netweight) {
        this.netweight = netweight;
    }

    public void setMSRP(Double MSRP) {
        this.MSRP = MSRP;
    }
    private Double MSRP,netweight;
    
    /*private int productCode;
      private String productName;
      private String productcol;
    */
    public void setProductCode(String newProductCode)
    {
        productCode = newProductCode;
    }
    
    public void setSupplierID(String newSupplierID)
    {
        supplierID = newSupplierID;
    }
    
    public void setProductName(String newProductName)
    {
        productName = newProductName;
    }
    
    public void setQuantity(int newQuantity)
    {
        quantity = newQuantity;
    }
    
    public void setPackageType(String newPackageType)
    {
        packageType = newPackageType;
    }
    
    public void setNetWeightPerPackage(Double newNetWeightPerPackage)
    {
        netweight = newNetWeightPerPackage;
    }
    
    public String getProductCode()
    {
        return productCode;
    }
    
    public String getSupplierID()
    {
        return supplierID;
    }
    
    public String getPackageType()
    {
        return packageType;
    }
    
    public String getProductName()
    {
        return productName;
    }
    
    public Double getnetweight()
    {
        return netweight;
    }
    
    public int getQuantity()
    {
        return quantity;
    }
}

