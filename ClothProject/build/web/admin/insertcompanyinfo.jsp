<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%    String companyid = request.getParameter("companyid") != null ? request.getParameter("companyid") : "";
    String companyname = request.getParameter("companyname") != null ? request.getParameter("companyname") : "";
    String description = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<div class="jumbotron">
    <h1>Add New Company Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <form action="insertCompanyInfo" method="post">
            <div class="form-group">
                <label for="companyid">Enter Company ID:</label>
                <input type="text" class="form-control" id="companyid"
                       placeholder="Company ID" name="companyid" value="<%=companyid%>"/>
            </div>
            <div class="form-group">
                <label for="companyname">Enter Company Name:</label>
                <input type="text" class="form-control" id="companyname"
                       placeholder="Company Name" name="companyname" value="<%=companyname%>"/>
            </div>
            <div class="form-group">
                <label for="description">Enter Company Description:</label>
                <textarea class="form-control" id="description" name="description" ><%=description%></textarea>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary btn-block" value="Insert Company Details"/>
            </div>

        </form>
        <%	if (request.getAttribute("message") != null) {
                out.println("<div class=\"alert alert-success\">");
                out.println("<h1 align=\"center\">"
                        + request.getAttribute("message") + "</h1>");
                out.println("</div>");
            }
        %>
    </div></div>
    <%@include file="footer.jsp" %>
