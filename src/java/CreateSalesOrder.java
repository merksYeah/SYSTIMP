/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.cripisi.Factory.DAOFactory;
import com.cripisi.SalesOrder.SalesOrder;
import com.cripisi.SalesOrder.SalesOrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author deathman28
 */
public class CreateSalesOrder extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher rd = null;
           String[] Products = request.getParameterValues("checkedRows");
           String[] Quantity = request.getParameterValues("orderquantity");
           SalesOrder order = new SalesOrder();
           order.setCustomer_tin(Integer.parseInt(request.getParameter("customertin")));
           order.setDeliver_to(request.getParameter("address"));
           Date d = java.sql.Date.valueOf(request.getParameter("orderdate"));
           order.setOrder_date(d);
           DAOFactory what =  DAOFactory.getDAOFactory(1);
           SalesOrderDAO so = what.getSalesOrderDAO();
           int ordernumber = so.newSalesOrder(order);
           order.setOrder_id(ordernumber);
           order.setProducts(Products);
           order.setQuantity(Quantity);
           so.addProducts(order);
           if(request.getParameter("comments") != null){
               order.setComments(request.getParameter("comments"));
               so.updateSalesOrderComments(order);
           }
           String message = "CREATE ORDERS SUCCESSFUL";
           request.setAttribute("message",message);
           //rd = request.getRequestDispatcher("/ToSalesOrder");
           //rd.forward(request,response);
           
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CreateSalesOrder.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CreateSalesOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
