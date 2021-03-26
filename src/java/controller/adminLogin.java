/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Onlineadmin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asus
 */
@WebServlet(name = "adminLogin", urlPatterns = {"/adminLogin"})
public class adminLogin extends HttpServlet {

    EntityManager em;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!email.equals("") && !password.equals("")) {
            try {
                Query query = em.createNativeQuery("SELECT * FROM ONLINEADMIN WHERE EMAIL ='"
                        + email + "' AND PASSWORD='" + password + "'", entity.Onlineadmin.class);
//                Query query = em.createNamedQuery("Onlineadmin.findByAccount");
//                query.setParameter("email", email);
//                query.setParameter("password", password);

                List<Onlineadmin> ad = query.getResultList();
                Onlineadmin admin = ad.get(0);

                if (admin != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", admin);
                    response.sendRedirect("Admin/SalesRecord/ViewSalesRecord.jsp");
                }

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.print(ex.getMessage());
                }
                String errMsg = "The user not found.";
                request.setAttribute("errMsg", errMsg);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Dashboard/dashboard.jsp");
                rd.forward(request, response);
            }
        } else {

            String errMsg = "Invalid email or password. Please enter again";
            request.setAttribute("errMsg", errMsg);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin Login/adminLogin.jsp");
            rd.forward(request, response);

        }

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
