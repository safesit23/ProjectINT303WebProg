/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AccountJpaController;
import controller.OrderDetailJpaController;
import controller.OrdersJpaController;
import controller.ShoeJpaController;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
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
import model.Cart;
import model.CartDetail;
import model.OrderDetail;
import model.OrderDetailPK;
import model.Orders;
import model.Shoe;

/**
 *
 * @author jatawatsafe
 */
public class PaymentServlet extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");
        String addr = request.getParameter("TypeOfAddr");
        System.out.println("--------addr : "+addr);
        if (addr != null) {
            String address = getOrderAddress(request);
            Account acc = (Account) session.getAttribute("account");
            Cart cart = (Cart) session.getAttribute("cart");
            Orders orders = new Orders(new Date(),address ,7,cart.getTotalNetPrice(),acc);
            OrdersJpaController oCtrl = new OrdersJpaController(utx, emf);
            OrderDetailJpaController odCtrl = new OrderDetailJpaController(utx, emf);
            AccountJpaController aCtrl = new AccountJpaController(utx, emf);
            ShoeJpaController sCtrl = new ShoeJpaController(utx, emf);
            try {
                oCtrl.create(orders);
                System.out.println("<<<<<<Create Order Finish>>>>>>>>");
                List<CartDetail> details = cart.getCartDetails();
                int orderid = oCtrl.findOrdersEntities().get(oCtrl.findOrdersEntities().size()-1).getOrderid();
                System.out.println("Order ID is "+orderid);
                Orders o = oCtrl.findOrders(orderid);
                for (CartDetail detail : details) {
                    Shoe shoe = sCtrl.findShoe(detail.getShoe().getShoeid());
                    int shoesize = detail.getShoeSize();
                    int quantity = detail.getQuantity();
                    double price = detail.getTotalPrice();
                    OrderDetail orderDetail = new OrderDetail(o, shoe, quantity, BigDecimal.valueOf(price),shoesize);
                    System.out.print("\n---------Order Detail:"+orderDetail.toString()+"\n");
                    odCtrl.create(orderDetail);
                    System.out.println("<--------ADD one Detail Success");
                }
                System.out.println("<<<<<<<<ALL Order Detail Finish>>>>>>>>>>");
                session.removeAttribute("cart");
                String shipDate = o.getShippeddate().getDate()+"/"+o.getShippeddate().getMonth()+"/"+(o.getShippeddate().getYear()+1900);
                request.setAttribute("message", "การซื้อสินค้าเสร็จสมบูรณ์ สินค้าจะถูกจัดส่งเมื่อ "+shipDate);
            } catch (Exception ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("message", "การสั่งซื้อไม่สำเร็จกรุณาลองใหม่อีกครั้ง");
            }
            request.getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        } else {
            request.getServletContext().getRequestDispatcher("/Payment.jsp").forward(request, response);
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

    public static String getOrderAddress(HttpServletRequest request){
        HttpSession session = request.getSession();
        String addr = request.getParameter("TypeOfAddr");
        String address;
        if(addr.equals("MyAddress")){
            Account acc = (Account) session.getAttribute("account");
            address=acc.getProvince()+", "+acc.getCountry()+" "+acc.getPostalcode();
        }else{
            String province = request.getParameter("province");
            String country = request.getParameter("country");
            String postalCode = request.getParameter("postalCode");
            address=province+", "+country+" "+postalCode;
        }
        return address;
    }
}
