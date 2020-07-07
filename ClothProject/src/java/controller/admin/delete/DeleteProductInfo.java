package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductInfoDAO;
import model.to.ProductInfo;
import operational.Checks;

/**
 * Servlet implementation class DeleteProductInfo
 */
@WebServlet("/admin/deleteProductInfo")
public class DeleteProductInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productid = request.getParameter("productid");
        if (productid != null) {
            productid = productid.trim();
            String message = "";
            if (!Checks.isEmpty(productid)) {
                if (Checks.isNumeric(productid)) {
                    ProductInfo product = ProductInfoDAO.getRecord(Integer.parseInt(productid));
                    if (product != null) {
                        if (HibernateUtil.deleteRecord(product)) {
                            message = "Deletion Done";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        message = "There is no such Product Information for this Product ID";
                    }
                } else {
                    message = "Please provide Number in Product ID";
                }
            } else {
                message = "Please provide any value to product id";
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductInfo");
        rd.forward(request, response);
    }

}
