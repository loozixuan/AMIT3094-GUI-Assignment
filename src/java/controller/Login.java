/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.util.Base64;

/**
 *
 * @author Chrisann Lee
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @PersistenceContext
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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String encodedPassword = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            encodedPassword = Base64.getEncoder().encodeToString(hash);

        } catch (Exception ex) {
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
            }

        }

        if (!email.equals("") && !password.equals("")) {
            try {
                Query query = em.createNamedQuery("Customer.findAccount");
                query.setParameter("email", email);
                query.setParameter("password", encodedPassword);

                // Customer customer = (Customer) query.getSingleResult();
                List<Customer> cust = query.getResultList();
                Customer customer = cust.get(0);

                if (customer != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("customer", customer);
                    response.sendRedirect("Client/Home/home.jsp");

                }

            } catch (Exception ex) {
                String errorMessage = "No user found";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("Client/Login/login.jsp");
                rd.include(request, response);

            }

        } else {

            String errorMessage = "Please fill in all the field required";
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher rd = request.getRequestDispatcher("Client/Login/login.jsp");
            rd.include(request, response);
            // response.sendRedirect("Client/Login/login.jsp");

        }

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
