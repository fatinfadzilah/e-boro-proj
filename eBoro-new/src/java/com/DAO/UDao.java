package com.DAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author fatin
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import com.MODEL.Ujava;
import com.util.DBConnection;

public class UDao {

    private Connection connection;

    public UDao() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    //adduser
    public void addUser(Ujava user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into register(fullname,mykad,notel,email,username,password)values(?,?,?,?,?,?)");
            //parameters start with 1
            preparedStatement.setString(1, user.getFullname());
            preparedStatement.setString(2, user.getMykad());
            preparedStatement.setString(3, user.getNotel());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //deleteUser
    public void deleteUser(int userid) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from register where userid=?");
            //parameters Start with 1
            preparedStatement.setInt(1, userid);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //updateUser
    public void updateUser(Ujava user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update register set fullname=?, mykad=?, notel=?, email=? , username=? ,password=? "
                            + " where userid=?");
            //parameter start with 1
            preparedStatement.setString(1, user.getFullname());
            preparedStatement.setString(2, user.getMykad());
            preparedStatement.setString(3, user.getNotel());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.setString(6, user.getPassword());
             preparedStatement.setInt(7, user.getUserid());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //getalluser
    public List<Ujava> getAllUsers() {
        List<Ujava> users = new ArrayList<Ujava>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("Select*from register");
            while (rs.next()) {
                Ujava user = new Ujava();
                user.setUserid(rs.getInt("userid"));
                user.setFullname(rs.getString("fullname"));
                user.setMykad(rs.getString("mykad"));
                user.setNotel(rs.getString("notel"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public Ujava getUserByUsername(String username) {
        Ujava user = new Ujava();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "select* from register where username=?");
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setFullname(rs.getString("fullname"));
                user.setMykad(rs.getString("mykad"));
                user.setNotel(rs.getString("notel"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
