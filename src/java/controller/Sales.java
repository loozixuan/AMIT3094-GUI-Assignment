/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CustomerOrder;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Collections;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author zixuan
 */
@WebServlet(name = "Sales", urlPatterns = {"/Sales"})
public class Sales extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("search")) {
            doPost(request, response);
        } else if (action.equalsIgnoreCase("view")) {
            doView(request, response);
        } else if (action.equalsIgnoreCase("check")) {
            doCheck(request, response);
        }
    }

    protected void doView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Today Date
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
            LocalDate localDate = LocalDate.now();

            // Day Of Week 
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            Date dt1 = format1.parse(String.valueOf(localDate));
            DateFormat format2 = new SimpleDateFormat("EEEE");
            String dayOfWeek = format2.format(dt1);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date salesdate = formatter.parse(formatter.format(new Date()));
            Query query = em.createNamedQuery("CustomerOrder.findByDate").setParameter("date", salesdate);
            List<CustomerOrder> customerOrderList = query.getResultList();
            request.setAttribute("customerOrderList", customerOrderList);
            request.setAttribute("todayDate", dtf.format(localDate));
            request.setAttribute("dayOfWeek", dayOfWeek);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/SalesRecord/ViewSalesTable.jsp");
            rd.forward(request, response);

        } catch (Exception ex) {
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
            }
        }
//            try (PrintWriter out = response.getWriter()) {
//                out.print(customerOrderList.get(0).getName());
//            }
    }

    protected void doCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderid = request.getParameter("orderid");
        try {
            try {
                Query query = em.createNamedQuery("OrderDetail.findByOrderId").setParameter("orderId", orderid);
                List<OrderDetail> orderDetail = query.getResultList();
                request.setAttribute("orderDetail", orderDetail);
            } catch (Exception ex) {
                request.setAttribute("orderDetail", Collections.<String>emptyList());
            }
            RequestDispatcher rd = request.getRequestDispatcher("/Admin/SalesRecord/ViewSalesRecord.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("salesdate");
        try {
            // Specific Date and Day
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            Date dt1 = format1.parse(date);
            DateFormat format2 = new SimpleDateFormat("EEEE");
            String finalDay = format2.format(dt1);
            Date searchdate = formatter.parse(date);

            Query query = em.createNamedQuery("CustomerOrder.findByDate").setParameter("date", searchdate);
            List<CustomerOrder> searchOrder = query.getResultList();

            request.setAttribute("searchOrder", searchOrder);
            request.setAttribute("date", date);
            request.setAttribute("day", finalDay);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/SalesRecord/SearchSales.jsp");
            rd.forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("date", date);
            request.setAttribute("searchOrder", Collections.<String>emptyList());
            RequestDispatcher rd = request.getRequestDispatcher("/Admin/SalesRecord/SearchSales.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
