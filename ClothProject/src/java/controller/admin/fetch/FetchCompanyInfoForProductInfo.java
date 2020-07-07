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

import model.dao.CompanyInfoDAO;
import model.dao.ProductCategoryDAO;
import model.dao.ProductSubCategoryDAO;
import model.to.CompanyInfo;
import model.to.ProductCategory;
import model.to.ProductSubCategory;

/**
 * Servlet implementation class FetchCompanyInfoForProductInfo
 */
@WebServlet("/admin/fetchCompanyInfoForProductInfo")
public class FetchCompanyInfoForProductInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductSubCategory> prosubcat = ProductSubCategoryDAO.getAllRecord();
        if (prosubcat != null && prosubcat.size() > 0) {
            request.setAttribute("prosubcat", prosubcat);
        }
        List<CompanyInfo> cominf = CompanyInfoDAO.getAllRecord();
        if (cominf != null && cominf.size() > 0) {
            request.setAttribute("cominf", cominf);
        }
        RequestDispatcher rd = request.getRequestDispatcher("insertproductinfo.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

}
