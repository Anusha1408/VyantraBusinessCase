package controller.admin.update;

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
import model.dao.ProductSubCategoryDAO;
import model.to.ProductInfo;
import model.to.ProductStock;
import model.to.ProductSubCategory;
import operational.Checks;

/**
 * Servlet implementation class UpdateProductStock
 */
@WebServlet("/admin/updateProductStock")
public class UpdateProductStock extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stockid = request.getParameter("stockid") != null ? request.getParameter("stockid") : "";
        String productid = request.getParameter("productid") != null ? request.getParameter("productid") : "";
        String quantity = request.getParameter("quantity") != null ? request.getParameter("quantity") : "";
        String stocktype = request.getParameter("stocktype") != null ? request.getParameter("stocktype") : "";
        String stockdate = request.getParameter("stockdate") != null ? request.getParameter("stockdate") : "";
        if (stockid != null && productid != null && quantity != null && stocktype != null && stockdate != null) {
            stockid = stockid.trim();
            productid = productid.trim();
            quantity = quantity.trim();
            stocktype = stocktype.trim();
            stockdate = stockdate.trim();
            String message = "";
            if (Checks.isEmpty(stockid) || Checks.isEmpty(productid) || Checks.isEmpty(quantity) || Checks.isEmpty(stocktype) || Checks.isEmpty(stockdate)) {
                message = "Please fill all boxes";

            } else {
                if (Checks.isNumeric(stockid) || Checks.isNumeric(productid) || Checks.isNumeric(quantity)) {
                    if (Checks.isDate(stockdate)) {
                        ProductStock pst = ProductStockDAO.getRecord(Integer.parseInt(stockid));
                        ProductInfo product = ProductInfoDAO.getRecord(Integer.parseInt(productid));
                        if (pst != null && product != null) {
                            pst.setProduct(product);
                            pst.setQuantity(Integer.parseInt(quantity));
                            pst.setStockType(stocktype);
                            pst.setStockDate(Timestamp.valueOf(stockdate));
                            if (HibernateUtil.updateRecord(pst)) {
                                message = "Updation Done";
                            } else {
                                message = HibernateUtil.getErrormessage();
                            }
                        } else {
                            message = "Invalid Information is Given";
                        }
                    } else {
                        message = "Please Enter Correct Date";
                    }
                } else {
                    message = "Please Enter Numeric Value";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductStock");
        rd.forward(request, response);
    }
}
