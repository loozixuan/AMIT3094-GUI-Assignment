/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Subcategory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
import javax.transaction.UserTransaction;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Chrisann Lee
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final long serialVersionUID = 1;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String prod_id = null;
        String name = null;
        String author = null;
        String description = null;
        String price = null;
        String subCategory = null;
        String qty = null;
        String category = null;

        String file_name = null;
        String file_name2 = "";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List< FileItem> fields = upload.parseRequest(request);
            Iterator< FileItem> it = fields.iterator();
            if (!it.hasNext()) {
                return;
            }

            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                    if (file_name == null) {
                        if (fileItem.getFieldName().equals("pro_id")) {
                            prod_id = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("pro_name")) {
                            name = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("author")) {
                            author = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("description")) {
                            description = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("price")) {
                            price = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("subCategory")) {
                            subCategory = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("quantity")) {
                            qty = fileItem.getString();
                        }
                        if (fileItem.getFieldName().equals("category")) {
                            category = fileItem.getString();
                        }

                    }

                } else {

                    if (fileItem.getSize() > 0) {

                        //    fileItem.write(new File("E:\\uploaded_files\\" + fileItem.getName()));
                        file_name2 = fileItem.getName();
                        fileItem.write(new File("C:\\Users\\Chrisann Lee\\Downloads\\HobbitHall\\web\\Client\\Share\\images\\book\\" + file_name2));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {

            Query querySubcategory = em.createNamedQuery("Subcategory.findById");
            querySubcategory.setParameter("id", subCategory);
            Subcategory subcategoryDetails = (Subcategory) querySubcategory.getSingleResult();
            Query query = em.createNamedQuery("Product.findById");
            query.setParameter("id", prod_id);

            List<entity.Product> productList = query.getResultList();

            if (!productList.isEmpty()) {
                entity.Product product = productList.get(0);

                product.setId(prod_id);
                product.setAuthorName(author);
                product.setName(name);
                product.setImage(file_name2);
                product.setPrice(Double.parseDouble(price));
                product.setStockQuantity(Integer.parseInt(qty));
                product.setSubcategoryId(subcategoryDetails);
                product.setDescription(description);
                product.setStatus("Active");

                utx.begin();
                em.merge(product);
                utx.commit();

                request.setAttribute("product", product);
                String message = "Product update successfully";
                request.setAttribute("successMessage", message);
                request.setAttribute("action", "View");
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/ViewOrDeleteProduct.jsp");
                rd.forward(request, response);
            }
        } catch (Exception ex) {
            String message = "Facing some error to update a product";
            request.setAttribute("errorMessage", message);
            Query query = em.createNamedQuery("Product.findById");
            query.setParameter("id", prod_id);

            List<entity.Product> productList = query.getResultList();
            entity.Product product = productList.get(0);
            String categoryId = product.getSubcategoryId().getCategoryId().getId();

            Query querySub = em.createNativeQuery("SELECT * FROM SUBCATEGORY WHERE CATEGORY_ID ='"
                    + categoryId + "' ", Subcategory.class);
            List<entity.Subcategory> subCategoryList = querySub.getResultList();
            request.setAttribute("subCategoryList", subCategoryList);
            request.setAttribute("product", product);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Product/EditProduct.jsp");
            rd.include(request, response);

        }
    }
}
