/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.OrderDetailJpaController;
import controller.OrdersJpaController;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Account;
import model.OrderDetail;
import model.Orders;

/**
 *
 * @author jatawatsafe
 */
public class HistoryDetailsServlet extends HttpServlet {
@PersistenceUnit(unitName = "JKTShopPU")
EntityManagerFactory emf;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("-------HistoryDetailsServlet-----");
        Account acc = (Account) session.getAttribute("account");
        String orderidString = request.getParameter("orderid");
        if(orderidString!=null){
            int orderid = Integer.valueOf(orderidString);
            OrdersJpaController oCtrl = new OrdersJpaController(utx, emf);
            Orders order = oCtrl.findOrders(orderid);
            List<OrderDetail> orderDetails = order.getOrderDetailList();
            request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("orderid", orderid);
            request.getServletContext().getRequestDispatcher("/HistoryDetails.jsp").forward(request, response);
        }else{
            response.sendRedirect("HistoryServlet");
        }
        List<Orders> history = acc.getOrdersList();
        request.setAttribute("history", history);
        
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
