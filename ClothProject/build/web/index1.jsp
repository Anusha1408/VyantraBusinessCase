<%@page import="model.dao.ProductPhotoDAO"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="operational.Checks"%>
<%@page import="model.dao.ProductInfoDAO"%>
<%@page import="model.to.ProductInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
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
            function show(val) {
                //alert($(val).html());
                $(val).children("ul").slideToggle(1000);
            }
            function f1() {
                document.getElementById("ban").src = "upimages/banner1.jpg";
                setTimeout("f2()", 3000);
            }
            function f2() {
                document.getElementById("ban").src = "upimages/banner2.jpg";
                setTimeout("f3()", 3000);
            }
            function f3() {
                document.getElementById("ban").src = "upimages/banner3.jpg";
                setTimeout("f1()", 3000);
            }
        </script>
        <!----webfonts---->
    </head>
    <body onload="f1()">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="main">
                <div class="container">
                <jsp:include page="banner.jsp"></jsp:include>
                    <div class="row content">
                    <jsp:include page="side.jsp"></jsp:include>
                        <div class="col-md-9">
                            <ul class="feature">
                                <h3>
                                    <i class="arrow"> </i><span>All Products</span>
                                </h3>
                            </ul>
                        <%
                            List<ProductInfo> allProducts = null;
                            if (request.getParameter("subcategoryid") != null) {
                                String scid = request.getParameter("subcategoryid");
                                if (Checks.isNumeric(scid)) {
                                    int sid = Integer.parseInt(scid);
                                    allProducts = ProductInfoDAO.viewRecordPhotoForSubCategoryId(sid);
                                }
                            } else {
                                allProducts = new ProductInfoDAO().getRandomProduct();
                            }

                            if (allProducts != null) {
                                int i = 0;
                                for (ProductInfo pit : allProducts) {
                                    if (i == 0) {
                                        out.println("<div class=\"row content_bottom\">");
                                    }
                                    i++;
                                    String photoname = "nopic.jpg";
                                    List<ProductPhoto> photos = ProductPhotoDAO.getProductPhoto(pit.getProductId());
                                    if(photos!=null && photos.size() > 0){
                                        photoname = photos.get(0).getPhotoId() + "." + photos.get(0).getExtNam();
                                    }
                                    out.println("<div class=\"col-md-3\">");
                                    out.println("<div class=\"content_box\">");
                                    out.println("<a href=\"single.jsp?productid="
                                            + pit.getProductId() + "\">");
                                    out.println("<div class=\"view view-fifth\">");
                                    out.println("<img src=\"upimages/"
                                            + photoname
                                            + "\" width=\"190px\" height=\"141px\" class=\"img-responsive\" alt=\"\" />");
                                    out.println("<div class=\"content_box-grid\">");
                                    out.println("<p class=\"m_1\">" + pit.getProductName()
                                            + "</p>");
                                    out.println("<div class=\"price\">");
                                    out.println("Price: <span class=\"actual\"> Rs. "
                                            + pit.getPrice() + "</span>");
                                    out.println("</div>");
                                    out.println("<ul class=\"product_but\">");
                                    if (session.getAttribute("uuname") != null) {
                                        out.println("<li class=\"but3\"><a href=\"insertToCart?productid="
                                                + pit.getProductId() + "\">Buy</a></li>");
                                    } else {
                                        out.println("<li class=\"but3\"><a href=\"login.jsp\">Buy</a></li>");
                                    }
                                    out.println("<li class=\"like\"><span>120</span><i class=\"like1\">");
                                    out.println("</i></li>");
                                    out.println("<div class=\"clearfix\"></div>");
                                    out.println("</ul>");
                                    out.println("<div class=\"mask\">");
                                    out.println("<div class=\"info\">Quick View</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    out.println("</a>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    if (i == 4) {
                                        out.println("</div>");
                                        i = 0;
                                    }
                                }
                                if (i != 0) {
                                    out.println("</div>");
                                }
                            }
                        %>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>