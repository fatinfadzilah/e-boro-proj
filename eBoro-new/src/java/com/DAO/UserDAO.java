/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import java.sql.*;
import java.util.*;

import com.MODEL.Ujava;

public class UserDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/e-boro";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String SELECT_ALL_USERS
            = "SELECT * from register";

    private static final String DELETE_USER_SQL
            = "delete from register where userid =?;";

    private static final String UPDATE_USER_SQL
            = "update item set itemName= ?,description= ? where itemID = ?;";

    public UserDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return connection;
    }

    public List<Ujava> selectAllUser() {

        List<Ujava> users = new ArrayList<>();

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USERS);) {

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int userid= rs.getInt("userid");
                String fullname= rs.getString("fullname");
                String mykad= rs.getString("mykad");
                String notel= rs.getString("notel");
                String email= rs.getString("email");
                String username= rs.getString("username");
                String password= rs.getString("password");
                String lastlogin= rs.getString("lastlogin");

                users.add(new Ujava(userid, fullname, mykad, notel, email, username, password, lastlogin));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;

    }

    public boolean deleteUser(int userID) throws SQLException {
        boolean rowDelete;

        try (Connection connction = getConnection();
                PreparedStatement ps = connction.prepareStatement(DELETE_USER_SQL);) {
            ps.setInt(1, userID);
            rowDelete = ps.executeUpdate() > 0;
        }
        return rowDelete;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
