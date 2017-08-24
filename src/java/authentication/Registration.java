/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import com.dbfunction.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Registration extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
      String user_name = request.getParameter("user_name");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String user_email = request.getParameter("user_email");
        String dob = request.getParameter("dob");
        String state = request.getParameter("state");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
   

        try {
            DbConnection db = new DbConnection();
            Connection conn = db.getDBConnection();
            Statement stm = conn.createStatement();
            ResultSet rs = null;

            int i = stm.executeUpdate("insert into register (user_name, gender, phone, user_email, dob, state, address,country, password)  "
                    + "values('" + user_name + "', '" + gender
                    + "','" + phone + "','" + user_email + "','" + dob + "',"
                    + "'" + state + "', '" + address + "','"+ country +"','" + password + "')");
            stm.executeQuery(user_email);
            stm.executeQuery(password);
       
            
           
            if (i < 0) {
                //response.sendRedirect("Welcome.jsp");
                //System.out.println("Login Successful <a href='Welcome.jsp'>Go to Home Page</a>");
                response.sendRedirect("../Welcome.jsp");
            }else{
                response.sendRedirect("../register.jsp");
            }
        
        } catch (SQLException | ClassNotFoundException ex){
            ex.printStackTrace();
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
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
