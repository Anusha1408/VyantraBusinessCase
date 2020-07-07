<%@page import="model.to.ProductCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Cloth Category Information</h1>
</div>
<%    if (request.getAttribute("message") != null) {
        out.println("<h1 align=\"center\">" + request.getAttribute("message") + "<h1>");

    }
%>
<div class="row">
    <div class="col-12">
        <table class="table">
            <tr>
                <th>Category ID </th>
                <th>Category Name </th>
                <th>Description </th>
                <th>Delete Record </th>
                <th>Edit Record </th>
            </tr>
            <%
                String ucategoryid = request.getParameter("ucategoryid") != null ? request.getParameter("ucategoryid") : "";
                ProductCategory updatedata = null;
                if (request.getAttribute("prodata") != null) {
                    List<ProductCategory> prodata = (List<ProductCategory>) request.getAttribute("prodata");
                    for (ProductCategory pct : prodata) {
                        if (pct.getCategoryId().equals(ucategoryid)) {
                            updatedata = pct;
                        }
                        out.println("<tr><td>");
                        out.println(pct.getCategoryId() + "</td>");
                        out.println("<td>" + pct.getCategoryName() + "</td>");
                        out.println("<td>" + pct.getDescription() + "</td>");
                        out.println("<td><a onclick=\"return confirm('Are You Sure To Delete This Record')\" href=\"deleteProductCategory?categoryid=" + pct.getCategoryId() + "\">Delete This Record</a></td>");
                        out.println("<td><a href=\"viewProductCategory?ucategoryid="
                                + pct.getCategoryId() + "\">Edit This Record</a></td>");
                        out.println("</tr>");
                    }
                } else {
                    out.println("<tr><td colspan=\"5\" align=\"center\"> No Data Found</td></tr>");
                }

            %>
        </table>
        <%    if (updatedata != null) {
        %>

        <form method="post" action="updateProductCategory">

            <div class="form-group">
                <label for="categoryid">
                    Enter Category ID:
                </label>
                <input type="text" placeholder="Category ID" id="categoryid" class="form-control" name="categoryid"
                       value="<%= updatedata.getCategoryId()%>"/>
            </div>
            <div class="form-group">
                <label for="categoryname">
                    Enter Category Name:
                </label>
                <input type="text" placeholder="Category Name" id="categoryname" class="form-control" name="categoryname" 
                       value="<%= updatedata.getCategoryName()%>"/>
            </div>
            <div class="form-group">
                <label for="description">
                    Enter Description:
                </label>
                <textarea id="description" class="form-control" name="description"><%= updatedata.getDescription()%></textarea>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="Update Product Category"/>
            </div>
        </form>

        <%
            }
        %>
    </div>
</div>
<%@include file="footer.jsp" %>
