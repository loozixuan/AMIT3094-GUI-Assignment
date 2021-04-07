/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.xml.bind.util.CalendarConv.formatter;
import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Date;
import java.util.List;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author zixua
 */
@WebServlet(name = "LoginAdmin", urlPatterns = {"/LoginAdmin"})
public class LoginAdmin extends HttpServlet {

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
        if (action.equals("logout")) {
            doGet(request, response);
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
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute("admin");

            response.sendRedirect("/HobbitHall/Admin/AdminLogin/adminLogin.jsp");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (!email.equals("") && !password.equals("")) {
            try {
                String encodedPassword = "";
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                encodedPassword = Base64.getEncoder().encodeToString(hash);

                Query query = em.createNamedQuery("Onlineadmin.findByAccount").setParameter("email", email).setParameter("password", encodedPassword);

                // find total admin
                Query queryTotalUser = em.createNamedQuery("Onlineadmin.findByStatus").setParameter("status", "Active");
                List<Onlineadmin> totalAdmin = queryTotalUser.getResultList();

                int countUser = 0;
                for (Onlineadmin totalAdminUser : totalAdmin) {
                    countUser++;
                }

                // find total product
                Query queryTotalProduct = em.createNamedQuery("Product.findAll");
                List<Product> totalProduct = queryTotalProduct.getResultList();

                int countProd = 0;
                for (Product totalProductHH : totalProduct) {
                    countProd++;
                }

                // find total order for today date
                // Today Date
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
                LocalDate localDate = LocalDate.now();

                // Day Of Week 
                SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                Date dt1 = format1.parse(String.valueOf(localDate));
                DateFormat format2 = new SimpleDateFormat("EEEE");
                String dayOfWeek = format2.format(dt1);

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date salesdate = formatter.parse(formatter.format(new Date()));

                Query queryOrder = em.createNamedQuery("CustomerOrder.findByDate").setParameter("date", salesdate);
                List<CustomerOrder> customerOrderList = queryOrder.getResultList();
                int countOrder = 0;
                for (CustomerOrder totalOrder : customerOrderList) {
                    countOrder++;
                }

                Query categoryQuery = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + 1 + "' ", Subcategory.class);
                List<Subcategory> subcategoryList = categoryQuery.getResultList();
                int countsubcategoryList = 0;
                for (Subcategory totalsubcategory : subcategoryList) {
                    countsubcategoryList++;
                }

                Query categoryQuery2 = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + 2 + "' ", Subcategory.class);
                List<Subcategory> subcategoryList2 = categoryQuery2.getResultList();
                int countsubcategoryList2 = 0;
                for (Subcategory totalsubcategory : subcategoryList2) {
                    countsubcategoryList2++;
                }

                Query categoryQuery3 = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + 3 + "' ", Subcategory.class);
                List<Subcategory> subcategoryList3 = categoryQuery3.getResultList();
                int countsubcategoryList3 = 0;
                for (Subcategory totalsubcategory : subcategoryList3) {
                    countsubcategoryList3++;
                }

                List<Onlineadmin> adminList = query.getResultList();

                Onlineadmin admin = adminList.get(0);
                if (admin != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", admin);
                    session.setAttribute("countUser", countUser);
                    session.setAttribute("countProd", countProd);
                    session.setAttribute("countOrder", countOrder);
                    session.setAttribute("countsubcategoryList", countsubcategoryList);
                    session.setAttribute("countsubcategoryList2", countsubcategoryList2);
                    session.setAttribute("countsubcategoryList3", countsubcategoryList3);

                    response.sendRedirect("Admin/Dashboard/dashboard.jsp");
                }

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }
        } else {
            String errMsg = "Invalid email or password. Please enter again";
            request.setAttribute("errMsg", errMsg);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/AdminLogin/adminLogin.jsp");
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
