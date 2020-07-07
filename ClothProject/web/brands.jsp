<%@page import="model.dao.CompanyInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.to.CompanyInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Brands for Instruments</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link
            href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
            rel='stylesheet' type='text/css'>
        <script type="text/javascript">
            function f4()
            {
                f1();
                f5();
            }
            function f5() {
                document.getElementById("log").src = "upimages/logo1.jpg";
                setTimeout("f6()", 3000);
            }
            function f6() {
                document.getElementById("log").src = "upimages/logo2.jpg";
                setTimeout("f7()", 3000);
            }
            function f7() {
                document.getElementById("log").src = "upimages/logo3.jpg";
                setTimeout("f8()", 3000);
            }
            function f8() {
                document.getElementById("log").src = "upimages/logo4.jpg";
                setTimeout("f5()", 3000);
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>


            <div class="main">
                <div class="container">
                    <font style="cosmic" size="5" color="blue">
                    <%
                        List<CompanyInfo> allCompany = CompanyInfoDAO.getAllRecord();
                        if (allCompany != null) {
                            int i = 1;
                            out.println("<table align=\"center\" >");
                            for (CompanyInfo cit : allCompany) {
                                if (i == 1) {
                                    out.println("<tr>");
                                }
                                if (i <= 6) {
                                    out.println("<td width=\"200\" height=\"100\" align=\"center\"><a href=\"viewproduct.jsp?companyid="
                                            + cit.getCompanyId() + "\">" + cit.getCompanyName()
                                            + "</a></td>");
                                    i++;
                                }
                                if (i == 7) {
                                    out.println("</tr>");
                                    i = 1;
                                }
                            }
                            if (i != 4) {
                                out.println("</tr>");
                            }
                            out.println("</table>");
                        }
                    %>
                </font>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>