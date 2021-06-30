/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import java.sql.*;
import java.util.*;

import com.MODEL.Staff;

public class StaffDAO {
    
    private String jdbcURL = "jdbc:mysql://localhost:3306/e-boro";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_STAFF_SQL
            = "INSERT INTO staff (username,password,name) values (?,?,?)";

    private static final String SELECT_STAFF_BY_ID
            = "SELECT staffID,username,password,name,lastlog from staff where staffID = ?";

    private static final String SELECT_ALL_STAFF
            = "SELECT * from staff";

    private static final String DELETE_STAFF_SQL
            = "delete from staff where staffID =?;";

    private static final String UPDATE_STAFF_SQL
            = "update item set password = ?,name = ? where staffID = ?;";

    
    
}
