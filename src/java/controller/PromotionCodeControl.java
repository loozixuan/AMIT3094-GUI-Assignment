/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.CartItem;
import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * @author Chow Sing Hong
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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("applyPromotionCode")) {
            doGet_CustomerApply(request, response);
        } else if (action.equalsIgnoreCase("display")) {
            doGet_displayPromotionCode(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            try {
                doGet_AddPromotionCode(request, response);
            } catch (ParseException ex) {
                request.setAttribute("error", ex.getMessage());
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
            }
        } else if (action.equalsIgnoreCase("edit")) {
            try {
                doGet_EditPromotionCode(request, response);
            } catch (ParseException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
            }
        } else {
            doGet_DeletePromotionCode(request, response);
        }
    }

    protected void doGet_CustomerApply(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String promotionCode = request.getParameter("promotion_code");
        PromotionCode promotion_code = em.find(PromotionCode.class, promotionCode);
        HttpSession session = request.getSession();
        ArrayList<CartItem> cartItemList;
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer.getId() == null) {
            cartItemList = (ArrayList<CartItem>) session.getAttribute("guest" + "_cart");
        } else {
            cartItemList = (ArrayList<CartItem>) session.getAttribute(customer.getId() + "_cart");
        }
        if (promotion_code != null) {
            if (promotion_code.getStatus().equalsIgnoreCase("Active")) {
                if (promotion_code.checkPromotionStartedDate()) {
                    if (promotion_code.checkPromotionExpiredDate()) {
                        if (promotion_code.checkOrderAmountValidation(cartItemList)) {
                            request.setAttribute("promotion_code", promotion_code);
                        } else {
                            String error_message = "Spend minimum " + String.format("%.2f", promotion_code.getMinimumOrderAmount()) + " to apply this promotion code";
                            request.setAttribute("promotion_code_error", error_message);
                        }
                    } else {
                        String error_message = "This promotion code has been expired";
                        request.setAttribute("promotion_code_error", error_message);
                    }
                } else {
                    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                    String error_message = "This promotion code will be valid on after " + df.format(promotion_code.getStartDate());
                    request.setAttribute("promotion_code_error", error_message);
                }
            } else {
                String error_message = "Invalid Promotion Code";
                request.setAttribute("promotion_code_error", error_message);
            }
        } else {
            String error_message = "Invalid Promotion Code";
            request.setAttribute("promotion_code_error", error_message);
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Payment/Payment.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet_displayPromotionCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Query query = em.createNamedQuery("PromotionCode.findByStatus");
        query.setParameter("status", "Active");
        List<PromotionCode> promotionCodeList = query.getResultList();
        request.setAttribute("PromotionCodeList", promotionCodeList);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Promotion/Promotion.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet_AddPromotionCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        HttpSession session = request.getSession();
        String promotionCode = request.getParameter("promotionCode");
        String discountRate = request.getParameter("discountRate");
        String minimumOrderRequired = request.getParameter("minimumOrderRequired");
        String startedDate = request.getParameter("startedDate");
        String expiredDate = request.getParameter("expiredDate");
        Onlineadmin admin = (Onlineadmin) session.getAttribute("admin");

        int error_validation = 0;
        if (promotionCode.trim().length() <= 0) {
            String errorMessage = "Please enter the promotion code";
            request.setAttribute("promotionCode_error", errorMessage);
            error_validation++;
        } else {
            if(promotionCode.length() > 12){
                String errorMessage = "Please do not enter more than 12 characters for promotion code";
                request.setAttribute("promotionCode_error", errorMessage);
                error_validation++;
            }else{
                PromotionCode code = em.find(PromotionCode.class, promotionCode);
                if (code != null) {
                    String errorMessage = "This promotion code has existed";
                    request.setAttribute("promotionCode_error", errorMessage);
                    error_validation++;
                }
            }
        }

        if (discountRate.trim().length() <= 0) {
            String errorMessage = "Please select a discount rate";
            request.setAttribute("discountRate_error", errorMessage);
            error_validation++;
        }

        if (minimumOrderRequired.trim().length() <= 0) {
            String errorMessage = "Please enter the minimum order required";
            request.setAttribute("minimumOrderRequired_error", errorMessage);
            error_validation++;
        } else {
            String regular_expression = "\\d+(\\.\\d+)?";
            if (!minimumOrderRequired.matches(regular_expression)) {
                String errorMessage = "Invalid amount";
                request.setAttribute("minimumOrderRequired_error", errorMessage);
                error_validation++;
            }
        }

        if (startedDate.trim().length() <= 0) {
            String errorMessage = "Please select the started date";
            request.setAttribute("startedDate_error", errorMessage);
            error_validation++;
        }

        if (expiredDate.trim().trim().length() <= 0) {
            String errorMessage = "Please select a expired date";
            request.setAttribute("expiredDate_error", errorMessage);
            error_validation++;
        }

        if (startedDate.trim().length() > 0 && expiredDate.trim().trim().length() > 0) {
            Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(startedDate);
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate);
            if (date1.compareTo(date2) > 0) {
                String errorMessage = "The expired date must be on after the started date";
                request.setAttribute("expiredDate_error", errorMessage);
                error_validation++;
            }
        }

        if (error_validation > 0) {
            request.setAttribute("promotionCode_entered", promotionCode);
            request.setAttribute("discountRate_entered", discountRate);
            request.setAttribute("minimumOrderRequired_entered", minimumOrderRequired);
            request.setAttribute("startedDate_entered", startedDate);
            request.setAttribute("expiredDate_entered", expiredDate);
        } else {
            double discount_rate = Double.parseDouble(discountRate);
            double minimum_order_required = Double.parseDouble(minimumOrderRequired);
            Date started_date = new SimpleDateFormat("yyyy-MM-dd").parse(startedDate);
            Date expired_date = new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate);
            Date today_date = new java.util.Date();
            PromotionCode promotion_Code = new PromotionCode(promotionCode, discount_rate, minimum_order_required, started_date, expired_date);
            promotion_Code.setStatus("Active");

            ArrayList<PromotionUpdate> promotionUpdateList = new ArrayList<PromotionUpdate>();
            PromotionUpdate promotionUpdate = new PromotionUpdate(today_date, admin, promotion_Code);
            promotionUpdateList.add(promotionUpdate);
            promotion_Code.setPromotionUpdateList(promotionUpdateList);
            try {
                utx.begin();
                em.persist(promotion_Code);
                utx.commit();
                String sucess_message = "Promotion Code " + promotionCode + " has been added successfully.";
                request.setAttribute("sucess_message", sucess_message);
            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
            }
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Promotion/PromotionCodeInsert.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet_EditPromotionCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String promotionCode = request.getParameter("promotionCode");
        PromotionCode promotion_code = (PromotionCode) em.find(PromotionCode.class, promotionCode);
        if (promotion_code != null) {
            request.setAttribute("promotionCode_entered", promotion_code.getCode());
            request.setAttribute("discountRate_entered", String.valueOf(promotion_code.getDiscountRate()));
            request.setAttribute("minimumOrderRequired_entered", String.valueOf(promotion_code.getMinimumOrderAmount()));
            String startedDateString = dateFormat.format(promotion_code.getStartDate());
            request.setAttribute("startedDate_entered", startedDateString);
            String expiredDateString = dateFormat.format(promotion_code.getExpiredDate());
            request.setAttribute("expiredDate_entered", expiredDateString);
        }

        if (request.getParameter("submit") != null) {
            HttpSession session = request.getSession();
            String discountRate = request.getParameter("discountRate");
            String minimumOrderRequired = request.getParameter("minimumOrderRequired");
            String startedDate = request.getParameter("startedDate");
            String expiredDate = request.getParameter("expiredDate");
            Onlineadmin admin = (Onlineadmin) session.getAttribute("admin");

            int error_validation = 0;

            if (discountRate.trim().length() <= 0) {
                String errorMessage = "Please select a discount rate";
                request.setAttribute("discountRate_error", errorMessage);
                error_validation++;
            }

            if (minimumOrderRequired.trim().length() <= 0) {
                String errorMessage = "Please enter the minimum order required";
                request.setAttribute("minimumOrderRequired_error", errorMessage);
                error_validation++;
            } else {
                String regular_expression = "\\d+(\\.\\d+)?";
                if (!minimumOrderRequired.matches(regular_expression)) {
                    String errorMessage = "Invalid amount";
                    request.setAttribute("minimumOrderRequired_error", errorMessage);
                    error_validation++;
                }
            }

            if (startedDate.trim().length() <= 0) {
                String errorMessage = "Please select the started date";
                request.setAttribute("startedDate_error", errorMessage);
                error_validation++;
            }

            if (expiredDate.trim().trim().length() <= 0) {
                String errorMessage = "Please select a expired date";
                request.setAttribute("expiredDate_error", errorMessage);
                error_validation++;
            }

            if (startedDate.trim().length() > 0 && expiredDate.trim().trim().length() > 0) {
                Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(startedDate);
                Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate);
                if (date1.compareTo(date2) > 0) {
                    String errorMessage = "The expired date must be on after the started date";
                    request.setAttribute("expiredDate_error", errorMessage);
                    error_validation++;
                }
            }

            request.setAttribute("promotionCode_entered", promotionCode);
            request.setAttribute("discountRate_entered", discountRate);
            request.setAttribute("minimumOrderRequired_entered", minimumOrderRequired);
            request.setAttribute("startedDate_entered", startedDate);
            request.setAttribute("expiredDate_entered", expiredDate);

            if (error_validation <= 0) {
                PromotionCode promotion_code_updated = (PromotionCode) em.find(PromotionCode.class, promotionCode);
                promotion_code_updated.setDiscountRate(Double.parseDouble(discountRate));
                promotion_code_updated.setMinimumOrderAmount(Double.parseDouble(minimumOrderRequired));
                Date started_date = new SimpleDateFormat("yyyy-MM-dd").parse(startedDate);
                promotion_code_updated.setStartDate(started_date);
                Date expired_date = new SimpleDateFormat("yyyy-MM-dd").parse(expiredDate);
                promotion_code_updated.setExpiredDate(expired_date);
                Date today_date = new java.util.Date();
                PromotionUpdate promotionUpdate = new PromotionUpdate(today_date, admin, promotion_code_updated);
                promotionUpdate.setDate(today_date);
                promotion_code_updated.addPromotionUpdateList(promotionUpdate);
                try {
                    utx.begin();
                    em.merge(promotion_code_updated);
                    utx.commit();
                    String sucess_message = "Promotion Code " + promotionCode + " has been updated successfully.";
                    request.setAttribute("sucess_message", sucess_message);
                } catch (Exception ex) {
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<font color='red'>" + ex.getMessage() + "</font>");
                    }
                }
            }

        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Promotion/PromotionCodeUpdate.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet_DeletePromotionCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Onlineadmin admin = (Onlineadmin) session.getAttribute("admin");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String promotionCode = request.getParameter("promotionCode");
        PromotionCode promotion_code = (PromotionCode) em.find(PromotionCode.class, promotionCode);
        if (promotion_code != null) {
            request.setAttribute("promotionCode_entered", promotion_code.getCode());
            request.setAttribute("discountRate_entered", String.valueOf(promotion_code.getDiscountRate()));
            request.setAttribute("minimumOrderRequired_entered", String.valueOf(promotion_code.getMinimumOrderAmount()));
            String startedDateString = dateFormat.format(promotion_code.getStartDate());
            request.setAttribute("startedDate_entered", startedDateString);
            String expiredDateString = dateFormat.format(promotion_code.getExpiredDate());
            request.setAttribute("expiredDate_entered", expiredDateString);
        }

        if (request.getParameter("submit") != null) {
            promotion_code.setStatus("Inactive");
            Date today_date = new java.util.Date();
            ArrayList<PromotionUpdate> promotionUpdateList = new ArrayList<PromotionUpdate>();
            PromotionUpdate promotionUpdate = new PromotionUpdate(today_date, admin, promotion_code);
            promotionUpdateList.add(promotionUpdate);
            promotion_code.setPromotionUpdateList(promotionUpdateList);
            try {
                utx.begin();
                em.merge(promotion_code);
                utx.commit();
                doGet_displayPromotionCode(request, response);
            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
            }
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Admin/Promotion/PromotionCodeDelete.jsp");
        dispatcher.forward(request, response);
    }

    public double calculateCartTotal(ArrayList<CartItem> cartItemList) {
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
