<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp" %>
<%    String categoryid = request.getParameter("categoryid") != null ? request.getParameter("categoryid") : "";
    String categoryname = request.getParameter("categoryname") != null ? request.getParameter("categoryname") : "";
    String description = request.getParameter("description") != null ? request.getParameter("description") : "";
%>
<div class="jumbotron">
    <h1>Add New Category Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <form action="insertProductCategory" method="post">
            <div class="form-group">
                <label for="categoryid">
                    Enter Category ID:
                </label>
                <input type="text" placeholder="Category ID" id="categoryid" class="form-control" name="categoryid" value="<%=categoryid%>"/>
            </div>
            <div class="form-group">
                <label for="categoryname">
                    Enter Category Name:
                </label>
                <input type="text" placeholder="Category Name" id="categoryname" class="form-control" name="categoryname" 
                       value="<%=categoryname%>"/>
            </div>
            <div class="form-group">
                <label for="description">
                    Enter Description:
                </label>
                <textarea id="description" class="form-control" name="description"><%= description%></textarea>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="Insert Product Category"/>
            </div>
            <%
                if (request.getAttribute("message") != null) {
                    out.println("<div class=\"alert alert-success\">");
                    out.println("<h1 align=\"center\">"
                            + request.getAttribute("message") + "</h1>");
                    out.println("</div>");
                }
            %>
        </form>
    </div>
</div>
<%@include file="footer.jsp" %>
