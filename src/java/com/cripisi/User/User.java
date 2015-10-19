/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cripisi.User;

import com.cripisi.Group.Group;
import java.util.ArrayList;

/**
 *
 * @author deathman28
 */
public class User{
        
        private int userId;
	private String username;
	private String password;
        private int flag;
        private ArrayList<Group> groups;

	public User() {
	}
           
        public void setGroups(ArrayList<Group> groups) {
            this.groups = groups;
        }
	

         public ArrayList<Group> getGroups() {
        return groups;
         }
	
         public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String email) {
		this.password = email;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

    
}
