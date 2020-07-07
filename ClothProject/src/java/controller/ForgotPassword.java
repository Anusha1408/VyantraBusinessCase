package controller;

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
import operational.MailOperation;
import operational.RandomString;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String securityquestion = request.getParameter("securityquestion");
        String securityanswer = request.getParameter("securityanswer");
        if (username != null && securityquestion != null
                && securityanswer != null) {
            username = username.trim();
            securityquestion = securityquestion.trim();
            String message = "";
            if (Checks.isEmpty(securityanswer) || Checks.isEmpty(username)
                    || Checks.isEmpty(securityquestion)) {
                message = "Please fill all boxes";
            } else {
                LoginInfo data = LoginInfoDAO.getRecord(username);
                if (data != null && data.getSecurityQuestion().equals(securityquestion) && data.getSecurityAnswer().equals(securityanswer)) {
                    String password = new String(RandomString.generatePswd(6,
                            10, 1, 1, 1));
                    data.setPassword(password);
                    if (HibernateUtil.updateRecord(data)) {
                        String messageText = "<h1>The New Password is :"
                                + password + "<h1>";
                       /* try {
                            MailOperation.SendEmail(data.getEmailId(),
                                    "Password Reset", messageText);
                        } catch (Exception ex) {
                            message = "No internet connection";
                        }
                        message = "Your password has been reset so please check your email";*/
                    } else {
                        message = HibernateUtil.getErrormessage();
                    }
                } else {
                    message = "Invalid username/security-details";
                }
            }
            request.setAttribute("message", message);
        }

        RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
        rd.forward(request, response);
    }

}
