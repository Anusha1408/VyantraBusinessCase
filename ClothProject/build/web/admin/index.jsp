<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="jumbotron">
            <h1>Welcome Admin!!!</h1>
            <%    if (session.getAttribute("lastlogin") != null) {
                    out.println("<h2>Your Last Visit On: " + session.getAttribute("lastlogin").toString() + "</h2>");
                } else {
                    out.println("<h2>Welcome To The Admin Panel First Time.</h2>");
                }
            %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>