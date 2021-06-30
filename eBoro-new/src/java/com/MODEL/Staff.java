/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MODEL;

public class Staff {

    int staffID;
    String username;
    String password;
    String name;
    String lastlog;

    public Staff() {
    }

    public Staff(String username, String password, String name, String lastlog) {
        super();
        this.username = username;
        this.password = password;
        this.name = name;
        this.lastlog = lastlog;
    }

    public Staff(int staffID, String username, String password, String name, String lastlog) {
        super();
        this.staffID = staffID;
        this.username = username;
        this.password = password;
        this.name = name;
        this.lastlog = lastlog;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
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

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastlog() {
        return lastlog;
    }

    public void setLastlog(String lastlog) {
        this.lastlog = lastlog;
    }

}
