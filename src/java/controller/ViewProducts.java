/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Category;
import java.io.IOException;
import entity.Product;
import entity.Subcategory;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zixua
 */
@WebServlet(name = "ViewProducts", urlPatterns = {"/ViewProducts"})
public class ViewProducts extends HttpServlet {

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

        // Get Query String value from URL defined
        String subcategory = request.getParameter("subcategory");
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        String order = request.getParameter("order");

        // Find product based on subcategory id and status
        Query query = em.createNativeQuery("SELECT * FROM PRODUCT WHERE SUBCATEGORY_ID ='"
                + subcategory + "' AND STATUS='Active' ORDER BY " + name + " " + order, Product.class);
        List<Product> prodList = query.getResultList();

        Query subcategoryQuery = em.createNamedQuery("Subcategory.findById").setParameter("id", subcategory);
        List<Subcategory> subcategoryTitle = subcategoryQuery.getResultList();

        Query categoryQuery = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                + category + "' ", Subcategory.class);
        List<Subcategory> subcategoryList = categoryQuery.getResultList();

        // Store attributes in HttpSession
        HttpSession session = request.getSession();
        session.setAttribute("prodList", prodList);
        session.setAttribute("subcategoryTitle", subcategoryTitle);
        session.setAttribute("subcategoryList", subcategoryList);

        // forward to productCatalog.jsp
        response.sendRedirect("Client/Product/ProductCatalog.jsp");
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
