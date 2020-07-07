package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductSubCategoryDAO;
import model.to.ProductSubCategory;
import operational.Checks;

/**
 * Servlet implementation class DeleteProductSubCategory
 */
@WebServlet("/admin/deleteProductSubCategory")
public class DeleteProductSubCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subcategoryid = request.getParameter("subcategoryid");
        if (subcategoryid != null) {
            String message = "";
            subcategoryid = subcategoryid.trim();
            if (!Checks.isEmpty(subcategoryid)) {
                if (Checks.isNumeric(subcategoryid)) {
                    ProductSubCategory subcategory = ProductSubCategoryDAO.getRecord(Integer.parseInt(subcategoryid));
                    if (HibernateUtil.deleteRecord(subcategory)) {
                        message = "Deletion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "Please provide number is sub category id";
                }
            } else {
                message = "Please provide any value to subcategory id";
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductSubCategory");
        rd.forward(request, response);
    }

}
