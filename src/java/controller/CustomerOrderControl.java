/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customer;
import entity.CustomerOrder;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author Chow Sing Hong
 */
@WebServlet(name = "CustomerOrderControl", urlPatterns = {"/CustomerOrderControl"})
public class CustomerOrderControl extends HttpServlet {
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
        String action = request.getParameter("action");
        if(action.equals("orderHistory")){
            doGet_OrderHistory(request, response);
        }else if(action.equals("orderDetail")){
            doGet_OrderDetail(request, response);
        }else if(action.equals("updateStatus")){
            doGet_UpdateStatus(request, response);
        }
    }
    
    protected void doGet_OrderHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        Customer customer = (Customer)session.getAttribute("customer");
        List<CustomerOrder> customerOrderList;
        if(customer.getId() != null){
            Query query = em.createNamedQuery("CustomerOrder.findByCustomerID");
            query.setParameter("customer", customer);
            customerOrderList = query.getResultList();
            request.setAttribute("customerOrderList", customerOrderList);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Order/OrderHistory.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doGet_OrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        String orderID = request.getParameter("orderID");
        CustomerOrder customerOrder = em.find(CustomerOrder.class, orderID);
        request.setAttribute("customer_order", customerOrder);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Order/OrderDetails.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doGet_UpdateStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        String orderID = request.getParameter("orderID");
        CustomerOrder customerOrder = em.find(CustomerOrder.class, orderID);
        customerOrder.setStatus("Received");
        try{
            utx.begin();
            em.merge(customerOrder);
            utx.commit();
            request.setAttribute("customer_order", customerOrder);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Order/OrderDetails.jsp");
            dispatcher.forward(request, response);
        }catch(Exception ex){
            
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
