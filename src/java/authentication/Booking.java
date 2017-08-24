/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import com.dbfunction.BookingConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "Booking", urlPatterns = {"/Booking"})
public class Booking extends HttpServlet {

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
         String check_in = request.getParameter("check_in");
        String occupants = request.getParameter("occupants");
        String favourite_meal = request.getParameter("favourite_meal");
        String check_out = request.getParameter("check_out");
        String air_condition = request.getParameter("air_condition");
        String favourite_drink = request.getParameter("favourite_drink");
        try {
            BookingConnection book = new BookingConnection();
            Connection conn = book.getBookingConnection();
            Statement stm = conn.createStatement();

            int i = stm.executeUpdate("insert into bookingpage (check_in, occupants, favourite_meal, check_out, air_condition, favourite_drink)"
                    + "values('" + check_in + "', '" + occupants
                    + "','" + favourite_meal + "','" + check_out + "','" + air_condition + "',"
                    + "'" + favourite_drink + "')");
            if (i < 0) {
                //response.sendRedirect("Welcome.jsp");
                //System.out.println("Login Successful <a href='Welcome.jsp'>Go to Home Page</a>");
                response.sendRedirect("./Success.jsp");
            } else {
                response.sendRedirect("./BookingPage.html");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
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
