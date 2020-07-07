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

import model.to.CompanyInfo;

import operational.Checks;

/**
 * Servlet implementation class UpdateCompanyInfo
 */
@WebServlet("/admin/updateCompanyInfo")
public class UpdateCompanyInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyid = request.getParameter("companyid");
        String companyname = request.getParameter("companyname");
        String description = request.getParameter("description");
        if (companyid != null && companyname != null && description != null) {
            String message = "";
            companyid = companyid.trim();
            companyname = companyname.trim();
            description = description.trim();
            if (Checks.isEmpty(description) || Checks.isEmpty(companyname) || Checks.isEmpty(companyid)) {
                message = "Enter Some Values";
            } else {
                CompanyInfo cit = CompanyInfoDAO.getRecord(companyid);
                if (cit != null) {
                    cit.setCompanyName(companyname);
                    cit.setDescription(description);
                    if (HibernateUtil.updateRecord(cit)) {
                        message = "Record Has Been Updated";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "There is no Company Information regarding this company id";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewCompanyInfo");
        rd.forward(request, response);
    }

}
