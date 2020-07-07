package controller.admin.insert;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CartInfoDAO;
import model.dao.CartItemDAO;
import model.dao.HibernateUtil;
import model.dao.LoginInfoDAO;
import model.dao.ProductInfoDAO;
import model.to.CartInfo;
import model.to.CartItem;
import model.to.LoginInfo;
import model.to.ProductInfo;

/**
 * Servlet implementation class InsertToCart
 */
@WebServlet("/insertToCart")
public class InsertToCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getParameter("productid") != null) {
            String message = "";
            if (session.getAttribute("uuname") != null) {
                if (session.getAttribute("cartid") != null) {
                    System.out.println(" YES IT IS THERE ");
                    int cartid = Integer.parseInt(session.getAttribute("cartid").toString());
                    String pid = request.getParameter("productid");
                    int productid = Integer.parseInt(pid);
                    CartItem item = CartItemDAO.getCartItemAccordingToCartIdandProductId(cartid, productid);
                    if (item != null) {
                        item.setQuantity(item.getQuantity() + 1);
                        if (HibernateUtil.updateRecord(item)) {
                            message = "Item is added in Cart";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        item = new CartItem();
                        item.setCart(CartInfoDAO.getRecord(cartid));
                        ProductInfo product = ProductInfoDAO.getRecord(productid);
                        item.setProduct(product);
                        item.setQuantity(1);
                        item.setPrice(product.getPrice());
                        if (HibernateUtil.insertRecord(item)) {
                            message = "Item is added in Cart";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    }
                } else {
                    String username = session.getAttribute("uuname").toString();
                    CartInfo cart = new CartInfo();
                    cart.setCartDate(new Timestamp(System.currentTimeMillis()));
                    cart.setIsOrder(0);
                    cart.setUserName(username);
                    if (HibernateUtil.insertRecord(cart)) {
                        session.setAttribute("cartid", cart.getCartId());
                        String pid = request.getParameter("productid");
                        int productid = Integer.parseInt(pid);
                        ProductInfo product = ProductInfoDAO.getRecord(productid);
                        CartItem item = new CartItem();
                        item.setCart(cart);
                        item.setProduct(product);
                        item.setQuantity(1);
                        item.setPrice(product.getPrice());
                        if (HibernateUtil.insertRecord(item)) {
                            message = "Given Product is Added in Cart";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }

                }
                session.setAttribute("message", message);
                response.sendRedirect("index1.jsp");
            } else {
                session.setAttribute("productid", request.getParameter("productid"));
                response.sendRedirect("login.jsp");
            }
        } else {
            response.sendRedirect("index1.jsp");
        }
    }

}
