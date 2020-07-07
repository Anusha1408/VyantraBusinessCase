<%@page import="operational.QuestionList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Register Your Details</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!----webfonts---->
        <link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
                    <div class="Product_top">
                        <form action="insertLoginInfo" method="post"> 
                            <div class="register-top-grid">
                                <h3>PERSONAL INFORMATION</h3>
                                <div>
                                    <span>Enter Username<label>*</label></span>
                                    <input type="text" name="username" value="${param.username }"> 
                            </div>
                            <div>
                                <span>Email Address<label>*</label></span>
                                <input type="text" name="emailid" value="${param.emailid }"> 
                            </div>
                            <div>
                                <span>Choose Security Question<label>*</label></span>
                                <select class="form-control" name="securityquestion">
                                    <%
                                        ArrayList<String> sq = QuestionList.getQuestionList();
                                        for (String s : sq) {
                                            if (s.equals(request.getParameter("securityquestion"))) {
                                                out.println("<option selected=\"selected\" value= \"" + s + "\">" + s + "</option>");
                                            } else {
                                                out.println("<option value= \"" + s + "\">" + s + "</option>");
                                            }
                                        }
                                    %>

                                </select> 
                            </div>
                            <div>
                                <span>Enter Security Answer<label>*</label></span>
                                <input type="text" name="securityanswer" value="${param.securityanswer }"> 
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                        <div class="register-bottom-grid">
                            <h3>LOGIN INFORMATION</h3>
                            <div>
                                <span>Password<label>*</label></span>
                                <input  class="form-control" type="password" name="password" >
                            </div>
                            <div>
                                <span>Confirm Password<label>*</label></span>
                                <input class="form-control" type="password" name="confirmpassword"/>
                            </div>
                        </div>

                        <div class="clearfix"> </div>
                        <div class="register-but">
                            <input type="submit"  value="Submit">
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div><h1 align="center">${message }</h1></div>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>