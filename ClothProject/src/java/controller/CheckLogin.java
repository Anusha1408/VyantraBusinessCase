package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.CartInfoDAO;
import model.dao.HibernateUtil;

import model.dao.LoginInfoDAO;
import model.to.CartInfo;
import model.to.LoginInfo;
import operational.Checks;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/checkLogin")
public class CheckLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean notApproved = true;
        if (username != null && password != null) {
            username = username.trim();
            String message = "";
            if (Checks.isEmpty(password) || Checks.isEmpty(username)) {
                message = "Please fill all boxes";
            } else {
                LoginInfo data = LoginInfoDAO.getRecord(username);
                if (data != null && data.getPassword().equals(password)) {
                    if (data.getRoleName().equals("admin")) {
                        notApproved = false;
                        HttpSession session = request.getSession();
                        session.setAttribute("auname", username);
                        response.sendRedirect("admin/index.jsp");
                    } else if (data.getRoleName().equals("user")) {
                        notApproved = false;
                        HttpSession session = request.getSession();
                        session.setAttribute("uuname", username);
                        session.setAttribute("lastlogin", data.getLastLogin());
                        data.setLastLogin(new Timestamp(System.currentTimeMillis()));
                        HibernateUtil.updateRecord(data);
                        CartInfo cart = CartInfoDAO.getUserCart(username);
                        if (cart != null) {
                            session.setAttribute("cartid", cart.getCartId());
                        }
                        if (session.getAttribute("productid") != null) {
                            response.sendRedirect("insertToCart?productid=" + session.getAttribute("productid").toString());
                        } else {
                            response.sendRedirect("index1.jsp");
                        }
                    } else {
                        message = "You Don't have right to access";
                    }
                } else {
                    message = "Invalid username/password";
                }
            }
            request.setAttribute("message", message);
        }
        if (notApproved) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

}
