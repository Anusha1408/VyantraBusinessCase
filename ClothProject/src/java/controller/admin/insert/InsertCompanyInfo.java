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
import model.to.CompanyInfo;
import operational.Checks;

/**
 * Servlet implementation class InsertCompanyInfo
 */
@WebServlet("/admin/insertCompanyInfo")
public class InsertCompanyInfo extends HttpServlet {

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
            if (Checks.isEmpty(companyid) || Checks.isEmpty(companyname) || Checks.isEmpty(description)) {
                message = "Please Enter Some Value";
            } else {
                CompanyInfo cominf = new CompanyInfo();
                cominf.setCompanyId(companyid);
                cominf.setCompanyName(companyname);
                cominf.setDescription(description);
                if (HibernateUtil.insertRecord(cominf)) {
                    message = "Insertion Done";
                } else {
                    message = HibernateUtil.getErrormessage();
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("insertcompanyinfo.jsp");
        rd.forward(request, response);
    }

}
