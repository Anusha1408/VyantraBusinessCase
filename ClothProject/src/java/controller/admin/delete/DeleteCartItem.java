package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CartItemDAO;
import model.dao.HibernateUtil;
import model.to.CartItem;
import operational.Checks;

/**
 * Servlet implementation class DeleteCartItem
 */
@WebServlet("/deleteCartItem")
public class DeleteCartItem extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("itemid") != null) {
            String itemid_value = request.getParameter("itemid");
            if (Checks.isNumeric(itemid_value)) {
                int itemid = Integer.parseInt(itemid_value);
                CartItem item = CartItemDAO.getRecord(itemid);
                if (item != null && HibernateUtil.deleteRecord(item)) {
                    request.setAttribute("message", "Item has been deleted");
                    RequestDispatcher rd = request.getRequestDispatcher("viewcart.jsp");
                    rd.forward(request, response);
                    return;
                }
            }
        }
        response.sendRedirect("viewcart.jsp");
    }

}
