<%@page import="model.dao.ProductSubCategoryDAO"%>
<%@page import="model.to.ProductSubCategory"%>
<%@page import="model.dao.ProductCategoryDAO"%>
<%@page import="model.to.ProductCategory"%>
<%@page import="java.util.List"%>
<div class="col-md-3 content_top">
    <div class="category_box">
        <h3 class="cate_head">Categories</h3>
        <ul class="category">
            <%

                List<ProductCategory> allCategory = ProductCategoryDAO.getAllRecord();
                if (allCategory != null) {
                    for (ProductCategory pct : allCategory) {
                        out.println("<li onclick=\"show(this)\">");
                        out.println("<span style=\"font-size:0.85em\">" + pct.getCategoryName() + "</span>");
                        List<ProductSubCategory> allSubCategory = ProductSubCategoryDAO.getAllRecord(pct.getCategoryId());
                        if (allSubCategory != null) {
                            out.println("<ul style=\"display:none\">");
                            for (ProductSubCategory psct : allSubCategory) {
                                out.println("<li>");
                                out.println("<a href=\"index1.jsp?subcategoryid=" + psct.getSubCategoryId() + "\">" + psct.getSubCategoryName() + "</a>");
                                out.println("</li>");
                            }
                            out.println("</ul>");
                        }
                        out.println("</li>");
                    }
                }

            %>

        </ul>
    </div>
    <ul>
        <h3>
            <i class="arrow"> </i><span>Payment Methods</span>
        </h3>
        <img src="images/payment.png" class="img-responsive" alt="" />
    </ul>
</div>