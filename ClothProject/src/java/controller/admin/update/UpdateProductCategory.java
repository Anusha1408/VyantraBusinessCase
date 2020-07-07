package controller.admin.update;

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
 * Servlet implementation class UpdateProductCategory
 */
@WebServlet("/admin/updateProductCategory")
public class UpdateProductCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryid = request.getParameter("categoryid");
        String categoryname = request.getParameter("categoryname");
        String description = request.getParameter("description");
        if (categoryid != null && categoryname != null && description != null) {
            String message = "";
            categoryid = categoryid.trim();
            categoryname = categoryname.trim();
            description = description.trim();
            if (Checks.isEmpty(categoryid) || Checks.isEmpty(categoryname) || Checks.isEmpty(description)) {
                message = "Enter Some values";
            } else {
                ProductCategory pct = ProductCategoryDAO.getRecord(categoryid);
                if (pct != null) {
                    pct.setCategoryName(categoryname);
                    pct.setDescription(description);
                    if (HibernateUtil.updateRecord(pct)) {
                        message = "Record has been Updated";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "There is no Product Category Information for given category id";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductCategory");
        rd.forward(request, response);
    }

}
