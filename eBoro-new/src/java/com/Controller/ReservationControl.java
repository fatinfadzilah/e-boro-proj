package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ReservationDAO;
import com.MODEL.Reservation;
import java.sql.SQLException;

public class ReservationControl extends HttpServlet {

    private static String INSERT = "/item.jsp";
    private static String EDIT = "/editReserv.jsp";
    private static String LIST_RESERV = "/listReserv.jsp";
    private ReservationDAO dao;

    public ReservationControl() throws ClassNotFoundException {
        super();
        dao = new ReservationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String forward = "";
            String action = request.getParameter("action");

            if (action.equalsIgnoreCase("delete")) {
                int resID = Integer.parseInt(request.getParameter("resID"));
                dao.deleteReserv(resID);
                forward = LIST_RESERV;
                request.setAttribute("resrv", dao.selectAllReserv());

            } else if (action.equalsIgnoreCase("edit")) {
                forward = EDIT;
                int resID = Integer.parseInt(request.getParameter("resID"));
                Reservation reserv = dao.selectReserv(resID);
                request.setAttribute("resrv", reserv);

            } else if (action.equalsIgnoreCase("listReserv")) {
                forward = LIST_RESERV;
                request.setAttribute("resrv", dao.selectAllReserv());

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
        
        Reservation reserv = new Reservation();
        
       
        reserv.setUserid(Integer.parseInt(request.getParameter("userid")));
        reserv.setFullname(request.getParameter("fullname"));
        reserv.setNotel(request.getParameter("notel"));
        reserv.setEmail(request.getParameter("email"));
        reserv.setFacilities(request.getParameter("facilities"));
        reserv.setEquipment(request.getParameter("equipment"));
        reserv.setDate(request.getParameter("date"));
        reserv.setStatus(request.getParameter("status"));
        reserv.setReason(request.getParameter("reason"));

        try {
            if (action.equalsIgnoreCase("edit")) {
                reserv.setResID(Integer.parseInt(request.getParameter("resID")));
                dao.updateReserv(reserv);
            }else{
                
            }
        } catch (Exception e) {
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_RESERV);
        request.setAttribute("resrv", dao.selectAllReserv());
        view.forward(request, response);
    }

}
