package com.DAO;

import java.sql.*;
import java.util.*;

import com.MODEL.Item;

public class ItemDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/e-boro";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_ITEM_SQL
            = "INSERT INTO item (itemName,description,dateSup,quantity, balance) values (?,?,?,?,?)";

    private static final String SELECT_ITEM_BY_ID
            = "SELECT itemID,itemName,description,dateSup,quantity, balance from item where itemID = ?";

    private static final String SELECT_ALL_ITEM
            = "SELECT * from item";

    private static final String DELETE_ITEM_SQL
            = "delete from item where itemID =?;";

    private static final String UPDATE_ITEM_SQL
            = "update item set itemName= ?,description= ?,dateSup= ?,quantity= ?,balance= ? where itemID = ?;";

    public ItemDAO() {
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

    public Item selectItem(int itemID) {
        Item item = null;

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_ITEM_BY_ID);) {

            ps.setInt(1, itemID);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String itemName = rs.getString("itemName");
                String description = rs.getString("description");
                String dateSup = rs.getString("dateSup");
                int quantity = rs.getInt("quantity");
                int balance = rs.getInt("balance");
                item = new Item(itemID, itemName, description, dateSup, quantity, balance);

            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return item;
    }

    public List<Item> selectAllItem() {

        List<Item> items = new ArrayList<>();

        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(SELECT_ALL_ITEM);) {
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int itemID = rs.getInt("itemID");
                String itemName = rs.getString("itemName");
                String description = rs.getString("description");
                String dateSup = rs.getString("dateSup");
                int quantity = rs.getInt("quantity");
                int balance = rs.getInt("balance");
                items.add(new Item(itemID, itemName, description, dateSup, quantity, balance));

            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return items;
    }

    public boolean deleteItem(int itemID) throws SQLException {
        boolean rowDelete;

        try (Connection connction = getConnection();
                PreparedStatement ps = connction.prepareStatement(DELETE_ITEM_SQL);) {
            ps.setInt(1, itemID);
            rowDelete = ps.executeUpdate() > 0;

        }
        return rowDelete;
    }

    public boolean updateItem(Item item) throws SQLException {
        boolean rowUpdate;
        try (Connection connection = getConnection();
                PreparedStatement ps = connection.prepareStatement(UPDATE_ITEM_SQL);) {
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getDescription());
            ps.setString(3, item.getDateSup());
            ps.setInt(4, item.getQuantity());
            ps.setInt(5, item.getBalance());
            ps.setInt(6, item.getItemID());

            rowUpdate = ps.executeUpdate() > 0;

        }
        return rowUpdate;
    }

    public void insertItem(Item item) {
        System.out.println(INSERT_ITEM_SQL);

        try (Connection connction = getConnection();
                PreparedStatement ps = connction.prepareStatement(INSERT_ITEM_SQL);) {
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getDescription());
            ps.setString(3, item.getDateSup());
            ps.setInt(4, item.getQuantity());
            ps.setInt(5, item.getBalance());
            System.out.println(ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
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
