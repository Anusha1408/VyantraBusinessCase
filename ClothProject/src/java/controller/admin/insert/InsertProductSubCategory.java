package controller.admin.insert;

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
 * Servlet implementation class InsertProductSubCategory
 */
@WebServlet("/admin/insertProductSubCategory")
public class InsertProductSubCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subcategoryname = request.getParameter("subcategoryname");
        System.out.println(" DONE ");
        String description = request.getParameter("description");
        String categoryid = request.getParameter("categoryid");
        String message = "";
        if (subcategoryname != null && categoryid != null && description != null) {

            subcategoryname = subcategoryname.trim();
            description = description.trim();
            categoryid = categoryid.trim();
            if (Checks.isEmpty(subcategoryname) || Checks.isEmpty(categoryid) || Checks.isEmpty(description)) {
                message = "Enter Some Values";
            } else {
                ProductCategory category = ProductCategoryDAO.getRecord(categoryid);
                if (category != null) {
                    ProductSubCategory data = new ProductSubCategory();
                    data.setCategory(category);
                    data.setDescription(description);
                    data.setSubCategoryName(subcategoryname);
                    if (HibernateUtil.insertRecord(data)) {
                        message = "Insertion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "Invalid Information of Product Category";
                }
            }            
        }else{
            message = "Not Enough Value are supplied";
        }
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("fetchProductCategoryForProductSubCategory");
        rd.forward(request, response);
    }

}
