/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Customer;

import com.cripisi.Employee.Employee;
import java.util.ArrayList;

/**
 *
 * @author deathman28
 */
public interface CustomerDAO {
    public Customer getCustomerOrderDetails(Customer one);
    
    public ArrayList<Customer> getFilteredCustomerPerAgent(Employee one);
}
