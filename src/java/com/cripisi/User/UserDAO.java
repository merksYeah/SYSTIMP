/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.User;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author deathman28
 */
public interface UserDAO {
    public ArrayList<User> getAllUsers();

    public HashMap<String,Integer> login(User user1);

   public void enableUser(String[] users);

    public void disableUser(User user1);

    public void changePassword(User user1);

    public void insertUser(User user1);

    public User getUserById(User user1);
    


}
