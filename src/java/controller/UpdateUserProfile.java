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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import java.util.Base64;
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
import java.security.MessageDigest;

/**
 *
 * @author Chrisann Lee
 */
@WebServlet(name = "UpdateUserProfile", urlPatterns = {"/UpdateUserProfile"})
public class UpdateUserProfile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        String password_regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
        String phone_regex = "^(01)[0-46-9]*[0-9]{7,8}$$";
        String email = request.getParameter("hidden_email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String currentPassword = request.getParameter("current_password");
        String hiddenPassword = request.getParameter("hidden_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        Boolean valid = false;
        String password = "";
        String error = "";
        String encodedNewPassword = "";
        String encodedCurrentPassword = "";
        Pattern pattern = Pattern.compile(password_regex);
        Matcher matcher = pattern.matcher(newPassword);
        Pattern patternPhone = Pattern.compile(phone_regex);
        Matcher matcherPhone = patternPhone.matcher(phone);

        //Encrypt password
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(newPassword.getBytes(StandardCharsets.UTF_8));
            byte[] hashCurrent = digest.digest(currentPassword.getBytes(StandardCharsets.UTF_8));
            encodedNewPassword = Base64.getEncoder().encodeToString(hash);
            encodedCurrentPassword = Base64.getEncoder().encodeToString(hashCurrent);

        } catch (Exception ex) {
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
            }

        }

        //Password Validation
        if (!currentPassword.equals("")) {
            if (!encodedCurrentPassword.equals(hiddenPassword)) {
                error = "Current password does not match.";
            } else if (newPassword.equals("") || confirmPassword.equals("")) {
                error = "Please enter new password or confirm password.";
            } else if (!newPassword.equals(confirmPassword)) {
                error = "New password and confirm password does not match.";
            } else if (matcher.matches() != true) {
                error = "Password requires 8 characters, at least 1 letter and 1 number.";
            } else {
                valid = true;
                password = encodedNewPassword;
            }
        } else {
            valid = true;
            password = hiddenPassword;
        }

        //Phone validation
        if (!matcherPhone.matches()) {
            error += "\nPlease enter a valid Telephone Number.";
        }

        if (name != null && phone != null && address != null && valid == true && matcherPhone.matches()) {

            try {
                Query query = em.createNamedQuery("Customer.findByEmail");  //get from database
                query.setParameter("email", email);
                List<Customer> customer = query.getResultList();

                Customer customerDetails = customer.get(0);
                if (customerDetails != null) {
                    customerDetails.setName(name);
                    customerDetails.setAddress(address);
                    customerDetails.setContactNumber(phone);
                    customerDetails.setPassword(password);
                    utx.begin();
                    em.merge(customerDetails);
                    utx.commit();
                    String message = "Account details changed successfully.";
                    request.setAttribute("successMessage", message);
                    RequestDispatcher rd = request.getRequestDispatcher("/Client/User/userProfile.jsp");
                    rd.forward(request, response);
                }

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.print(ex.getMessage());
                }

            }

        } else {
            request.setAttribute("errorMessage", error);
            RequestDispatcher rd = request.getRequestDispatcher("<%=request.getContextPath()%>/Client/User/userProfile.jsp");
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
