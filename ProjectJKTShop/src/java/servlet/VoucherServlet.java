/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.VoucherJpaController;
import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Cart;
import model.Voucher;

/**
 *
 * @author jatawatsafe
 */
public class VoucherServlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        String voucherId = request.getParameter("voucherId");
        if(voucherId!=null){
            VoucherJpaController vCtrl = new VoucherJpaController(utx, emf);
            Voucher voucher = vCtrl.findVoucher(voucherId);
            if(voucher!=null){
                System.out.println("-----------------------------------\nvoucher not null");
                if(voucher.getValidate().equals("true")){
                    System.out.println("------------------------\n Validate");
                    if(cart.getTotalPrice()>=voucher.getMinspend()){
                        System.out.println("----------------------------\ntotal price");
                        int discount = voucher.getVouchervalue();
                        cart.setTotalNetPrice(discount);
                        session.setAttribute("vouchermessage", null);
                        session.setAttribute("voucher", voucher);
                    }else{
                        session.setAttribute("vouchermessage", "ต้องซื้อขึ้นต่ำ"+voucher.getMinspend()+"บาท");
                    }
                }else{
                    session.setAttribute("vouchermessage", "คูปองหมดอายุ");
                }
            }else{
                session.setAttribute("vouchermessage", "ไม่ค้นพบ Voucher นี้ในระบบ");
            }
        }
        response.sendRedirect("Checkout.jsp");
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
