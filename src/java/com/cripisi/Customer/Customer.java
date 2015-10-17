/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Customer;

/**
 *
 * @author deathman28
 */
public class Customer {

    public int getCustomerTin() {
        return customerTin;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public int getUserId() {
        return userId;
    }

    public String getEmail() {
        return email;
    }

    public String getClientName() {
        return clientName;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public String getContactNum() {
        return contactNum;
    }

    public void setCustomerTin(int customerTin) {
        this.customerTin = customerTin;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public void setContactNum(String contactNum) {
        this.contactNum = contactNum;
    }
    public int customerTin;
    public String employeeId;
    public int userId;
    public String email;
    public String clientName;
    public String companyAddress;
    public String contactNum;
}
