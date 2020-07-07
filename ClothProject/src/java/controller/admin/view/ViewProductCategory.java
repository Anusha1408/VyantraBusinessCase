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
import model.to.ProductCategory;

/**
 * Servlet implementation class ViewProductCategory
 */
@WebServlet("/admin/viewProductCategory")
public class ViewProductCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductCategory> prodata = ProductCategoryDAO.getAllRecord();
        if (prodata != null && prodata.size() > 0) {
            request.setAttribute("prodata", prodata);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewproductcategory.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

}
