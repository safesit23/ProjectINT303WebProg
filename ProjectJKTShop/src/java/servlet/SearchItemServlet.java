/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.ShoeJpaController;
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
import model.Shoe;

/**
 *
 * @author jatawatsafe
 */
public class SearchItemServlet extends HttpServlet {

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
        String brand = request.getParameter("brand");
        String gender = request.getParameter("gender");
        String shoename = request.getParameter("shoename");
        String pricetext = request.getParameter("price");
        String color = request.getParameter("color");
        ShoeJpaController shoeCtrl = new ShoeJpaController(utx, emf);
        List<Shoe> shoeList;
        if (brand != null) {
            System.out.println("---------------------------\nList by Brand:"+brand);
            shoeList = shoeCtrl.findShoeByBrand(brand);
        } else if (gender != null) {
            System.out.println("---------------------------\nList by Gender:"+gender);
            shoeList = shoeCtrl.findShoeByGender(gender);
        } else if (shoename!=null){
            System.out.println("---------------------------\nList by shoename:"+shoename);
            shoeList = shoeCtrl.findByShoename(shoename);
        } else if (pricetext!=null){
            String[] p = pricetext.split(",");
            int priceMin = Integer.valueOf(p[0]);
            int priceMax = Integer.valueOf(p[1]);
            System.out.println("---------------------------\nList by Price:"+priceMin+" to "+priceMax);
            shoeList = shoeCtrl.findShoeByPrice(priceMin, priceMax);
        } else if (color!=null){
            System.out.println("---------------------------\nList by color:"+color);
            shoeList = shoeCtrl.findShoeByColor(color);
        } else {
            shoeList = shoeCtrl.findShoeEntities();
        }
        int numOfShoeList =shoeList.size();
        session.setAttribute("numOfShoeList", numOfShoeList);
        session.setAttribute("shoeList", shoeList);
        response.sendRedirect("AboutProduct.jsp");
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
