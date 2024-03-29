/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import entity.Product;
import entity.Subcategory;
import java.util.Collections;
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

/**
 *
 * @author zixua
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

    @PersistenceContext
    EntityManager em;

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
        String search = request.getParameter("search");

        try {
            Query query = em.createNativeQuery("SELECT * FROM PRODUCT WHERE UPPER(NAME) LIKE UPPER('%" + search + "%') OR UPPER(AUTHOR_NAME) LIKE UPPER('%"
                    + search + "%') OR UPPER(DESCRIPTION) LIKE ('%" + search + "%')", entity.Product.class);
            List<Product> productR = query.getResultList();

            request.setAttribute("product", productR);
            request.setAttribute("keyword", search);
            try {
                Product prod = productR.get(0);

                String catID = prod.getSubcategoryId().getCategoryId().getId();

                Query categoryQuery = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + catID + "' ", Subcategory.class);
                List<Subcategory> subcategoryList = categoryQuery.getResultList();
                request.setAttribute("subcategoryList", subcategoryList);
            } catch (Exception ex) {
                request.setAttribute("subcategoryList", Collections.<String>emptyList());
            }

            RequestDispatcher rd = request.getRequestDispatcher("Client/Search/Search.jsp");
            rd.forward(request, response);

        } catch (Exception ex) {
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
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
