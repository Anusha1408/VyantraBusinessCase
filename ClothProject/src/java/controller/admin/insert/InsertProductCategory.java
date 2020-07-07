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
import model.to.ProductCategory;

import operational.Checks;

/**
 * Servlet implementation class InsertProductCategory
 */
@WebServlet("/admin/insertProductCategory")
public class InsertProductCategory extends HttpServlet {

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
                message = "Please Enter Some Value";
            } else {
                ProductCategory procat = new ProductCategory();
                procat.setCategoryId(categoryid);
                procat.setCategoryName(categoryname);
                procat.setDescription(description);
                if (HibernateUtil.insertRecord(procat)) {
                    message = "Insertion Done";
                } else {
                    message = HibernateUtil.getErrormessage();
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("insertproductcategory.jsp");
        rd.forward(request, response);
    }

}
