/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.ShoeJpaController;
import controller.SizeSpecificJpaController;
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
import model.Shoe;
import model.SizeSpecific;

/**
 *
 * @author jatawatsafe
 */
public class AddItemServlet extends HttpServlet {

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
        if (cart == null) {
            System.out.println("------New Cart------");
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        String shoeId = request.getParameter("shoeId");
        String shoeSizeText = request.getParameter("shoeSize");
        if (shoeId != null && shoeSizeText != null) {
            int shoeSize = Integer.parseInt(shoeSizeText);
            ShoeJpaController sCtrl = new ShoeJpaController(utx, emf);
            SizeSpecificJpaController ssCtrl = new SizeSpecificJpaController(utx, emf);
            Shoe shoe = sCtrl.findShoe(shoeId);
            SizeSpecific ss = new SizeSpecific(shoeId, shoeSize);
            System.out.println("----------------------\nSizeSpecific:"+ss.getSizeSpecificPK().getSpecificShoe());
            cart.add(shoe, shoeSize);
        }
        response.sendRedirect("AboutProductServlet");
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
