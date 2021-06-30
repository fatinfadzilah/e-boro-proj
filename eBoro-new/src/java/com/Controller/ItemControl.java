package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ItemDAO;
import com.MODEL.Item;
import java.sql.SQLException;

public class ItemControl extends HttpServlet {

    private static String INSERT = "/item.jsp";
    private static String EDIT = "/editItem.jsp";
    private static String LIST_ITEM = "/listItem.jsp";
    private ItemDAO dao;

    public ItemControl() throws ClassNotFoundException {
        super();
        dao = new ItemDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String forward = "";
            String action = request.getParameter("action");

            if (action.equalsIgnoreCase("delete")) {
                int itemID = Integer.parseInt(request.getParameter("itemID"));
                dao.deleteItem(itemID);
                forward = LIST_ITEM;
                request.setAttribute("items", dao.selectAllItem());

            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                int itemID = Integer.parseInt(request.getParameter("itemID"));
                Item item = dao.selectItem(itemID);
                request.setAttribute("item", item);

            } else if (action.equalsIgnoreCase("listItem")) {
                forward = LIST_ITEM;
                request.setAttribute("items", dao.selectAllItem());

            } else if (action.equalsIgnoreCase("insert")) {
                forward = INSERT;
            }
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        Item item = new Item();
        
        
        item.setItemName(request.getParameter("itemName"));
        item.setDescription(request.getParameter("description"));
        item.setDateSup(request.getParameter("dateSup"));
        item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        item.setBalance(Integer.parseInt(request.getParameter("balance")));
        
        try {

            if (action.equalsIgnoreCase("edit")) {
                item.setItemID(Integer.parseInt(request.getParameter("itemID")));
                dao.updateItem(item);
            } else {
                dao.insertItem(item);
            }
        } catch (Exception e) {
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_ITEM);
        request.setAttribute("items", dao.selectAllItem());
        view.forward(request, response);
    }

}
