/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.CartItem;
import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
@WebServlet(name = "ShoppingCart", urlPatterns = {"/ShoppingCart"})
public class ShoppingCart extends HttpServlet {
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
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
            if(action.equalsIgnoreCase("display")){
                try{
                    doGet_display(request, response);
                }catch(NumberFormatException ex){
                    request.setAttribute("cartItemOutofStockMessage", ex.getMessage());
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HobbitHall/Client/Order/ShoppingCart.jsp");
                    dispatcher.forward(request, response);
                }
            }else if(action.equalsIgnoreCase("add")){
                try{
                    doGet_Add(request, response);
                }catch(NumberFormatException ex){
                    request.setAttribute("invalid_quantity_error", ex.getMessage());
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Client/Product/ProductDescription.jsp");
                    dispatcher.forward(request, response);
                }
            }else if(action.equalsIgnoreCase("update") || action.equalsIgnoreCase("increase") || action.equalsIgnoreCase("decrease")){
                try{
                    doGet_updateQuantity(request, response);
                }catch(NumberFormatException ex){
                    response.sendRedirect("/HobbitHall/Client/Order/ShoppingCart.jsp");
                }
            }else if(action.equalsIgnoreCase("remove")){
                doGet_remove(request, response);
            }
    }
    
    protected void doGet_Add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NumberFormatException{
        String product_ID = request.getParameter("product_ID");
        if(request.getParameter("qtyBuy") == ""){
            String invalid_quantity_error = "Please select at least one quantity.";
            throw new NumberFormatException(invalid_quantity_error);
        }
        int quantity = Integer.valueOf(request.getParameter("qtyBuy"));
        
        Product product = em.find(Product.class, product_ID);
        ArrayList<CartItem> cartItemList;
        HttpSession session = request.getSession();
        Customer customer = (Customer)session.getAttribute("customer");
        CartItem cartItem = new CartItem(product, quantity);
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        }
        if(product.getStockQuantity() > 0){
            if(quantity <= 0){
                String invalid_quantity_error = "Please select at least one quantity.";
                throw new NumberFormatException(invalid_quantity_error);
            }
            
            if(cartItemList == null){
                cartItemList = new ArrayList<CartItem>();
                cartItemList.add(cartItem);
                if(customer.getId() == null){ 
                    session.setAttribute("guest" + "_cart", cartItemList); 
                }else{
                    session.setAttribute(customer.getId() + "_cart", cartItemList);
                }
            }else{
                boolean exist = false;
                for (int i = 0; i < cartItemList.size(); i++) {
                    if(cartItemList.get(i).getProduct().getId().equals(product_ID)){
                        if(cartItemList.get(i).getQuantity() +  quantity <= product.getStockQuantity()){
                            cartItemList.get(i).increaseQuantity(quantity);
                        }else if(cartItemList.get(i).getQuantity() == product.getStockQuantity()){  
                            String invalid_quantity_error = "All " + product.getName() + " is now in your cart";
                            throw new NumberFormatException(invalid_quantity_error);
                        }else{
                            int avalaibleQuantity = product.getStockQuantity() - cartItemList.get(i).getQuantity();
                            String invalid_quantity_error = "You can only add " + avalaibleQuantity + " more " + product.getName() + " into your cart";
                            throw new NumberFormatException(invalid_quantity_error);
                        }   
                        exist = true;
                    }
                }
                
                if(!exist){
                    cartItemList.add(cartItem);
                }
                 
                if(customer.getId() == null){ 
                    session.setAttribute("guest" + "_cart", cartItemList); 
                }else{
                    session.setAttribute(customer.getId() + "_cart", cartItemList);
                }
            }
        }
        response.sendRedirect("/HobbitHall/Client/Order/ShoppingCart.jsp");
    }
    
    protected void doGet_display(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        ArrayList<CartItem> cartItemList;
//        HttpSession session = request.getSession();
//        Customer customer = (Customer)session.getAttribute("customer");
//        if(customer.getId() == null){ 
//            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
//        }else{
//            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
//        }
//        
//        StringBuilder cartItemOutofStockMessage = new StringBuilder("");
//        for (int i = 0; i < cartItemList.size(); i++) {
//            Product product = em.find(Product.class, cartItemList.get(i).getProduct().getId());
//            if(product.getStockQuantity() == 0){
//                cartItemOutofStockMessage.append(product.getName() + " is now out of stock. Please remove it.\n");
//            }else if(cartItemList.get(i).getQuantity() > product.getStockQuantity()){
//                cartItemOutofStockMessage.append(product.getName() + "only left" + product.getStockQuantity() + ". Please reduce the quantity in your cart.\n");
//            }
//        }
//        
//        if(cartItemOutofStockMessage.toString().length() <= 0){
//            throw new NumberFormatException(cartItemOutofStockMessage.toString());
//        }
        response.sendRedirect("/HobbitHall/Client/Order/ShoppingCart.jsp");
    }
    
    protected void doGet_updateQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String product_ID = request.getParameter("product_ID");
        ArrayList<CartItem> cartItemList;
        HttpSession session = request.getSession();
        Customer customer = (Customer)session.getAttribute("customer");
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        }
        for (int i = 0; i < cartItemList.size(); i++) {   
            if(cartItemList.get(i).getProduct().getId().equals(product_ID)){
                Product product = em.find(Product.class, product_ID);
                if(action.equalsIgnoreCase("update")){
                    try{
                        int product_quantity = Integer.valueOf(request.getParameter("qtyBuy"));
                        if(product_quantity < product.getStockQuantity()){
                            cartItemList.get(i).setQuantity(product_quantity);    
                        }
                    }catch(NumberFormatException ex){
                        throw ex;
                    }
                }else if(action.equalsIgnoreCase("increase")){   
                    if(cartItemList.get(i).getQuantity() < product.getStockQuantity()){
                        cartItemList.get(i).increaseQuantity(1);
                    }
                }else{
                    cartItemList.get(i).decreaseQuantity();
                    if(cartItemList.get(i).getQuantity() == 0){
                        cartItemList.remove(i);
                    }
                }
            }
        }
        if(customer.getId() == null){ 
            session.setAttribute("guest" + "_cart", cartItemList); 
        }else{
            session.setAttribute(customer.getId() + "_cart", cartItemList);
        }
        response.sendRedirect("/HobbitHall/Client/Order/ShoppingCart.jsp");
    }
    
    protected void doGet_remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_ID = request.getParameter("product_ID");
        HttpSession session = request.getSession();
        Customer customer = (Customer)session.getAttribute("customer");
        ArrayList<CartItem> cartItemList;
        if(customer.getId() == null){ 
            cartItemList = (ArrayList<CartItem>)session.getAttribute("guest" + "_cart"); 
        }else{
            cartItemList = (ArrayList<CartItem>)session.getAttribute(customer.getId() + "_cart"); 
        }
        for (int i = 0; i < cartItemList.size(); i++) {
            if(cartItemList.get(i).getProduct().getId().equals(product_ID)){
                cartItemList.remove(i);
            }
        }
        if(customer.getId() == null){ 
            session.setAttribute("guest" + "_cart", cartItemList); 
        }else{
            session.setAttribute(customer.getId() + "_cart", cartItemList);
        }
        response.sendRedirect("/HobbitHall/Client/Order/ShoppingCart.jsp");
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
