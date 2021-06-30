package com.util;

/**
 *
 * @author fatin
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection myConnection = null;
    private static String myURL = "jdbc:mysql://localhost:3306/e-boro";

    DBConnection() {

    }

    public static Connection getConnection() throws ClassNotFoundException {
        if (myConnection != null) {
            return myConnection;
        } else
            try {
            //Establish and open MySQL database Connection...
            Class.forName("com.mysql.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "admin");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return myConnection;
    }

    public void closeConnection() throws ClassNotFoundException {
        try {
            myConnection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
