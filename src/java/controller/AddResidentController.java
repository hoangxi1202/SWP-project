/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dao.UserDAO;
import dto.ResidentDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "AddResidentController", urlPatterns = {"/AddResidentController"})
public class AddResidentController extends HttpServlet {

    private static final String SUCCESS = "user.jsp";
    private static final String ERROR = "addResident.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String[] name = request.getParameterValues("name");
            String[] dob = request.getParameterValues("dob");
            String[] gender = request.getParameterValues("gender");
            String[] job = request.getParameterValues("job");
            String[] phone = request.getParameterValues("phone");
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserDAO dao = new UserDAO();
            String ownerId = dao.getOwnerId(loginUser.getUserID());
            ResidentDAO daoRes = new ResidentDAO();
            String residentId = ownerId + String.valueOf(daoRes.getIndexResident(ownerId));
            int indexReq = daoRes.getIndexRequest() + 1;
            String requestId = "REQ";
            if (indexReq > 99) {
                requestId += String.valueOf(indexReq);
            } else {
                requestId += "0" + String.valueOf(indexReq);
            }
            daoRes.insertRequest(requestId, ownerId);
            for (int i = 0; i < name.length; i++) {
                daoRes.addResident(new ResidentDTO(residentId, ownerId, name[i], dob[i], (gender[i].equals("1")), job[i], phone[i], false, requestId));
            }
            url = SUCCESS;

        } catch (ClassNotFoundException | SQLException e) {
            log("Error at AddResidentCOntroller: " + e.toString());
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
