/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.CartItem;
import entity.Customer;
import entity.CustomerOrder;
import entity.PromotionCode;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Order;
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
 * @author user
 */
@WebServlet(name = "PromotionCodeControl", urlPatterns = {"/PromotionCodeControl"})
public class PromotionCodeControl extends HttpServlet {
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
        String promotionCode = request.getParameter("promotion_code");
        PromotionCode promotion_code = em.find(PromotionCode.class, promotionCode);
        HttpSession session = request.getSession();
        ArrayList<CartItem> cartItemList;
        Customer customer = (Customer)session.getAttribute("customer");
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        }
        if(promotion_code != null){
            if(promotion_code.checkPromotionStartedDate()){
                if(promotion_code.checkPromotionExpiredDate()){
                    if(promotion_code.checkOrderAmountValidation(cartItemList)){
                        request.setAttribute("promotion_code", promotion_code);
                    }else{
                        String error_message = "Spend minimum " + String.format("%.2f", promotion_code.getMinimumOrderAmount()) + " to apply this promotion code";
                        request.setAttribute("promotion_code_error", error_message);
                    }
                }else{
                    String error_message = "This promotion code has been expired";
                    request.setAttribute("promotion_code_error", error_message);
                }
            }else{
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                String error_message = "This promotion code will be valid on after " + df.format(promotion_code.getStartDate());
                request.setAttribute("promotion_code_error", error_message);
            }
        }else{
            String error_message = "Invalid Promotion Code";
            request.setAttribute("promotion_code_error", error_message);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Payment/Payment.jsp");
        dispatcher.forward(request, response);     
    }
    
    public double calculateCartTotal(ArrayList<CartItem> cartItemList){
        double total = 0;
        for (int i = 0; i < cartItemList.size(); i++) {
            total += (cartItemList.get(i).getProduct().getPrice() * cartItemList.get(i).getQuantity());
        }
        return total;
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
