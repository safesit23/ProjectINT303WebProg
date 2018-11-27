/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AccountJpaController;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Account;

/**
 *
 * @author jatawatsafe
 */
public class RegisterServlet extends HttpServlet {

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
        if (checkParameter(request)) {
            String username = request.getParameter("username");
            AccountJpaController aCtrl = new AccountJpaController(utx, emf);
            Account checkAcc = aCtrl.findAccountByUsername(username);
            if (checkAcc == null) {
                Account account = getRegisterAccount(request);
                try {
                    aCtrl.create(account);
                    String link = "ActivateServlet?activate="+account.getActivatekey();
                    request.setAttribute("activatekey", link);
                    getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
                    return;
                } catch (Exception ex) {
                    Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("messageRegister", "Not Success");
            } else {
                request.setAttribute("messageRegister", "This email has already register");
            }
        }
        getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);

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

    public boolean checkParameter(HttpServletRequest request) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String nickname = request.getParameter("nickname");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String dobText = request.getParameter("dob");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        if (firstName != null && lastName != null && nickname != null && sex != null && phone != null &&dobText!= null) {
            if (username!=null && password!=null && confirmPassword!=null) {
                return true;
            }
        }
        return false;
    }

    public Account getRegisterAccount(HttpServletRequest request) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String nickname = request.getParameter("nickname");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cryptPass = cryptWithMD5(password);
        String dobText = request.getParameter("dob");
        Date dob = Date.valueOf(dobText);
        String address = request.getParameter("address");
        String province = request.getParameter("province");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String activatekey = cryptWithMD5(username);
        Account account = new Account(username, cryptPass, firstName, lastName, nickname, sex, dob ,phone, address, province, postalCode, country, activatekey);
        return account;
    }

    public static String cryptWithMD5(String pass) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passBytes = pass.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
