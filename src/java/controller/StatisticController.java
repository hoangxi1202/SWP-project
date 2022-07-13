/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ApartmentDAO;
import dao.BillDAO;
import dao.ContractDAO;
import dao.ResidentDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "StatisticController", urlPatterns = {"/StatisticController"})
public class StatisticController extends HttpServlet {

    private static final String ERROR = "homeAdmin.jsp";
    private static final String SUCCESS = "homeAdmin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        int countRoomEmpty, countRoomNotEmpty, availableContract, unavailableContract, countResident;
        double money = 0;
        ContractDAO contract = new ContractDAO();
        ResidentDAO resident = new ResidentDAO();
        BillDAO bill = new BillDAO();
        ApartmentDAO apartment = new ApartmentDAO();
        try {
            countRoomEmpty = apartment.countApartment("1");
            countRoomNotEmpty = apartment.countApartment("0");
            availableContract = contract.countContract("1");
            unavailableContract = contract.countContract("0");
            countResident = resident.countResident("1", "");
            money = bill.getStatistic(fromDate, toDate);
            request.setAttribute("ROOM_EMPTY", countRoomEmpty);
            request.setAttribute("ROOM_NOT_EMPTY", countRoomNotEmpty);
            request.setAttribute("CONTRACT_AVAILABLE", availableContract);
            request.setAttribute("CONTRACT_UNAVAILABLE", unavailableContract);
            request.setAttribute("RESIDENT", countResident);
            request.setAttribute("MONEY", money);
            url = SUCCESS;
        } catch (SQLException e) {
            log("Error at StatisticController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
