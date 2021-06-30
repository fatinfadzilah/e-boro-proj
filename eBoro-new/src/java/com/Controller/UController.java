/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.sql.SQLException;
import com.DAO.*;
import com.MODEL.Reservation;
import com.MODEL.Ujava;

@WebServlet(name = "UController", urlPatterns = {"/UController"})
public class UController extends HttpServlet {

    private static String INSERT = "/register.jsp";
    private static String EDIT = "/personalInfo.jsp";
    private static String LIST_USER = "/listUser_1.jsp";
    private static String FORM_EQUIP = "/formequipment.jsp";
    private static String FORM_EDIT_RESERV_USER = "/formEditEquipUser.jsp";
    private UDao dao;
    private final ReservationDAO rDAO;

    private String username;

    public UController() throws ClassNotFoundException {
        super();
        dao = new UDao();
        rDAO = new ReservationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String forward = "";
            String action = request.getParameter("action");

            if (action.equalsIgnoreCase("delete")) {
                int resID = Integer.parseInt(request.getParameter("resID"));
                String username = request.getParameter("username");
                rDAO.deleteReserv(resID);
                Ujava user = dao.getUserByUsername(username);
                String email = user.getEmail();
                request.setAttribute("user", user);
                request.setAttribute("reserv", rDAO.selectAllReservByEmail(email));
                forward = FORM_EQUIP;

            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                String username = request.getParameter("username");
                Ujava user = dao.getUserByUsername(username);
                request.setAttribute("user", user);

            } else if (action.equalsIgnoreCase("reservEqui")) {
                forward = FORM_EDIT_RESERV_USER;
                int resID = Integer.parseInt(request.getParameter("resID"));
                Reservation reserv = rDAO.selectReserv(resID);
                request.setAttribute("reserv", reserv);

            } else if (action.equalsIgnoreCase("insertEqui")) {

                forward = FORM_EQUIP;
                this.username = request.getParameter("username");
                Ujava user = dao.getUserByUsername(username);
                String email = user.getEmail();

                request.setAttribute("user", user);
                request.setAttribute("reserv", rDAO.selectAllReservByEmail(email));

            } else if (action.equalsIgnoreCase("listUser")) {
                forward = LIST_USER;
                request.setAttribute("register", dao.getAllUsers());

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
        try {

            if (action.equalsIgnoreCase("edit")) {
                Ujava user = new Ujava();
                user.setUserid(Integer.parseInt(request.getParameter("userid")));
                user.setFullname(request.getParameter("fullname"));
                user.setMykad(request.getParameter("mykad"));
                user.setNotel(request.getParameter("notel"));
                user.setEmail(request.getParameter("email"));
                user.setUsername(request.getParameter("username"));
                user.setPassword(request.getParameter("password"));
                dao.updateUser(user);

                RequestDispatcher view = request.getRequestDispatcher(EDIT);
                request.setAttribute("user", dao.getUserByUsername(user.getUsername()));
                view.forward(request, response);

            } else if (action.equalsIgnoreCase("insertReserv")) {

                Reservation reserv = new Reservation();
                reserv.setUserid(Integer.parseInt(request.getParameter("userid")));
                reserv.setFullname(request.getParameter("fullname"));
                reserv.setNotel(request.getParameter("notel"));
                reserv.setEmail(request.getParameter("email"));
                reserv.setFacilities(request.getParameter("facilities"));
                reserv.setEquipment(request.getParameter("equipment"));
                reserv.setDate(request.getParameter("date"));
                reserv.setReason(request.getParameter("reason"));
                reserv.setStatus(request.getParameter("status"));

                rDAO.insertReserv(reserv);

                RequestDispatcher view = request.getRequestDispatcher(FORM_EQUIP);
                request.setAttribute("user", dao.getUserByUsername(username));
                request.setAttribute("reserv", rDAO.selectAllReservByEmail(reserv.getEmail()));
                view.forward(request, response);

            } else if (action.equalsIgnoreCase("reservEqui")) {

                Reservation reserv = new Reservation();
                reserv.setResID(Integer.parseInt(request.getParameter("resID")));
                reserv.setUserid(Integer.parseInt(request.getParameter("userid")));
                reserv.setFullname(request.getParameter("fullname"));
                reserv.setNotel(request.getParameter("notel"));
                reserv.setEmail(request.getParameter("email"));
                reserv.setFacilities(request.getParameter("facilities"));
                reserv.setEquipment(request.getParameter("equipment"));
                reserv.setDate(request.getParameter("date"));
                reserv.setStatus(request.getParameter("status"));
                reserv.setReason(request.getParameter("reason"));
               
                

                rDAO.updateReserv(reserv);

                RequestDispatcher view = request.getRequestDispatcher(FORM_EQUIP);
                request.setAttribute("user", dao.getUserByUsername(username));
                request.setAttribute("reserv", rDAO.selectAllReservByEmail(reserv.getEmail()));
                view.forward(request, response);
            }

        } catch (Exception e) {
        }
    }

}
