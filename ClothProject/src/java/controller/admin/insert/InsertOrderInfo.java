package controller.admin.insert;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import operational.Checks;

import model.dao.CartInfoDAO;
import model.dao.CartItemDAO;
import model.dao.HibernateUtil;
import model.dao.LoginInfoDAO;
import model.dao.OrderDetailsDAO;
import model.dao.OrderInfoDAO;
import model.dao.ProductInfoDAO;
import model.to.CartInfo;
import model.to.CartItem;
import model.to.LoginInfo;
import model.to.OrderDetails;
import model.to.OrderInfo;

/**
 * Servlet implementation class InsertOrderInfo
 */
@WebServlet("/insertOrderInfo")
public class InsertOrderInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("address") != null && session.getAttribute("payment") != null) {
            String address = session.getAttribute("address").toString();
            String payment = session.getAttribute("payment").toString();
            session.removeAttribute("address");
            if (!Checks.isEmpty(address)) {
                int cartid = Integer.parseInt(session.getAttribute("cartid")
                        .toString());
                String username = session.getAttribute("uuname").toString();
                LoginInfo user = LoginInfoDAO.getRecord(username);
                CartInfo cart = CartInfoDAO.getRecord(cartid);
                if (user != null && cart != null) {
                    OrderInfo oit = new OrderInfo();
                    oit.setUser(user);
                    oit.setCart(cart);
                    oit.setShippingAddress(address);
                    oit.setOrderDate(new Timestamp(System.currentTimeMillis()));
                    oit.setOrderStatus("Processing...");                    
                    oit.setOrderId(System.currentTimeMillis());
                    oit.setPayment(payment);
                    if (HibernateUtil.insertRecord(oit)) {
                        cart.setIsOrder(1);
                        HibernateUtil.updateRecord(cart);
                        List<CartItem> cartdata = CartItemDAO.getCartItemsAccordingToCartId(cartid);
                        if (cartdata != null) {
                            for (CartItem cit : cartdata) {
                                OrderDetails odt = new OrderDetails();
                                odt.setOrder(oit);
                                odt.setPrice(cit.getPrice());
                                odt.setQuantity(cit.getQuantity());
                                odt.setProduct(cit.getProduct());
                                HibernateUtil.insertRecord(odt);
                            }
                        }
                        session.removeAttribute("cartid");
                        response.sendRedirect("vieworder.jsp");
                    } else {
                        request.setAttribute("message", "Order is not Processed");
                        RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Please Login For Process the Order");
                    RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
                    rd.forward(request, response);
                }

            } else {
                request.setAttribute("message", "Please Enter Some Address");
                RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
                rd.forward(request, response);
            }
        }

    }

}
