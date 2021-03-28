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
import java.security.MessageDigest;
import java.util.Base64;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Chrisann Lee
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

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
        //response.sendRedirect("Client/Login/ForgotPassword.jsp");
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

        response.sendRedirect("Client/Login/ForgotPassword.jsp");
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
        String action = request.getParameter("action");
        String email_regex = "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$";

        if (action.equals("email")) {

            String email = request.getParameter("email");
            //Email Validation
            Pattern patternEmail = Pattern.compile(email_regex);
            Matcher matcherEmail = patternEmail.matcher(email);
            if (!email.equals(" ") && matcherEmail.matches()) {
                JavaMailUtil.sendMail(email);
                response.sendRedirect("Client/Login/SendedEmail.jsp");

            } else {
                String message = "Please enter a valid emial";
                request.setAttribute("errorMessage", message);
                RequestDispatcher rd = request.getRequestDispatcher("Client/Login/ForgotPassword.jsp");
                rd.include(request, response);

            }

        } else {

            String email = request.getParameter("email");
            String password_regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
            String newPassword = request.getParameter("new_password");
            String confirmPassword = request.getParameter("confirm_password");
            String encodedNewPassword = "";
            if (!email.equals("") && !newPassword.equals("") && !confirmPassword.equals("")) {
                Pattern pattern = Pattern.compile(password_regex);
                Matcher matcher = pattern.matcher(newPassword);
                Pattern patternEmail = Pattern.compile(email_regex);
                Matcher matcherEmail = patternEmail.matcher(email);

                //Encrypt password
                try {
                    MessageDigest digest = MessageDigest.getInstance("SHA-256");
                    byte[] hash = digest.digest(newPassword.getBytes(StandardCharsets.UTF_8));
                    encodedNewPassword = Base64.getEncoder().encodeToString(hash);
                } catch (Exception ex) {
                    try (PrintWriter out = response.getWriter()) {
                        out.print(ex.getMessage());
                    }

                }

                if (matcherEmail.matches() && matcher.matches() && newPassword.equals(confirmPassword)) {
                    try {
                        Query query = em.createNamedQuery("Customer.findByEmail");  //get from database
                        query.setParameter("email", email);
                        List<Customer> customer = query.getResultList();

                        Customer customerDetails = customer.get(0);

                        if (customerDetails != null) {
                            customerDetails.setPassword(encodedNewPassword);
                            utx.begin();
                            em.merge(customerDetails);
                            utx.commit();
                            String message = "Account details changed successfully. Please login to your account.";
                            request.setAttribute("successMessage", message);
                            RequestDispatcher rd = request.getRequestDispatcher("Client/Login/login.jsp");
                            rd.forward(request, response);
                        }

                    } catch (Exception ex) {
                        String message = "No user found.";
                        request.setAttribute("errorMessage", message);
                        RequestDispatcher rd = request.getRequestDispatcher("Client/Login/ChangePassword.jsp");
                        rd.include(request, response);

                    }

                } else {
                    String message = "Please enter a valid email or password. New Password must same with the Confirm Password.";
                    request.setAttribute("errorMessage", message);
                    RequestDispatcher rd = request.getRequestDispatcher("Client/Login/ChangePassword.jsp");
                    rd.include(request, response);

                }

            } else {
                String message = "Please enter a valid email or password. New Password must same with the Confirm Password";
                request.setAttribute("errorMessage", message);
                RequestDispatcher rd = request.getRequestDispatcher("Client/Login/ChangePassword.jsp");
                rd.include(request, response);

            }

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
