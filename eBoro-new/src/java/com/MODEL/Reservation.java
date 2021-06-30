/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MODEL;

/**
 *
 * @author User
 */
public class Reservation {

    private int resID;
    private int userid;
    private String fullname;
    private String notel;
    private String email;
    private String facilities;
    private String equipment;
    private String date;
    private String status;
    private String reason;

    public Reservation() {
    }

    public Reservation(int resID, int userid, String fullname, String notel,
            String email,String facilities, String equipment, String date, String status, String reason) {
        super();
        this.resID      = resID;
        this.userid     = userid;
        this.fullname   = fullname;
        this.notel      = notel;
        this.email      = email;
        this.facilities  = facilities;
        this.equipment  = equipment;
        this.date       = date;
        this.status     = status;
         this.reason     = reason;

    }

    public int getResID() {
        return resID;
    }

    public void setResID(int resID) {
        this.resID = resID;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNotel() {
        return notel;
    }

    public void setNotel(String notel) {
        this.notel = notel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    

  
    
}
