/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import java.sql.*;
import java.util.*;

import com.MODEL.Reservation;

public class ReservationDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/e-boro";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String SELECT_RESERV_BY_RESID
            = "SELECT * from reservation where resID = ?";

    private static final String SELECT_ALL_RESERV
            = "SELECT * from reservation";

    private static final String SELECT_RESERV_BY_EMAIL
            = "SELECT * from reservation  where email = ?";

    private static final String UPDATE_RESID_SQL
            = "update reservation set userid =?,fullname =?,notel =?,email =?,facilities =?,equipment =?, date =?,status =?,reason =? where resID = ?;";

    private static final String DELETE_RESID_SQL
            = "delete from reservation where resID =?;";

    private static final String INSERT_RESERV_SQL
            = "INSERT INTO reservation (userid, fullname,notel, email, facilities, equipment, date, status, reason) values (?,?,?,?,?,?,?,?,?);";

    public ReservationDAO() {
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

    public void insertReserv(Reservation reserv) {
        System.out.println(INSERT_RESERV_SQL);

        try (Connection connction = getConnection();
                PreparedStatement ps = connction.prepareStatement(INSERT_RESERV_SQL);) {
            ps.setInt(1, reserv.getUserid());
            ps.setString(2, reserv.getFullname());
            ps.setString(3, reserv.getNotel());
            ps.setString(4, reserv.getEmail());
            ps.setString(5, reserv.getFacilities());
            ps.setString(6, reserv.getEquipment());
            ps.setString(7, reserv.getDate());
            ps.setString(8, reserv.getStatus());
            ps.setString(9, reserv.getReason());
            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public List<Reservation> selectAllReserv() {

        List<Reservation> reserv = new ArrayList<>();

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_ALL_RESERV);) {
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int resID = rs.getInt("resID");
                int userid = rs.getInt("userid");
                String fullname = rs.getString("fullname");
                String notel = rs.getString("notel");
                String email = rs.getString("email");
                String facilities = rs.getString("facilities");
                String equipment = rs.getString("equipment");
                String date = rs.getString("date");
                String status = rs.getString("status");
                String reason = rs.getString("reason");

                reserv.add(new Reservation(resID, userid, fullname, notel, email, facilities, equipment, date, status, reason));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return reserv;
    }
    public List<Reservation> selectAllReservByEmail(String email) {

        List<Reservation> reserv = new ArrayList<>();

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_RESERV_BY_EMAIL);) {
            ps.setString(1, email);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int resID = rs.getInt("resID");
                int userid = rs.getInt("userid");
                String fullname = rs.getString("fullname");
                String notel = rs.getString("notel");
                String facilities = rs.getString("facilities");
                String equipment = rs.getString("equipment");
                String date = rs.getString("date");
                String status = rs.getString("status");
                String reason = rs.getString("reason");
                
                reserv.add(new Reservation(resID, userid, fullname, notel, email, facilities, equipment, date,  status, reason));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return reserv;
    }

    public Reservation selectReserv(int resID) {
        Reservation reserv = null;

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_RESERV_BY_RESID);) {

            ps.setInt(1, resID);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int userID = rs.getInt("userid");
                String fullname = rs.getString("fullname");
                String notel = rs.getString("notel");
                String email = rs.getString("email");
                String facilities = rs.getString("facilities");
                String equipment = rs.getString("equipment");
                String date = rs.getString("date");
                String status = rs.getString("status");
                String reason = rs.getString("reason");

                reserv = new Reservation(resID, userID, fullname, notel, email, facilities, equipment, date, status, reason);

            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return reserv;
    }

    public boolean deleteReserv(int resID) throws SQLException {
        boolean rowDelete;

        try (Connection connction = getConnection();
                PreparedStatement ps = connction.prepareStatement(DELETE_RESID_SQL);) {
            ps.setInt(1, resID);
            rowDelete = ps.executeUpdate() > 0;

        }
        return rowDelete;
    }

    public boolean updateReserv(Reservation reserv) throws SQLException {
        boolean rowUpdate;
        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(UPDATE_RESID_SQL);) {

            ps.setInt(1, reserv.getUserid());
            ps.setString(2, reserv.getFullname());
            ps.setString(3, reserv.getNotel());
            ps.setString(4, reserv.getEmail());
            ps.setString(5, reserv.getFacilities());
            ps.setString(6, reserv.getEquipment());
            ps.setString(7, reserv.getDate());
            ps.setString(8, reserv.getStatus());
            ps.setString(9, reserv.getReason());
            ps.setInt(10, reserv.getResID());

            rowUpdate = ps.executeUpdate() > 0;

        }
        return rowUpdate;
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
