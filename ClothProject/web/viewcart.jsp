<%@page import="model.dao.ProductPhotoDAO"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="model.to.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.CartItemDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>View Cart Items</title>
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
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");//HTTP 1.1 
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
            response.setDateHeader("Expires", 0); //prevents caching 
            response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
            if (session.getAttribute("uuname") == null && request.getHeader("referer") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="main">
                <div class="container">
                    <div class="Product_top">
                        <div style=" background-color:white">
                        <%
                            if (session.getAttribute("cartid") != null) {
                                int sum = 0;
                                int cartid = Integer.parseInt(session.getAttribute("cartid")
                                        .toString());

                                List<CartItem> cart = CartItemDAO.getCartItemsAccordingToCartId(cartid);
                                if (cart != null) {

                                    out.println("<table class=\"table table-bordered\">");
                                    out.println("<caption style=\"text-align:center;font-size:30px;font-weight:bolder;\">Cart Details</caption>");
                                    out.println("<tr>");
                                    out.println("<th>Sr No</th>");
                                    out.println("<th>Photo</th>");
                                    out.println("<th>Name</th>");
                                    out.println("<th>Description</th>");
                                    out.println("<th>Price</th>");
                                    out.println("<th>Quantity</th>");
                                    out.println("<th align=\"right\">Total</th>");
                                    out.println("<th align=\"right\">Delete</th>");
                                    out.println("</tr>");

                                    int i = 1;
                                    for (CartItem cit : cart) {
                                        String photoname = "nopic.jpg";
                                        List<ProductPhoto> photos = ProductPhotoDAO.getProductPhoto(cit.getProduct().getProductId());
                                        if (photos != null && photos.size() > 0) {
                                            photoname = photos.get(0).getPhotoId() + "." + photos.get(0).getExtNam();
                                        }

                                        out.println("<tr>");
                                        out.println("<td >" + i + "</td>");
                                        i++;
                                        out.println("<td align=\"left\"><img src=\"upimages/"
                                                + photoname + "\" style=\"width:200px;height:200px\"></img></td>");
                                        out.println("<td  align=\"left\">"
                                                + cit.getProduct().getProductName() + "</td>");
                                        out.println("<td >" + cit.getProduct().getDescription()
                                                + "</td>");
                                        out.println("<td align=\"left\">"
                                                + cit.getPrice() + "</td>");
                                        out.println("<td  align=\"left\">"
                                                + cit.getQuantity() + "</td>");
                                        out.println("<td >" + (cit.getQuantity()
                                                * cit.getPrice()) + "</td>");
                                        out.println("<td ><a class=\"btn btn-danger\" href=\"deleteCartItem?itemid="
                                                + cit.getItemId()
                                                + "\" onclick=\"confirm('Do You want to Delete this item?')\">Delete</></td>");
                                        out.println("</tr>");
                                        sum += cit.getQuantity() * cit.getPrice();
                                    }
                                    double shippingcharges = 0;
                                    if (sum < 1000) {
                                        shippingcharges += 100;
                                    }
                                    double tax = sum / 100 * 12;
                                    out.println("<tr>");
                                    out.println("<td colspan=\"6\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Shipping Charges: </td>");
                                    out.println("<td>Rs. " + shippingcharges + "</td><td></td>");
                                    out.println("</tr>");
                                    out.println("<td colspan=\"6\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Tax (12%): </td>");
                                    out.println("<td>Rs. " + tax + "</td><td></td>");
                                    out.println("</tr>");
                                    out.println("<td colspan=\"6\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Grand Total: </td>");
                                    sum += tax + shippingcharges;
                                    out.println("<td>Rs. " + sum + "</td><td></td>");
                                    out.println("</tr>");

                                    out.println("</table>");
                                    out.println("<div class=\"btn_form\" align=\"center\">");
                                    out.println("<form method=\"post\" action=\"checkout.jsp\">");                                    
                                    out.println("<input type=\"submit\" value=\"checkout\">");
                                    out.println("<input type=\"hidden\" name=\"total\" value=\"" + sum + "\">");
                                    out.println("</form>");
                                    out.println("</div>");
                                } else {
                                    out.println("<h1 align=\"center\">There are No Items Yet</h1>");
                                }
                            } else {
                                out.println("<h1 align=\"center\">There are No Items Yet</h1>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>