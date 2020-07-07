package controller.admin.fetch;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProductCategoryDAO;
import model.to.ProductCategory;

/**
 * Servlet implementation class FetchProductCategoryForProductSubCategory
 */
@WebServlet("/admin/fetchProductCategoryForProductSubCategory")
public class FetchProductCategoryForProductSubCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductCategory> procatfk = ProductCategoryDAO.getAllRecord();
        if (procatfk != null && procatfk.size() > 0) {
            request.setAttribute("procatfk", procatfk);
        }
        RequestDispatcher rd = request.getRequestDispatcher("insertproductsubcategory.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

}
