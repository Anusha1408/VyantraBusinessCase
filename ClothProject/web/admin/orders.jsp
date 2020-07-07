<%@page import="model.dao.ProductPhotoDAO"%>
<%@page import="model.to.ProductPhoto"%>
<%@page import="model.to.OrderDetails"%>
<%@page import="model.dao.OrderDetailsDAO"%>
<%@page import="model.dao.OrderInfoDAO"%>
<%@page import="model.to.OrderInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="jumbotron">
            <h1>All Orders</h1>            
        </div>
        <%            List<OrderInfo> data = OrderInfoDAO.getAllRecord();
            if (data != null) {
                int i = 1;
                for (OrderInfo oit : data) {
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-12\" id=\"d1\" style=\" background-color:white;\" align=\"center\">");
                    out.println("<table class=\"table\">");
                    out.println("<caption style=\"caption-side:top;color:black;text-align:center;font-size:30px;font-weight:bolder;\">Order No: " + oit.getOrderId() + "</caption>");
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
                            + "src=\"../upimages/down.jpg\" "
                            + "height=\"50px\" width=\"50px\"></img>"
                            + "</td>");
                    out.println("</tr>");
                    out.println("<tr><td colspan=\"\" align=\"center\">");
                    String set_action = "setDetails('" + oit.getOrderId() + "','" + oit.getOrderStatus() 
                            + "','" + oit.getShippingDate() + "')";
                    out.println("<input data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"" + set_action + "\"  type=\"button\" class=\"btn btn-primary\" value=\"Update Order Status\">");
                    out.println("</td></tr>");
                    out.println("</table>");

                    List<OrderDetails> odt = OrderDetailsDAO.getAllRecord(oit.getOrderId());
                    int j = 1;
                    if (odt != null && odt.size() > 0) {
                        out.println("<div id=\"d" + oit.getOrderId() + "\" style=\"display:none;\">");
                        out.println("<table class=\"table table-bordered\">");
                        out.println("<caption style=\"caption-side:top;color:black;text-align:center;font-size:20px;font-weight:bolder;\">Order Details</caption>");
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
                            out.println("<td><img src=\"../upimages/"
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
                    out.println("</div>");
                }
                
            }
        %>
        <%@include file="footer.jsp" %>
        
        <!-- Request Form Modal -->
        <div class="modal fade " id="myModal">
            <div class="modal-dialog model-lg modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Update Order Status</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <form method="post" action="updateorder.jsp">
                                    <div class="form-group">
                                        <label for="orderid">Order ID: </label>
                                        <input type="text" readonly name="orderid" class="form-control" 
                                               id="orderid">
                                    </div>
                                    <div class="form-group">
                                        <label for="orderstatus">Enter Order Status : </label>
                                        <textarea name="orderstatus"  class="form-control"
                                                  id="orderstatus"></textarea>
                                    </div> 
                                    <div class="form-group">
                                        <label for="request_text">Choose Shipping Date : </label>
                                        <input type="date" name="shippingdate" class="form-control" 
                                               id="shippingdate">
                                    </div> 
                                    <input type="submit" name="submit" class="btn btn-primary btn-block" value="Update Order Status">
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <script type="text/javascript">
            function show_div(val) {
                var id = "#d" + val;
                $(id).toggle(2000);
            }
            function setDetails(oid,status,ship_date){
                $("#orderid").val(oid);
                $("#orderstatus").val(status);
                $("#shippingdate").val(ship_date);
            }
        </script>
    </body>
</html>