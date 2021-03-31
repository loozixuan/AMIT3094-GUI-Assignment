/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Product;
import entity.Subcategory;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Chrisann Lee
 */
@WebServlet(name = "ProcessProduct", urlPatterns = {"/ProcessProduct"})
public class ProcessProduct extends HttpServlet {

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
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//    }
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
                Query query = em.createNamedQuery("Product.findByStatus");
                query.setParameter("status", "Active");
                List<entity.Product> productList = query.getResultList();

                Query querySubcategory = em.createNamedQuery("Subcategory.findAll");
                List<entity.Subcategory> subCategoryList = querySubcategory.getResultList();

                HttpSession sessionSub = request.getSession();
                sessionSub.setAttribute("subCategoryList", subCategoryList);

                request.setAttribute("productList", productList);

                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/Product.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                response.sendRedirect("Admin/Product/Product.jsp");
            }

        } else if (action.equals("insertPage")) {
            String lang = request.getParameter("lang");

            try {
                Query query = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + lang + "' ", Subcategory.class);
                List<entity.Subcategory> subCategoryList = query.getResultList();
                HttpSession session = request.getSession();
                session.setAttribute("subCategoryList", subCategoryList);

                response.sendRedirect("/HobbitHall/Admin/Product/InsertProduct.jsp");

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }

            }

        } else if (action.equals("viewSingleProd")) {
            String prodID = request.getParameter("prodID");
            try {
                Query query = em.createNamedQuery("Product.findById");
                query.setParameter("id", prodID);
                List<entity.Product> productList = query.getResultList();
                entity.Product product = productList.get(0);
                request.setAttribute("product", product);
                request.setAttribute("action", "View");
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/ViewOrDeleteProduct.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }

            }
        } else if (action.equals("delete")) {
            String prodID = request.getParameter("prodID");
            try {
                Query query = em.createNamedQuery("Product.findById");
                query.setParameter("id", prodID);
                List<entity.Product> productList = query.getResultList();

                entity.Product product = productList.get(0);
                request.setAttribute("product", product);
                request.setAttribute("action", "Delete");
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/ViewOrDeleteProduct.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }

            }

        } else if (action.equals("edit")) {
            String prodID = request.getParameter("prodID");
            try {
                Query query = em.createNamedQuery("Product.findById");
                query.setParameter("id", prodID);
                List<entity.Product> productList = query.getResultList();

                entity.Product product = productList.get(0);
                String categoryId = product.getSubcategoryId().getCategoryId().getId();

                Query querySubcategory = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                        + categoryId + "' ", Subcategory.class);
                List<entity.Subcategory> subCategoryList = querySubcategory.getResultList();
                request.setAttribute("subCategoryList", subCategoryList);
                request.setAttribute("product", product);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/EditProduct.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }

            }

        } else if (action.equals("viewSubcategoryProd")) {
            String subcategoryId = request.getParameter("subcategory");

            try {
                Query query = em.createNativeQuery("SELECT * FROM PRODUCT WHERE SUBCATEGORY_ID ='"
                        + subcategoryId + "' AND STATUS='Active'", Product.class);
                List<entity.Product> productList = query.getResultList();
                request.setAttribute("productList", productList);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/Product.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("deleteSingleProd")) {
            String prodID = request.getParameter("pro_id");

            try {
                Query query = em.createNamedQuery("Product.findById");
                query.setParameter("id", prodID);

                List<entity.Product> productList = query.getResultList();
                entity.Product product = productList.get(0);
                product.setStatus("Inactive");
                utx.begin();
                em.merge(product);
                utx.commit();

                request.setAttribute("product", product);
                request.setAttribute("action", "Delete");
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/ViewOrDeleteProduct.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }

            }

        } else if (action.equalsIgnoreCase("search")) {
            String search = request.getParameter("search");

            try {
                Query query = em.createNativeQuery("SELECT * FROM PRODUCT WHERE ID LIKE'"
                        + search + "%' OR NAME LIKE'" + search + "%' OR AUTHOR_NAME LIKE'" + search + "%'", Product.class);
                List<entity.Product> productList = query.getResultList();
                request.setAttribute("productList", productList);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/Product.jsp");
                rd.forward(request, response);

            } catch (Exception ex) {

                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
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
