<%@page import="java.util.List"%>
<%@page import="model.dao.ProductPhotoDAO"%>
<%@page import="model.dao.ProductCategoryDAO"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Cloth Photo Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <h1 align="center">${message }</h1>
        <table class="table">

            <%    List<ProductPhoto> allPhoto = ProductPhotoDAO.getAllRecord();
                if (allPhoto != null) {
                    int i = 0;
                    for (ProductPhoto ppt : allPhoto) {
                        if (i == 0) {
                            out.println("<tr>");
                        }
                        i++;
                        String path = "../upimages/" + ppt.getPhotoId() + "." + ppt.getExtNam();
                        out.println("<td>");
                        out.println("<img src=\"" + path + "\" height=\"300\" width=\"300\"/><br/>");
                        out.println("<a href=\"deleteProductPhoto?photoid=" + ppt.getPhotoId() + "\" onclick=\"return confirm('Are You Sure To Delete This Record')\">Delete Photo</a>");
                        
                        out.println("</td>");
                        if (i == 3) {
                            out.println("</tr>");
                            i = 0;
                        }
                    }
                    if (i != 0) {
                        out.println("</tr>");
                    }
                } else {
                    out.println("<tr><td colspan=\"3\" align=>There are No Photos</td></tr>");
                }

            %>

        </table>
    </div>
</div>
<%@include file="footer.jsp" %>
