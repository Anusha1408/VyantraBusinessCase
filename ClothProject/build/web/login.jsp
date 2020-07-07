<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("Cache-Control", "no-cache");//HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching 
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    if (session.getAttribute("auname") != null) {
        response.sendRedirect("admin/index.jsp");
    }
    if (session.getAttribute("uuname") != null) {
        response.sendRedirect("user/index.jsp");
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login</title>
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
                    <div class="Product_top">
                        <div class="row content">
                        <jsp:include page="side.jsp"></jsp:include>
                            <div class="col-md-9">
                                <div class="breadcrumb">
                                    <a href="index.jsp">Home</a>  
                                    &gt;&gt;  <span class="last">Account/Login</span>
                                </div>
                                <div class="account_grid">
                                    <div class="col-md-6 login-left">
                                        <h3>NEW CUSTOMERS</h3>
                                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                                        <a class="acount-btn" href="register.jsp">Creat an Account</a>
                                    </div>
                                    <div class="col-md-6 login-right">
                                        <h3>REGISTERED CUSTOMERS</h3>
                                        <p>If you have an account with us, please log in.</p>
                                        <form action="checkLogin" method="post">
                                            <div>
                                                <span>Username<label>*</label></span>
                                                <input type="text" name="username" value="${param.username }" /> 
                                        </div>
                                        <div>
                                            <span>Password<label>*</label></span>
                                            <input type="password" name="password" /> 
                                        </div>
                                        <a class="forgot" href="forgot.jsp">Forgot Your Password?</a>
                                        <input type="submit" value="Login">
                                    </form>
                                    <div><h1 align="center">${message }</h1></div>
                                </div>	
                                <div class="clearfix"> </div>
                            </div>	
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>