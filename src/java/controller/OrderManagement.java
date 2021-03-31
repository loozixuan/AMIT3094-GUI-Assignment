/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CustomerOrder;
import entity.OrderDetail;
import entity.Payment;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Chrisann Lee
 */
@WebServlet(name = "OrderManagement", urlPatterns = {"/OrderManagement"})
public class OrderManagement extends HttpServlet {

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
            out.println("<title>Servlet OrderManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderManagement at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        if (action.equals("view")) {
            try {
                Query query = em.createNamedQuery("CustomerOrder.findAll");
                List<entity.CustomerOrder> orderList = query.getResultList();
                request.setAttribute("orderList", orderList);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Order/customerOrder.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                response.sendRedirect("Admin/Order/customerOrder.jsp");

            }

        } else if (action.equalsIgnoreCase("viewSingleOrder") || action.equalsIgnoreCase("ship") || action.equalsIgnoreCase("cancel")) {
            try {
                String id = request.getParameter("id");
                Query query = em.createNamedQuery("CustomerOrder.findById");
                query.setParameter("id", id);
                List<CustomerOrder> orderList = query.getResultList();
                CustomerOrder order = orderList.get(0);

                Query queryDetails = em.createNativeQuery("SELECT * FROM ORDER_DETAIL WHERE ORDER_ID ='"
                        + id + "' ", OrderDetail.class);
                List<OrderDetail> orderDetailsList = queryDetails.getResultList();

                Query queryPayment = em.createNativeQuery("SELECT * FROM PAYMENT WHERE CUSTOMER_ORDER_ID ='"
                        + id + "' ", Payment.class);
                List<Payment> paymentList = queryPayment.getResultList();
                Payment payment = paymentList.get(0);

                request.setAttribute("order", order);
                request.setAttribute("orderDetailsList", orderDetailsList);
                request.setAttribute("payment", payment);
                if (action.equalsIgnoreCase("viewSingleOrder")) {
                    request.setAttribute("action", "view");
                } else if (action.equalsIgnoreCase("ship")) {
                    request.setAttribute("action", "ship");
                } else {
                    request.setAttribute("action", "cancel");
                }

                RequestDispatcher rd = request.getRequestDispatcher("Admin/Order/orderDetails.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.print(ex.getMessage());
                }

            }

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
