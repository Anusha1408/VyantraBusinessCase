package controller.admin.insert;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.LoginInfoDAO;
import model.to.LoginInfo;
import operational.Checks;

/**
 * Servlet implementation class InsertLoginInfo
 */
@WebServlet("/insertLoginInfo")
public class InsertLoginInfo extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String emailid = request.getParameter("emailid");
        String securityquestion = request.getParameter("securityquestion");
        String securityanswer = request.getParameter("securityanswer");
        if (username != null && password != null && confirmpassword != null && emailid != null && securityquestion != null && securityanswer != null) {
            String message = "";
            username = username.trim();
            password = password.trim();
            confirmpassword = confirmpassword.trim();
            emailid = emailid.trim();
            securityquestion = securityquestion.trim();
            securityanswer = securityanswer.trim();
            if (Checks.isEmpty(username) || Checks.isEmpty(password) || Checks.isEmpty(confirmpassword) || Checks.isEmpty(emailid) || Checks.isEmpty(securityquestion) || Checks.isEmpty(securityanswer)) {
                message = "Enter Some Values";
            } else {
                if (password.equals(confirmpassword)) {
                    LoginInfo data = new LoginInfo();
                    data.setEmailId(emailid);
                    data.setPassword(password);
                    data.setUserName(username);
                    data.setSecurityQuestion(securityquestion);
                    data.setSecurityAnswer(securityanswer);
                    data.setRoleNumber("user");
                    if (HibernateUtil.insertRecord(data)) {
                        message = "You have been Registered";
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "Password and confirmpassword is not matching";
                }
            }
            request.setAttribute("message", message);
        }
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    }

}
