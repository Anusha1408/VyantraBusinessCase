package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductStockDAO;
import model.to.ProductStock;
import operational.Checks;

/**
 * Servlet implementation class DeleteProductStock
 */
@WebServlet("/admin/deleteProductStock")
public class DeleteProductStock extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stockid = request.getParameter("stockid");
        if (stockid != null) {
            stockid = stockid.trim();
            String message = "";
            if (!Checks.isEmpty(stockid)) {
                if (Checks.isNumeric(stockid)) {
                    ProductStock stock = ProductStockDAO.getRecord(Integer.parseInt(stockid));
                    if (stock != null) {
                        if (HibernateUtil.deleteRecord(stock)) {
                            message = "Deletion Done";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        message = "There is no such Product Stock details for given stock id";
                    }
                } else {
                    message = "Please Provide number in stock id";
                }
            } else {
                message = "Please Provide any value in stock id";
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductStock");
        rd.forward(request, response);
    }

}
