/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AccountJpaController;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
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

/**
 *
 * @author jatawatsafe
 */
public class AccountServlet extends HttpServlet {
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
        String editAccount = request.getParameter("editAccount");
        String editData = request.getParameter("editData");
        AccountJpaController aCtrl = new AccountJpaController(utx, emf);
        if(editAccount!=null){
            System.out.println("-------Edit Account");
            request.setAttribute("editAccount", "true");
            request.getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
            return;
        }else if(editData !=null){
            System.out.println("-----Edit Data");
            Account accSession = (Account) session.getAttribute("account");
            Account account = aCtrl.findAccount(accSession.getAccountid());
            if(account !=null){
                System.out.println("-----account from DB");
                String address = request.getParameter("address");
                String province = request.getParameter("province");
                String postalCode = request.getParameter("postalCode");
                String country = request.getParameter("country");
                account.editAccount(address, province, postalCode, country);
                try {
                    aCtrl.edit(account);
                    session.setAttribute("account", account);
                    System.out.println("-----edit profile success");
                    response.sendRedirect("AccountServlet");
                    return;
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("-----edit profile not success");
            }
            request.getServletContext().getRequestDispatcher("/Account.jsp");
        }else{
            response.sendRedirect("Account.jsp");
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
