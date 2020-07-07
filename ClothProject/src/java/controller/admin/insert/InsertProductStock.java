package controller.admin.insert;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductInfoDAO;
import model.dao.ProductStockDAO;
import model.to.ProductInfo;
import model.to.ProductStock;
import operational.Checks;

/**
 * Servlet implementation class InsertProductStock
 */
@WebServlet("/admin/insertProductStock")
public class InsertProductStock extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productid = request.getParameter("productid");
        String quantity = request.getParameter("quantity");
        String stocktype = request.getParameter("stocktype");
        String stockdate = request.getParameter("stockdate");
        if (productid != null && quantity != null && stocktype != null && stockdate != null) {
            String message = "";
            productid = productid.trim();
            quantity = quantity.trim();
            stocktype = stocktype.trim();
            stockdate = stockdate.trim();
            if (Checks.isEmpty(productid) || Checks.isEmpty(quantity) || Checks.isEmpty(stocktype) || Checks.isEmpty(stockdate)) {
                message = "Enter Some Values";
            } else if (Checks.isNumeric(productid) && Checks.isNumeric(quantity) && Checks.isDate(stockdate)) {
                ProductStock data = new ProductStock();
                ProductInfo product = ProductInfoDAO.getRecord(Integer.parseInt(productid));
                if (product != null) {
                    data.setProduct(product);
                    data.setQuantity(Integer.parseInt(quantity));
                    data.setStockType(stocktype);
                    data.setStockDate(Timestamp.valueOf(stockdate));
                    if (HibernateUtil.insertRecord(data)) {
                        message = "Insertion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                }
            } else {
                message = "Invalid Format of Information";
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("fetchProductInfoForProductStock");
        rd.forward(request, response);
    }

}
