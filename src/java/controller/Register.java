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
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String contactNo = request.getParameter("contactNo");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
   
        int error = 0;
        if(fullName.trim().length() <= 0){
            String errorMessage = "Please enter your full name.";
            request.setAttribute("fullName_error", errorMessage);
            error++;
        }
        
        if(email.trim().length() <= 0){
            String errorMessage = "Please enter your email.";
            request.setAttribute("email_error", errorMessage);
            error++;
        }else{
            String regular_expression = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$";
            if(!email.matches(regular_expression)){
                String errorMessage = "Invalid Email";
                request.setAttribute("email_error", errorMessage);
                error++;
            }else{
                Query query = em.createNamedQuery("Customer.findByEmail");
                query.setParameter("email", email);
                List <Customer> customerList = query.getResultList();
                if(customerList.size() > 0){
                    String errorMessage = "This email has already been registered";
                    request.setAttribute("email_error", errorMessage);
                    error++;
                }
                
            }
        }
        
        if(address.trim().length() <= 0){
            String errorMessage = "Please enter your address.";
            request.setAttribute("address_error", errorMessage);
            error++;
        }
        
        if(contactNo.trim().length() <= 0){
            String errorMessage = "Please enter your contact number.";
            request.setAttribute("contactNo_error", errorMessage);
            error++;
        }else{
            String regular_expression = "[\\d]{3}-{0,1}[\\d]{7,8}";
            if(!contactNo.matches(regular_expression)){
                String errorMessage = "Invalid Contact Number";
                request.setAttribute("contactNo_error", errorMessage);
                error++;
            }
        }
           
        if(password.trim().length() <= 0){  
            String errorMessage = "Please enter your password";
            request.setAttribute("password_error", errorMessage);
            error++;
        }else{
            if(password.trim().length() < 8){
                String errorMessage = "Please enter at least 8 character for your password";
                request.setAttribute("password_error", errorMessage);
                error++;
            }else{
                if(cpassword.trim().length() < 0){
                    String errorMessage = "Please confirm your password";
                    request.setAttribute("cpassword_error", errorMessage);
                    error++;
                }else{
                    if(!password.equals(cpassword)){
                        String errorMessage = "Conform Password does not match";
                        request.setAttribute("cpassword_error", errorMessage);
                        error++;
                    }
                }
            }
        }
       
        if(error > 0){
            request.setAttribute("fullName_entered", fullName);
            request.setAttribute("email_entered", email);
            request.setAttribute("address_entered", address);
            request.setAttribute("contactNo_entered", contactNo);
            request.setAttribute("password_entered", password);
            request.setAttribute("cpassword_entered", cpassword);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Register/register.jsp");
            dispatcher.forward(request, response);
        }else{
            try {
                MessageDigest digest;
                String encryptedPassword = "";
                try {
                    digest = MessageDigest.getInstance("SHA-256");
                    byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                    encryptedPassword = Base64.getEncoder().encodeToString(hash);
                } catch (NoSuchAlgorithmException ex) {
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<font color='red'>" + ex.getMessage() + "</font>");
                    }
                }
               
                String customerID = "";
                Query query2 = em.createNamedQuery("Customer.findAll");
                int numberOfCustomer = 1000 + query2.getResultList().size();
                customerID = "C" + numberOfCustomer;
                
                Customer customer = new Customer();
                customer.setId(customerID);
                customer.setName(fullName);
                customer.setEmail(email);
                customer.setAddress(address);
                customer.setContactNumber(contactNo);
                customer.setPassword(encryptedPassword);
                customer.setStatus("Active");
                utx.begin();
                em.persist(customer);
                utx.commit();      
                request.setAttribute("success_message", "Successfully Registered");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Register/register.jsp");
                dispatcher.forward(request, response);
                
            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
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
