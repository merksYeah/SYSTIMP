/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.cripisi.Employee.Employee;
import com.cripisi.Employee.EmployeeDAO;
import com.cripisi.Factory.DAOFactory;
import com.cripisi.PurchaseOrder.PurchaseOrder;
import com.cripisi.PurchaseOrder.PurchaseOrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author deathman28
 */
public class CreateReqSlip extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                
               HttpSession session = request.getSession();
               HashMap<String,Integer> rights = (HashMap<String,Integer>)session.getAttribute("login");
               Employee emp = new Employee();
               emp.setUserId(rights.get("userId"));
               DAOFactory db =  DAOFactory.getDAOFactory(1);
               EmployeeDAO empDB = db.getEmployeeDAO();
               emp = empDB.getEmployeeById(emp);
              
           String[] Products = request.getParameterValues("checkedRows");
           String[] Quantity = request.getParameterValues("orderquantity");
           PurchaseOrder order = new  PurchaseOrder();
           Date d = java.sql.Date.valueOf(request.getParameter("orderdate"));
           order.setOrder_date(d);
           order.setEmployeeID(emp.getEmployeeId());
            order.setStatus("P");
            PurchaseOrderDAO poDB = db.getPurchaseOrderDAO();
           int ordernumber = poDB.addPurchaseOrder(order);
           order.setPurchaseOrderID(ordernumber);
           order.setProducts(Products);
           order.setQuantity(Quantity);
           poDB.addProducts(order);
           response.sendRedirect("ToReqSlip");
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
