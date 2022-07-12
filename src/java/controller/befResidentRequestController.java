/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dto.RequestDTO;
import dto.ResidentDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "befResidentRequestController", urlPatterns = {"/befResidentRequestController"})
public class befResidentRequestController extends HttpServlet {

    private static final String SUCCESS = "requestResident.jsp";
    private static final String ERROR = "employee.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        List<ResidentDTO> listResident = null;
        List<RequestDTO> listRequest = null;
        try {
            ResidentDAO dao = new ResidentDAO();
<<<<<<< HEAD
            listReqAdd = dao.getListRequest("add");
            listReqDel = dao.getListRequest("delete");
            if (listReqAdd.size() > 0) {
                for (RequestDTO requestDTO : listReqAdd) {
                    listResAdd = dao.getListRequestRes("add", requestDTO.getOwnerId());
                    requestDTO.setListRes(listResAdd);
=======
            listRequest = dao.getListRequest();
            if (listRequest.size() > 0) {
                for (RequestDTO requestDTO : listRequest) {
                    listResident = dao.getListRequestRes(requestDTO.getRequestId());
                    requestDTO.setListRes(listResident);
>>>>>>> 3e2547f2cf0d384ef18769796a63854499d27e03
                }
                request.setAttribute("LIST_RESIDENT_REQ", listRequest);
            }
            url = SUCCESS;
        } catch (SQLException e) {
            log("Error at befResidentRequestController: " + e.toString());
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
