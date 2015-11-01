/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClientHomePageServlets;

import com.cripisi.Customer.Customer;
import com.cripisi.Customer.CustomerDAO;
import com.cripisi.Employee.Employee;
import com.cripisi.Employee.EmployeeDAO;
import com.cripisi.Factory.DAOFactory;
import com.cripisi.SalesOrder.SalesOrder;
import com.cripisi.SalesOrder.SalesOrderDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class LoadDeliveredOrders extends HttpServlet {

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
           DAOFactory db = DAOFactory.getDAOFactory(1);
           SalesOrderDAO salesDB = db.getSalesOrderDAO();
            HttpSession session = request.getSession();
            HashMap<String,Integer> rights = (HashMap<String,Integer>) session.getAttribute("login");
            ArrayList<SalesOrder> orders = new ArrayList<>();
            SalesOrder so = new SalesOrder();
            so.setStatusCode(request.getParameter("orderstatus"));
            if(rights.get("role") == 1){
                Customer cust = new Customer();
                cust.setUserId(rights.get("userId"));
                CustomerDAO customerDB = db.getCustomerDAO();
                cust = customerDB.getCustomerOrderDetails(cust);
                orders = salesDB.getDeliveredOrders(so,cust);
            }
            else if(rights.get("role") == 3){
                Employee emp = new Employee();
                emp.setUserId(rights.get("userId"));
                EmployeeDAO empDB = db.getEmployeeDAO();
                emp = empDB.getEmployeeById(emp);
                orders = salesDB.getDeliveredOrdersSalesAgent(so,emp);
            }
            
           //String json = null;
            String json =new Gson().toJson(orders);  
            System.out.println(json);
            response.getWriter().write(json);
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
