/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Onlineadmin;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zixua
 */
@WebServlet(name = "ProcessEmployee", urlPatterns = {"/ProcessEmployee"})
public class ProcessEmployee extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("add")) {
            doPostAdd(request, response);
        } else if (action.equalsIgnoreCase("update")) {
            doPostUpdate(request, response);
        } else {
            doPostDelete(request, response);
        }
    }

    protected void doPostAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String role = request.getParameter("role");

//        String err_msg = "";
        boolean validation = false;

        String email_regex = "^[A-Za-z0-9+_.-]+@(.+)$"; //email pattern
        String password_regex = "^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";  //>=1 Number, >=1 Character , 6 Characters
        Pattern email_pattern = Pattern.compile(email_regex);
        Matcher email_matcher = email_pattern.matcher(email);

        Pattern password_pattern = Pattern.compile(password_regex);
        Matcher password_matcher = password_pattern.matcher(password);

        StringBuilder sb = new StringBuilder();

        if (name.isEmpty() || password.isEmpty() || email.isEmpty() || role == null) {
            sb.append("\n All fields must be filled in \n").append("\n");
        } else {
            if (email_matcher.matches() != true) {
//                err_msg = "Email format wrong. Please reenter";
                sb.append("\n Email format wrong. Please enter again\n").append("\n");
            } else if (password_matcher.matches() != true) {
//                    err_msg = "Password format wrong E.g. (At least One Digit, One Character and 6 Characters). Please reenter";
                sb.append("\n Password format wrong. Please enter again \n").append("\n");
            } else if (!password.equals(cpassword)) {
                sb.append("\n Password and Confirmed password not same. Please enter again \n");
            } else {
                validation = true;
            }
        }

        if (validation == true) {

            try {
                // Decrypt password         
                String encodedPassword = "";
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                encodedPassword = Base64.getEncoder().encodeToString(hash);

                Query queryTotalUser = em.createNamedQuery("Onlineadmin.findAll");
                List<Onlineadmin> totalAdmin = queryTotalUser.getResultList();

                int countUser = 0;
                for (Onlineadmin totalAdminUser : totalAdmin) {
                    countUser++;
                }
                countUser = countUser + 1;

                Query query = em.createNamedQuery("Onlineadmin.findByEmail").setParameter("email", email);

                List<Onlineadmin> admin = query.getResultList();
                if (admin.isEmpty()) {
                    Onlineadmin adminInfo = new Onlineadmin();

                    // error coz cannot retrieve any result
                    adminInfo.setId(String.valueOf(countUser));
                    adminInfo.setName(name);
                    adminInfo.setEmail(email);
                    adminInfo.setPassword(encodedPassword);
                    adminInfo.setRole(role);
                    adminInfo.setStatus("Active");

                    utx.begin();
                    em.persist(adminInfo);
                    utx.commit();

                    String success_msg = "One " + role + " successfuly added";
                    request.setAttribute("success_msg", success_msg);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/Employee/AddEmployeeForm.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }

        } else {
            String errMsg = sb.toString();
            request.setAttribute("err_msg", errMsg);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("cpassword", cpassword);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Employee/AddEmployeeForm.jsp");
            rd.forward(request, response);
        }

    }

    protected void doPostUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String currentpassword = request.getParameter("currentpassword");
        String newpassword = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String role = request.getParameter("role");

        String err_msg = "";
        boolean validate = false;
        boolean validate_null = false;

        String email_regex = "^[A-Za-z0-9+_.-]+@(.+)$";
        String password_regex = "^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";  //>=1 Number, >=1 Character , 6 Characters

        Pattern email_pattern = Pattern.compile(email_regex);
        Matcher email_matcher = email_pattern.matcher(email);
        Pattern password_pattern = Pattern.compile(password_regex);
        Matcher new_password_matcher = password_pattern.matcher(newpassword);

        if (name.isEmpty() || currentpassword.isEmpty() || newpassword.isEmpty() || cpassword.isEmpty() || email.isEmpty() || role == null) {
            err_msg = "All fields must be filled in";
        } else {
            validate_null = true;
        }

        if (email_matcher.matches() != true) {
            err_msg = "Email format wrong. Please enter again";
        } else if (new_password_matcher.matches() != true) {
            err_msg = "Password format wrong E.g. (At least One Digit, One Character and 6 Characters). Please enter again";

        } else if (!newpassword.equals(cpassword)) {
            err_msg = "Password and Confirmed password not same. Please enter agai";
        } else {
            validate = true;
        }

        if (validate == true && validate_null == true) {
            try {
                // Decrypt current password to match with database         
                String encodedCurrentPassword = "";
                String encodedNewPassword = "";
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(currentpassword.getBytes(StandardCharsets.UTF_8));
                encodedCurrentPassword = Base64.getEncoder().encodeToString(hash);
                byte[] hashcode = digest.digest(newpassword.getBytes(StandardCharsets.UTF_8));
                encodedNewPassword = Base64.getEncoder().encodeToString(hashcode);

                Query query = em.createNamedQuery("Onlineadmin.findByEmail").setParameter("email", email);
                List<Onlineadmin> adminList = query.getResultList();

                Onlineadmin admin = adminList.get(0);

                if (admin != null && admin.getPassword().equals(encodedCurrentPassword)) {
                    admin.setEmail(email);
                    admin.setName(name);
                    admin.setPassword(encodedNewPassword);
                    admin.setRole(role);

                    utx.begin();
                    em.merge(admin);
                    utx.commit();

                    String success_msg = "Information Update Successfully";
                    request.setAttribute("success_msg", success_msg);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/Employee/UpdateEmployeeForm.jsp");
                    rd.forward(request, response);
                }

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }
        } else {
            request.setAttribute("err_msg", err_msg);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Employee/UpdateEmployeeForm.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPostDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
