/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.cripisi.Factory.DAOFactory;
import com.cripisi.User.User;
import com.cripisi.User.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author deathman28
 */
public class Login extends HttpServlet {

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
              RequestDispatcher rd = null;
                User one = new User();
               one.setUsername(request.getParameter("username"));
               one.setPassword(request.getParameter("password"));
               DAOFactory what =  DAOFactory.getDAOFactory(1);
               UserDAO db = what.getUserDAO();
               HashMap<String,Integer> rights = db.login(one);
               if(rights != null)
               {
                   HttpSession session = request.getSession();
                   session.setAttribute("login", rights);
                   if(rights.get("role") == 1){
                    rd = request.getRequestDispatcher("ClientHomePage.jsp");  
                    rd.forward(request,response);
                   }
                   else if(rights.get("role") == 3){
                       rd = request.getRequestDispatcher("SalesAgentHomePage.jsp");
                       rd.forward(request, response);
                   }
                   else{
                        rd = request.getRequestDispatcher("Homepage.jsp");  
                        rd.forward(request,response);
                   }
               
               }
               else
               {
                   ServletContext context= getServletContext();
                   rd= context.getRequestDispatcher("/index.jsp");
                   rd.forward(request, response);
               }
               
               
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
    }// </editor-fold
}
