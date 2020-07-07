package controller.admin.delete;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CompanyInfoDAO;
import model.dao.HibernateUtil;
import model.to.CompanyInfo;

import operational.Checks;

/**
 * Servlet implementation class DeleteCompanyInfo
 */
@WebServlet("/admin/deleteCompanyInfo")
public class DeleteCompanyInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyid = request.getParameter("companyid");
        if (companyid != null) {
            companyid = companyid.trim();
            if (!Checks.isEmpty(companyid)) {
                String message = "";
                CompanyInfo company = CompanyInfoDAO.getRecord(companyid);
                if (company != null) {
                    CompanyInfoDAO action = new CompanyInfoDAO();
                    if (HibernateUtil.deleteRecord(company)) {
                        message = "Deletion Done";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "There is no company for such company id";
                }
                request.setAttribute("message", message);
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewCompanyInfo");
        rd.forward(request, response);
    }

}
