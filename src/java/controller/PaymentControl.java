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
import java.util.ArrayList;
import java.util.Date;
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
 * @author user
 */
@WebServlet(name = "PaymentControl", urlPatterns = {"/PaymentControl"})
public class PaymentControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer.getId() != null) {
            request.setAttribute("email_entered", customer.getEmail());
            request.setAttribute("receiver_name_entered", customer.getName());
            request.setAttribute("address_entered", customer.getAddress());
            request.setAttribute("contact_number_entered", customer.getContactNumber());
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Payment/Payment.jsp");
        dispatcher.forward(request, response);

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
        String receiver_name = request.getParameter("receiver_name");
        String address = request.getParameter("address");
        String contact_number = request.getParameter("contact_number");
        String payment_method = request.getParameter("payment_method");
        String card_owner = request.getParameter("card_owner");
        String card_number = request.getParameter("card_number");
        String card_expiration = request.getParameter("card_expiration");
        String card_cvv = request.getParameter("card_cvv");
        String promotion_code = request.getParameter("promotion_code");

        int inputValidation = 0;
        if (email.trim().length() <= 0) {
            request.setAttribute("email_error", "Please enter your email");
            inputValidation++;
        } else {
            String regular_expression = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$";
            if (!email.matches(regular_expression)) {
                request.setAttribute("email_error", "Please enter a valid email");
                inputValidation++;
            }
        }

        if (receiver_name.trim().length() <= 0) {
            request.setAttribute("receiver_name_error", "Please enter your receiver name");
            inputValidation++;
        }

        if (address.trim().length() <= 0) {
            request.setAttribute("address_error", "Please enter your address");
            inputValidation++;
        }

        if (contact_number.trim().length() <= 0) {
            request.setAttribute("contact_number_error", "Please enter your contact number");
            inputValidation++;
        } else {
            String regular_expression = "[\\d]{3}-{0,1}[\\d]{7,8}";
            if (!contact_number.matches(regular_expression)) {
                request.setAttribute("contact_number_error", "Please enter a valid phone number");
                inputValidation++;
            }
        }

        if (payment_method == null) {
            request.setAttribute("payment_method_error", "Please select a payment method");
            inputValidation++;
        }

        if (card_owner.trim().length() <= 0) {
            request.setAttribute("card_owner_error", "Please enter the name on card");
            inputValidation++;
        }

        if (card_number.trim().length() <= 0) {
            request.setAttribute("card_number_error", "Please enter the card number");
            inputValidation++;
        } else {
            String regeular_expression = "^5[1-5][0-9]{14}|^(222[1-9]|22[3-9]\\d|2[3-6]\\d{2}|27[0-1]\\d|2720)[0-9]{12}$";
            if (!card_number.matches(regeular_expression)) {
                request.setAttribute("card_number_error", "Please enter valid card number");
                inputValidation++;
            }
        }

        if (card_expiration.trim().length() <= 0) {
            request.setAttribute("card_expiration_error", "Please enter the card expiration");
            inputValidation++;
        } else {
            String regeular_expression = "^((0[1-9])|(1[0-2]))[\\/\\.\\-]*((0[8-9])|(2[1-9]))$";
            if (!card_expiration.matches(regeular_expression)) {
                request.setAttribute("card_expiration_error", "Please enter valid card expiration");
                inputValidation++;
            }
        }

        if (card_cvv.trim().length() <= 0) {
            request.setAttribute("card_cvv_error", "Please enter the card CVV");
            inputValidation++;
        } else {
            String regeular_expression = "^[0-9]{3,4}$";
            if (!card_cvv.matches(regeular_expression)) {
                request.setAttribute("card_number_error", "Please enter valid CVV");
                inputValidation++;
            }
        }
        
        PromotionCode promotionCode = null;
        if (promotion_code != null) {
            promotionCode = em.find(PromotionCode.class, promotion_code);
        }

        if (inputValidation > 0) {
            request.setAttribute("email_entered", email);
            request.setAttribute("receiver_name_entered", receiver_name);
            request.setAttribute("address_entered", address);
            request.setAttribute("contact_number_entered", contact_number);
            request.setAttribute("payment_method_entered", payment_method);
            request.setAttribute("card_owner_entered", card_owner);
            request.setAttribute("card_number_entered", card_number);
            request.setAttribute("card_expiration_entered", card_expiration);
            request.setAttribute("card_cvv_entered", card_cvv);
            request.setAttribute("promotion_code", promotionCode);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Payment/Payment.jsp");
            dispatcher.forward(request, response);
        } else {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            ArrayList<CartItem> cartItemList;
            if (customer.getId() == null) {
                cartItemList = (ArrayList<CartItem>) session.getAttribute("guest_cart");
            } else {
                cartItemList = (ArrayList<CartItem>) session.getAttribute(customer.getId() + "_cart");
            }
            Date todayDate = new Date();

            Query query = em.createNamedQuery("CustomerOrder.findAll");
            String customerOrderID = "HHOD" + 100000 + query.getResultList().size();
            CustomerOrder customerOrder = new CustomerOrder(customerOrderID, todayDate, receiver_name, email, address, contact_number);
            if (customer.getId() != null) {
                customerOrder.setCustomerId(customer);
            }

            ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
            for (int i = 0; i < cartItemList.size(); i++) {
                orderDetailList.add(new OrderDetail(cartItemList.get(i).getProduct().getId(), customerOrderID, cartItemList.get(i).getQuantity(), customerOrder, cartItemList.get(i).getProduct()));
            }
            customerOrder.setOrderDetailList(orderDetailList);

            customerOrder.setPromotionCode(promotionCode);

            double paymentAmount = customerOrder.getOrderTotal();

            Query query2 = em.createNamedQuery("Payment.findAll");
            String paymentID = "HHPAY" + 100000 + query2.getResultList().size();
            Payment payment = new Payment(paymentID, payment_method, paymentAmount, customerOrder);
            customerOrder.setPayment(payment);
            try {
                utx.begin();
                em.persist(customerOrder);
                utx.commit();

                for (int i = 0; i < cartItemList.size(); i++) {
                    entity.Product product = em.find(Product.class, cartItemList.get(i).getProduct().getId());
                    if (product != null) {
                        product.decreaseStockQuantity(cartItemList.get(i).getQuantity());
                        utx.begin();
                        em.merge(product);
                        utx.commit();
                    }
                }

                if (customer.getId() == null) {
                    session.removeAttribute("guest_cart");
                } else {
                    session.removeAttribute(customer.getId() + "_cart");
                }
            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<font color='red'>" + ex.getMessage() + "</font>");
                }
            }
            request.setAttribute("customer_order", customerOrder);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Payment/Receipt.jsp");
            dispatcher.forward(request, response);
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
