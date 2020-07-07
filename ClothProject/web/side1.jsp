<%@page import="model.dao.ProductInfoDAO"%>
<%@page import="model.to.ProductInfo"%>
<%@page import="model.dao.CompanyInfoDAO"%>
<%@page import="model.to.CompanyInfo"%>
<%@page import="model.dao.ProductSubCategoryDAO"%>
<%@page import="model.to.ProductSubCategory"%>
<%@page import="model.dao.ProductCategoryDAO"%>
<%@page import="model.to.ProductCategory"%>
<%@page import="java.util.List"%>
<div class="col-md-3 content_top">
    <div class="category_box">
        <h3 class="cate_head">Brands</h3>
        <ul class="category">
            <%

                List<CompanyInfo> allCompany = CompanyInfoDAO.getAllRecord();
                if (allCompany != null) {
                    for (CompanyInfo cit : allCompany) {
                        List<ProductInfo> products = ProductInfoDAO.getAllProductByCompanyID(cit.getCompanyId());
                        if (products != null && products.size() > 0) {
                            out.println("<li >");
                            out.println("<a href=\"viewproduct.jsp?companyid=" + cit.getCompanyId() + "\">" + cit.getCompanyName() + "</a>");
                            out.println("</li>");
                        }
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