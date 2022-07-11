/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ApartmentDAO;
import dto.ApartmentDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Trieu Do
 */
@WebServlet(name = "SearchApartmentController", urlPatterns = {"/SearchApartmentController"})
public class SearchApartmentController extends HttpServlet {

    private static final String ERROR_AD = "admin.jsp";
    private static final String ERROR_US = "user.jsp";
    private static final String SUCCESS_AD = "admin.jsp";
    private static final String SUCCESS_US = "user.jsp";
    private static final String AD = "AD";
    private static final String US = "US";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

        String indexPage = request.getParameter("index");
        if ("".equals(indexPage) || indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        String curUser = loginUser.getRoleID();
        String url = "";
        int count = 0;

        List<ApartmentDTO> listApartment = null;
        ApartmentDAO dao = new ApartmentDAO();
        if (AD.equals(curUser)) {
            url = ERROR_AD;
        } else if (US.equals(curUser)) {
            url = ERROR_US;
        }
        try {
            count = dao.getTotalApartment();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }

            String searchApartment = request.getParameter("searchApartment");
            if (searchApartment == null) {
                searchApartment = "";
            }
            if (AD.equals(curUser)) {
                listApartment = dao.getListApartment_AD(searchApartment, index);
                request.setAttribute("endP", endPage);
            } else if (US.equals(curUser)) {
                listApartment = dao.getListApartment_US(searchApartment);
            }
            if (listApartment.size() > 0) {
                request.setAttribute("LIST_APARTMENT", listApartment);
                if (AD.equals(curUser)) {
                    url = SUCCESS_AD;
                } else if (US.equals(curUser)) {
                    url = SUCCESS_US;
                }
            }
        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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
