<%@page import="model.dao.ProductInfoDAO"%>
<%@page import="model.to.ProductInfo"%>
<%@page import="java.util.List"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="model.dao.ProductPhotoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Item Details</title>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript">

        </script>
    </script>
    <!----webfonts---->
    <link
        href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
        rel='stylesheet' type='text/css'>
    <!----details-product-slider--->
    <!-- Include the Etalage files -->
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.etalage.min.js"></script>
    <!-- Include the Etalage files -->
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
    <script>

        function show(val) {
            //alert($(val).html());
            $(val).children("ul").slideToggle(1000);
        }

        jQuery(document)
                .ready(
                        function ($) {

                            $('#etalage')
                                    .etalage(
                                            {
                                                thumb_image_width: 300,
                                                thumb_image_height: 400,

                                                show_hint: true,
                                                click_callback: function (
                                                        image_anchor, instance_id) {
                                                    alert('Callback example:\nYou clicked on an image with the anchor: "'
                                                            + image_anchor
                                                            + '"\n(in Etalage instance: "'
                                                            + instance_id + '")');
                                                }
                                            });
                            // This is for the dropdown list example:
                            $('.dropdownlist').change(
                                    function () {
                                        etalage_show($(this)
                                                .find('option:selected').attr(
                                                'class'));
                                    });

                        });
    </script>
    <!----//details-product-slider--->
</head>
<body>
    <!-- include header here -->
    <jsp:include page="header.jsp"></jsp:include>
        <div class="main">
            <div class="container">
                <div class="single">
                    <div class="row content">
                        <!-- include category here -->
                    <jsp:include page="side.jsp"></jsp:include>
                        <div class="col-md-9">
                            <div class="single_image">
                                <ul id="etalage">
                                    <li><a href="#"> 
                                        <%
                                            String productid = request.getParameter("productid");
                                            if (productid != null) {
                                                int pid = Integer.parseInt(productid);
                                                List<ProductPhoto> ppt = ProductPhotoDAO.getProductPhoto(pid);
                                                if (ppt != null && ppt.size() > 0) {
                                                    int i = 0;
                                                    for (ProductPhoto p : ppt) {
                                                        if (i != 0) {
                                                            out.println("<li>");
                                                        }
                                                        out.println("<img class=\"etalage_thumb_image\"  src=\"upimages/"
                                                                + p.getPhotoId()
                                                                + "."
                                                                + p.getExtNam()
                                                                + "\" class=\"img-responsive\" alt=\"\"/>");
                                                        out.println("<img class=\"etalage_source_image\"  src=\"upimages/"
                                                                + p.getPhotoId()
                                                                + "."
                                                                + p.getExtNam()
                                                                + "\" class=\"img-responsive\" alt=\"\"/>");
                                                        if (i == 0) {
                                                            out.println("</a>");
                                                            i++;
                                                        }
                                                        out.println("</li>");
                                                    }
                                                }
                                            }
                                        %> 
                                        </div>
                                        <div class="single_right">
                                            <%
                                                productid = request.getParameter("productid");
                                                if (productid != null) {
                                                    int proid = Integer.parseInt(productid);
                                                    ProductInfo pit = ProductInfoDAO.getRecord(proid);
                                                    out.println("<h3>" + pit.getProductName() + "</h3>");

                                                    out.println("<p class=\"m_5\">"
                                                            + pit.getDescription() + "</p>");
                                                    float price = pit.getPrice();
                                            %>
                                            <div class="price_single">
                                                <span class="actual1"><%=price%></span>
                                            </div>

                                            <div class="btn_form">
                                                <a href="insertToCart?productid=<%=proid%>"><input type="submit" value="buy now" title=""></a>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!-- include footer here -->
                                        <jsp:include page="footer.jsp"></jsp:include>
                                        </body>
                                        </html>