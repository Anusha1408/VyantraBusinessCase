package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductCategoryDAO;
import model.to.ProductCategory;

import operational.Checks;

/**
 * Servlet implementation class DeleteProductCategory
 */
@WebServlet("/admin/deleteProductCategory")
public class DeleteProductCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryid = request.getParameter("categoryid");
        if (categoryid != null) {
            categoryid = categoryid.trim();
            if (!Checks.isEmpty(categoryid)) {
                String message = "";
                ProductCategory category = ProductCategoryDAO.getRecord(categoryid);
                if (category != null) {

                    if (HibernateUtil.deleteRecord(category)) {
                        message = "Deletion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "There is no Product Category for this categoryid";
                }
                request.setAttribute("message", message);
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductCategory");
        rd.forward(request, response);
    }

}
