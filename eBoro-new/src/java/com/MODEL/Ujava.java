package com.MODEL;

/**
 *
 * @author fatin
 */
public class Ujava {

    private int userid;
    private String fullname;
    private String mykad;
    private String notel;
    private String email;
    private String username;
    private String password;
    private String lastlogin;  

    public Ujava() {
    }

    public Ujava(int userid,String fullname,String mykad,String notel,String email,
            String username,String password) {
        super();
        this.userid = userid;
        this.fullname = fullname;
        this.mykad = mykad;
        this.notel = notel;
        this.email = email;
        this.username = username;
        this.password = password;
        this.userid = userid;
    }
        public Ujava(int userid,String fullname,String mykad,String notel,String email,
            String username,String password,String lastlogin) {
        super();
        this.userid = userid;
        this.fullname = fullname;
        this.mykad = mykad;
        this.notel = notel;
        this.email = email;
        this.username = username;
        this.password = password;
        this.userid = userid;
        this.lastlogin=lastlogin;
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

    public String getMykad() {
        return mykad;
    }

    public void setMykad(String mykad) {
        this.mykad = mykad;
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

    public String getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(String lastlogin) {
        this.lastlogin = lastlogin;
    }

}
