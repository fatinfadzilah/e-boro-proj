/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.MODEL.Ujava;
import java.sql.*;

public class UserControl extends HttpServlet {

    private static String EDIT = "/editUser.jsp";
    private static String List_USER = "/listUser.jsp";
    private static String HOME = "/menuAdmin.jsp";
    private UserDAO dao;

    public UserControl() throws ClassNotFoundException {
        super();
        dao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String forward = "";
            String action = request.getParameter("action");

            if (action.equalsIgnoreCase("delete")) {
                int userID = Integer.parseInt(request.getParameter("userid"));
                dao.deleteUser(userID);
                forward = List_USER;
                request.setAttribute("register", dao.selectAllUser());

            }else if (action.equalsIgnoreCase("listUser")) {
                forward = List_USER;
                request.setAttribute("register", dao.selectAllUser());

            }else if (action.equalsIgnoreCase("home")) {
                forward = HOME;
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
        try {

        } catch (Exception e) {
        }
        RequestDispatcher view = request.getRequestDispatcher(List_USER);
        request.setAttribute("users", dao.selectAllUser());
        view.forward(request, response);
    }

}
