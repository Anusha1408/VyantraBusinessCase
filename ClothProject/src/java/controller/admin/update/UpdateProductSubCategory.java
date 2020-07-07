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

import model.dao.ProductSubCategoryDAO;
import model.to.ProductCategory;
import model.to.ProductSubCategory;

import operational.Checks;

/**
 * Servlet implementation class UpdateProductSubCategory
 */
@WebServlet("/admin/updateProductSubCategory")
public class UpdateProductSubCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subcategoryid = request.getParameter("subcategoryid") != null ? request.getParameter("subcategoryid") : "";
        String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "";
        String description = request.getParameter("description") != null ? request.getParameter("description") : "";
        String subcategoryname = request.getParameter("subcategoryname") != null ? request.getParameter("subcategoryname") : "";
        if (subcategoryid != null && subcategoryname != null && description != null && categoryid != null) {
            subcategoryid = subcategoryid.trim();
            subcategoryname = subcategoryname.trim();
            description = description.trim();
            categoryid = categoryid.trim();
            String message = "";
            if (Checks.isEmpty(subcategoryname) || Checks.isEmpty(description) || Checks.isEmpty(categoryid) || Checks.isEmpty(subcategoryid)) {
                message = "Please fill all boxes";

            } else {
                if (Checks.isNumeric(subcategoryid)) {
                    ProductSubCategory psct = ProductSubCategoryDAO.getRecord(Integer.parseInt(subcategoryid));
                    ProductCategory category = ProductCategoryDAO.getRecord(categoryid);
                    if (psct != null && category != null) {
                        psct.setCategory(category);
                        psct.setSubCategoryName(subcategoryname);
                        psct.setDescription(description);
                        if (HibernateUtil.updateRecord(psct)) {
                            message = "Updation Done";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        message = "Invalid Information is Given";
                    }
                } else {
                    message = "Please Enter Numeric Value";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductSubCategory");
        rd.forward(request, response);
    }
}
