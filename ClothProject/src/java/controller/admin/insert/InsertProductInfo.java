package controller.admin.insert;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CompanyInfoDAO;
import model.dao.HibernateUtil;

import model.dao.ProductInfoDAO;
import model.dao.ProductSubCategoryDAO;
import model.to.CompanyInfo;
import model.to.ProductInfo;
import model.to.ProductSubCategory;
import operational.Checks;

/**
 * Servlet implementation class InsertProductInfo
 */
@WebServlet("/admin/insertProductInfo")
public class InsertProductInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subcategoryid = request.getParameter("subcategoryid");
        String description = request.getParameter("description");
        String companyid = request.getParameter("companyid");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String productname = request.getParameter("productname");
        if (subcategoryid != null && description != null && companyid != null && price != null && quantity != null && productname != null) {
            String message = "";
            subcategoryid = subcategoryid.trim();
            description = description.trim();
            companyid = companyid.trim();
            productname = productname.trim();
            price = price.trim();
            quantity = quantity.trim();
            if (Checks.isEmpty(subcategoryid) || Checks.isEmpty(companyid) || Checks.isEmpty(description) || Checks.isEmpty(productname) || Checks.isEmpty(price) || Checks.isEmpty(quantity)) {
                message = "Enter Some Values";
            } else {

                ProductSubCategory subcategory = ProductSubCategoryDAO.getRecord(Integer.parseInt(subcategoryid));
                CompanyInfo company = CompanyInfoDAO.getRecord(companyid);
                if (subcategory != null && company != null) {
                    ProductInfo data = new ProductInfo();
                    data.setDescription(description);
                    data.setSubcategory(subcategory);
                    data.setCompany(company);
                    data.setPrice(Integer.parseInt(price));
                    data.setProductName(productname);
                    data.setQuantity(Integer.parseInt(quantity));
                    if (HibernateUtil.insertRecord(data)) {
                        message = "Insertion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "Invalid Information of Company Info or Product Sub Category";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("fetchCompanyInfoForProductInfo");
        rd.forward(request, response);
    }

}
