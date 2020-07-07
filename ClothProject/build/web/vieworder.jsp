<%@page import="model.dao.ProductPhotoDAO"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="model.to.OrderDetails"%>
<%@page import="model.dao.OrderDetailsDAO"%>
<%@page import="model.dao.OrderInfoDAO"%>
<%@page import="model.to.OrderInfo"%>
<%@page import="java.util.List"%>
<%
    response.setHeader("Cache-Control", "no-cache");//HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching 
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    if (session.getAttribute("uuname") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>View Orders</title>
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
        <script type="text/javascript"src="jQuery.js"></script>
        <script type="text/javascript">
            function show_div(val){
                var id = "#d" + val;
                $(id).slideToggle("slow");
            }
        </script>
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

        <jsp:include page="header.jsp"></jsp:include>
            <div class="main">
                <div class="container">
                    <div class="Product_top">
                    <%
                        String username = session.getAttribute("uuname").toString();
                        List<OrderInfo> data = OrderInfoDAO.getAllRecord(username);
                        if (data != null) {
                            int i = 1;
                            out.println("<div style=\"list-style:none\">");
                            for (OrderInfo oit : data) {

                                out.println("<div id=\"d1\" style=\" background-color:white;\" align=\"center\">");
                                out.println("<table class=\"table\">");
                                out.println("<caption style=\"text-align:center;font-size:30px;font-weight:bolder;\">Order No: " + oit.getOrderId() + "</caption>");
                                out.println("<tr>");
                                out.println("<td> Order Date:<br> " + oit.getOrderDate()
                                        + "</td>");
                                out.println("<td>");
                                out.println("Delivery Address:<br> " + oit.getShippingAddress());
                                out.println("</td>");
                                out.println("<td> Order Status: <br>" + oit.getOrderStatus()
                                        + "</td>");
                                out.println("<td>");
                                out.println("Shipping Date: <br>");
                                if (oit.getShippingDate() == null) {
                                    out.println("Not Shipped Yet.");
                                } else {
                                    out.println(oit.getShippingDate());
                                }
                                out.println("</td>");
                                out.println("<td>");
                                out.println("Payment Mode: <br>" + oit.getPayment());
                                out.println("</td>");
                                out.println("<td><img onclick=\"show_div('" + oit.getOrderId() + "')\" "
                                        + "src=\"upimages/down.jpg\" "
                                        + "height=\"50px\" width=\"50px\"></img>"
                                        + "</td>");
                                out.println("</tr>");
                                out.println("</table>");

                                List<OrderDetails> odt = OrderDetailsDAO.getAllRecord(oit.getOrderId());
                                int j = 1;
                                if (odt != null && odt.size() > 0) {
                                    out.println("<div id=\"d" + oit.getOrderId() + "\" style=\"display:none;\">");
                                    out.println("<table class=\"table table-bordered\">");
                                    out.println("<caption style=\"text-align:center;font-size:20px;font-weight:bolder;\">Order Details</caption>");
                                    out.println("<tr>");
                                    out.println("<th>Item No</th>");
                                    out.println("<th>Photo</th>");
                                    out.println("<th>Cloth Name</th>");
                                    out.println("<th>Price</th>");
                                    out.println("<th>Quantity</th>");
                                    out.println("<th>Total Price</th>");
                                    out.println("</tr>");
                                    double granttotal = 0;
                                    for (OrderDetails ord : odt) {
                                        out.println("<tr style=\" background-color:#8FCEEF;\" align=\"center\">");
                                        out.println("<td>" + j + "."
                                                + "</td>");
                                        String photoname = "nopic.jpg";
                                        List<ProductPhoto> photos = ProductPhotoDAO.getProductPhoto(ord.getProduct().getProductId());
                                        if (photos != null && photos.size() > 0) {
                                            photoname = photos.get(0).getPhotoId() + "." + photos.get(0).getExtNam();
                                        }
                                        out.println("<td><img src=\"upimages/"
                                                + photoname + "\" height=\"100\" width=\"100\"></img>"
                                                + "</td>");

                                        out.println("<td>"
                                                + ord.getProduct().getProductName() + "</span>");
                                        out.println("<td>" + ord.getPrice()
                                                + "</td>");
                                        out.println("<td>"
                                                + ord.getQuantity() + "</td>");
                                        out.println("<td>");
                                        out.println(ord.getQuantity() * ord.getPrice());
                                        out.println("</td>");
                                        out.println("</tr>");
                                        j++;
                                        granttotal += (ord.getQuantity() * ord.getPrice());
                                    }
                                    double shippingcharges = 0;
                                    if (granttotal < 1000) {
                                        shippingcharges += 100;
                                    }
                                    double tax = granttotal / 100 * 12;
                                    out.println("<tr>");
                                    out.println("<td colspan=\"5\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Shipping Charges: </td>");
                                    out.println("<td>Rs. " + shippingcharges + "</td>");
                                    out.println("</tr>");
                                    out.println("<td colspan=\"5\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Tax (12%): </td>");
                                    out.println("<td>Rs. " + tax + "</td>");
                                    out.println("</tr>");
                                    out.println("<td colspan=\"5\" align=\"right\" style=\"font-weight:bolder;font-size:20px\">Grand Total: </td>");
                                    granttotal += tax + shippingcharges;
                                    out.println("<td>Rs. " + granttotal + "</td>");
                                    out.println("</tr>");
                                    out.println("</table>");
                                    out.println("</div>");
                                }
                                out.println("</div>");
                                i++;
                            }
                            out.println("</div>");
                        }
                    %>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>


    </body>
</html>