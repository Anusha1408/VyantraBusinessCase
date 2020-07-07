<%@page import="java.util.List"%>
<%@page import="model.to.CompanyInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Company Information</h1>
</div>
<%    if (request.getParameter("message") != null) {
        out.println("<h1 align=\"center\">" + request.getParameter("message") + "<h1>");
    }

%>
<div class="row">
    <div class="col-12">
        <h1 align="center">${message}</h1>
        <table class="table">
            <tr>
                <th>Company ID</th>
                <th>Company Name</th>
                <th>Description</th>
                <th>Delete This Record</th>
                <th>Edit This Record</th>
            </tr>
            <%                    String ucompany = request.getParameter("ucompany") != null ? request.getParameter("ucompany") : "";
                CompanyInfo updatedata = null;
                if (request.getAttribute("cominf") != null) {
                    List<CompanyInfo> cominf = (List<CompanyInfo>) request.getAttribute("cominf");
                    for (CompanyInfo cit : cominf) {
                        if (cit.getCompanyId().equals(ucompany)) {
                            updatedata = cit;
                        }
                        out.println("<tr><td>");
                        out.println(cit.getCompanyId() + "</td>");
                        out.println("<td>" + cit.getCompanyName() + "</td>");
                        out.println("<td>" + cit.getDescription() + "</td>");
                        out.println("<td><a onclick=\"return comfirm('Are You Sure To Delete This Record')\" href=\"deleteCompanyInfo?companyid=" + cit.getCompanyId() + "\">Delete This Record</a></td>");
                        out.println("<td><a href=\"viewCompanyInfo?ucompany=" + cit.getCompanyId() + "\">Edit This Record</a></td>");
                        out.println("</tr>");
                    }
                } else {
                    out.println("<tr><td colspan=\"5\" align=\"center\"> No Data Found</td></tr>");
                }
            %>
        </table>
        <%
            if (updatedata != null) {
        %>
        <form action="updateCompanyInfo" method="post">
            

            <div class="form-group">
                <label for="companyid">Enter Company ID:</label>
                <input type="text" class="form-control" id="companyid"
                       placeholder="Company ID" readonly name="companyid" value="<%=updatedata.getCompanyId() %>"/>
            </div>
            <div class="form-group">
                <label for="companyname">Enter Company Name:</label>
                <input type="text" class="form-control" id="companyname"
                       placeholder="Company Name" name="companyname" value="<%= updatedata.getCompanyName() %>"/>
            </div>
            <div class="form-group">
                <label for="description">Enter Company Description:</label>
                <textarea class="form-control" id="description" name="description" ><%= updatedata.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary btn-block" value="Update Company Details"/>
            </div>
        </form>
        <%
            }
        %>
    </div>
</div>
<%@include file="footer.jsp" %>
