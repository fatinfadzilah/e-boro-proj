package com.MODEL;

public class Item {

    private int itemID;
    private String itemName;
    private String description;
    private String dateSup;
    private int quantity;
    private int balance;

    public Item() {
    }

    //untuk insert data dalam database
    public Item(String itemName, String description, String dateSup, int quantity, int balance) {
        super();
        this.itemName = itemName;
        this.description = description;
        this.dateSup = dateSup;
        this.quantity = quantity;
        this.balance = balance;
    }

    //untuk update item dalam database
    public Item(int itemID, String itemName, String description, String dateSup, int quantity, int balance) {
        super();
        this.itemID = itemID;
        this.itemName = itemName;
        this.description = description;
        this.dateSup = dateSup;
        this.quantity = quantity;
        this.balance = balance;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateSup() {
        return dateSup;
    }

    public void setDateSup(String dateSup) {
        this.dateSup = dateSup;
    }

 

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

}
