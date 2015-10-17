/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.Factory;

import com.cripisi.User.User;
import com.cripisi.User.UserDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author deathman28
 */
public class MySqlDbUserDAO implements UserDAO {

    private static final String SQL_GET_ALL_USERS  = "select * from user";
    private static final String SQL_UPDATE_ENABLE_USER  = "update user set flag = 1 where userID = ?";
    private static final String SQL_UPDATE_DISABLE_USER  = "update user set flag = 0 where userID = ?";
    private static final String SQL_CHANGE_PASSWORD_USER = "update user set password = ? where userID = ?";
    private static final String SQL_CREATE_NEW_USER = "insert into user(username,password) values (?,?)";
    private static final String SQL_GET_RIGHTS = "select u.userId, a.action, a.flag, a.roleId\n"+
                                                 "from user u join user_has_group ug on u.userId = ug.userId\n"+
                                                    "join role r on r.groupId = ug.groupId\n"+
                                                    "join action a on a.roleId = r.roleId\n"+
                                                    "where username = ? and password = password(?) and u.flag = ?";
  
    
    /** Get a list of user accounts for system administrators 
     */
    @Override
    public ArrayList<User> getAllUsers(){
         ResultSet rs = null;
        ArrayList<User> userList = new ArrayList<>();
        try {   
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_GET_ALL_USERS);
            rs = pstmt.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFlag(rs.getInt("flag"));
                userList.add(user);
            }
            
           
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
         return userList;
    }
    
    /**
     * 
     *Authenticate a user account in the database via the username and password sent from the browser 
     * 
     */
     
    @Override
    public HashMap<String,Integer> login(User user1){
        boolean valid = false; 
        HashMap<String,Integer> rights = new HashMap<>();
        Connection conn = MySqlDbDAOFactory.createConnection();
         PreparedStatement pstmt;
         try {   
            pstmt = conn.prepareStatement(SQL_GET_RIGHTS);
            pstmt.setString(1, user1.getUsername());
            pstmt.setString(2, user1.getPassword());
            pstmt.setInt(3, 1);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){  
                 if(!valid){
                 rights.put("userId", rs.getInt("userId"));
                 rights.put("role", rs.getInt("roleId"));
                 valid = true;
                 }
                
                 rights.put(rs.getString("action"), rs.getInt("flag"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        if(valid){
              return rights;
         }
         else
         {
             return null;
         }
    }

    /**
     * 
     * Enables a deactivated user account setting the flag column to 1 in the user table via the userID
     */    
    @Override
    public void enableUser(String[] users){
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_UPDATE_ENABLE_USER);
            for (int i=0; i<users.length; i++){
                    pstmt.setInt(1, Integer.parseInt(users[i]));
                    pstmt.addBatch();
            }
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }
    
    /**
     * 
     *Disables an active user account setting the flag column to 0 in the user table via the userID
     * 
     */    
    @Override
    public void disableUser(User user1){
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_UPDATE_DISABLE_USER);
            pstmt.setInt(1, user1.getUserId());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }
    
    /**
     * 
     *Changes password of an active user account setting the password column to a desired password in the user table via the userID
     * 
     */   
    @Override
    public void changePassword(User user1){
         try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(SQL_CHANGE_PASSWORD_USER);
            pstmt.setString(1, user1.getPassword());
            pstmt.setInt(2, user1.getUserId());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    } 
    
    /**
     * 
     *Creates a new user account in the user table
     * 
     */   
    @Override
    public void insertUser(User user1){
        try {
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement( SQL_CREATE_NEW_USER );
            pstmt.setString(1, user1.getUsername());
            pstmt.setString(2, user1.getPassword());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }

    /**
     * 
     *Searches for a user account via its unique ID
     * 
     */  
    @Override
    public User getUserById(User user1){
         ResultSet rs = null;
        ArrayList<User> searches = new ArrayList<>();
        try {   
             String query = "select * from users where username = ? and password = ?";
            PreparedStatement pstmt = MySqlDbDAOFactory.createConnection().prepareStatement(query);
            pstmt.setString(1, user1.getUsername());
            pstmt.setString(2, user1.getPassword());
            rs = pstmt.executeQuery();
            while(rs.next()){
                User two = new User();
                two.setUserId(rs.getInt("userId"));
                searches.add(two);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
             try {
                 MySqlDbDAOFactory.createConnection().close();
             } catch (SQLException ex) {
                 Logger.getLogger(MySqlDbUserDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
        
    }
         return searches.get(0);
    }
    
    
    
}
