package controller.admin.update;

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
 * Servlet implementation class UpdateProductInfo
 */
@WebServlet("/admin/updateProductInfo")
public class UpdateProductInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productid = request.getParameter("productid") != null ? request.getParameter("productid") : "";
        String productname = request.getParameter("productname") != null ? request.getParameter("productname") : "";
        String description = request.getParameter("description") != null ? request.getParameter("description") : "";
        String subcategoryid = request.getParameter("subcategoryid") != null ? request.getParameter("subcategoryid") : "";
        String companyid = request.getParameter("companyid") != null ? request.getParameter("companyid") : "";
        String price = request.getParameter("price") != null ? request.getParameter("price") : "";
        String quantity = request.getParameter("quantity") != null ? request.getParameter("quantity") : "";
        if (subcategoryid != null && productid != null && description != null && companyid != null && price != null && quantity != null && productname != null) {
            subcategoryid = subcategoryid.trim();
            productid = productid.trim();
            productname = productname.trim();
            subcategoryid = subcategoryid.trim();
            companyid = companyid.trim();
            price = price.trim();
            quantity = quantity.trim();
            description = description.trim();

            String message = "";
            if (Checks.isEmpty(productid) || Checks.isEmpty(productname) || Checks.isEmpty(companyid) || Checks.isEmpty(description) || Checks.isEmpty(quantity) || Checks.isEmpty(price) || Checks.isEmpty(subcategoryid)) {
                message = "Please fill all boxes";

            } else {
                if (Checks.isNumeric(subcategoryid) || Checks.isNumeric(price) || Checks.isNumeric(quantity) || Checks.isNumeric(productid)) {
                    ProductInfo pit = ProductInfoDAO.getRecord(Integer.parseInt(productid));
                    CompanyInfo company = CompanyInfoDAO.getRecord(companyid);
                    ProductSubCategory subcategory = ProductSubCategoryDAO.getRecord(Integer.parseInt(subcategoryid));
                    if (pit != null && company != null && subcategory != null) {
                        pit.setCompany(company);
                        pit.setPrice(Float.parseFloat(price));
                        pit.setProductName(productname);
                        pit.setQuantity(Integer.parseInt(quantity));
                        pit.setSubcategory(subcategory);
                        pit.setDescription(description);
                        if (HibernateUtil.updateRecord(pit)) {
                            message = "Updation Done";
                        } else {
                            message = HibernateUtil.getErrormessage();
                        }
                    } else {
                        message = "Invalid Information is Passed";
                    }
                } else {
                    message = "Please Enter Numeric Value";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewProductInfo");
        rd.forward(request, response);
    }

}
