package controller.admin.view;

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
import model.dao.ProductSubCategoryDAO;
import model.to.ProductCategory;
import model.to.ProductSubCategory;

/**
 * Servlet implementation class ViewProductSubCategory
 */
@WebServlet("/admin/viewProductSubCategory")
public class ViewProductSubCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductSubCategory> prosubcat = ProductSubCategoryDAO.getAllRecord();
        if (prosubcat != null && prosubcat.size() > 0) {
            request.setAttribute("prosubcat", prosubcat);
        }
        List<ProductCategory> procat = ProductCategoryDAO.getAllRecord();
        if (procat != null && procat.size() > 0) {
            request.setAttribute("procat", procat);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewproductsubcategory.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

}
