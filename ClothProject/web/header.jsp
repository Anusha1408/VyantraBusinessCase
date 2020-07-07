<%@page import="java.util.List"%>
<%@page import="model.dao.CompanyInfoDAO"%>
<%@page import="model.to.CompanyInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CartItemDAO"%>
<%@page import="model.to.CartItem"%>
<div class="header">
    <div class="container">
        <div class="header_top">
            <ul class="phone">
                <li class="phone_left"><i class="mobile"> </i><span>1-200-346-2986</span></li>
                <li class="phone_right">Free Ground Shipping for Products over
                    Rs. 1000</li>
                <div class="clearfix"></div>
            </ul>
            <ul class="social">
                <!--  	<li><a href=""> <i class="tw"> </i>
                        </a></li>
                        <li><a href=""><i class="fb"> </i> </a></li>
                        <li><a href=""><i class="rss"> </i> </a></li>
                        <li><a href=""><i class="msg"> </i> </a></li>-->
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <div class="clearfix"></div>
            </ul>
            <ul class="account">
                <%
                    if (session.getAttribute("uuname") != null) {
                        String username = session.getAttribute("uuname").toString();
                        out.println("<li><a href=\"viewcart.jsp\">" + username + "</a></li>");
                    } else {
                        out.println("<li><a href=\"login.jsp\">My Account</a></li>");
                    }
                %>
            </ul>
            <ul class="shopping_cart">
                <%
                    if (session.getAttribute("uuname") != null) {
                        if (session.getAttribute("cartid") != null) {
                            int cartid = Integer.parseInt(session
                                    .getAttribute("cartid").toString());
                            List<CartItem> all_cart_items = CartItemDAO.getCartItemsAccordingToCartId(cartid);
                            int quantity = 0;
                            int sum = 0;
                            if (all_cart_items != null && all_cart_items.size() > 0) {
                                for (CartItem item : all_cart_items) {
                                    quantity += item.getQuantity();
                                    sum += item.getQuantity() * item.getPrice();
                                }
                            }
                            out.println("<a href=\"viewcart.jsp\"><li class=\"shop_left\"><i class=\"cart\"></i><span>Shop "
                                    + quantity + "</span></li></a>");
                            out.println("<a href=\"viewcart.jsp\"><li class=\"shop_right\"><span>Rs. "
                                    + sum + "</span></li></a>");
                        } else {
                            out.println("<a href=\"viewcart.jsp\"><li class=\"shop_left\"><i class=\"cart\"></i><span>Shop</span></li></a>");
                            out.println("<a href=\"viewcart.jsp\"><li class=\"shop_right\"><span>Rs. 0.00</span></li></a>");
                        }
                    } else {
                        out.println("<a href=\"login.jsp\"><li class=\"shop_left\"><i class=\"cart\"></i><span>Shop</span></li></a>");
                        out.println("<a href=\"login.jsp\"><li class=\"shop_right\"><span>Rs. 0.00</span></li></a>");
                    }
                %>
                <div class="clearfix"></div>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="header_bottom">
            <div class="header_nav">
                <div class="logo">
                    <a href="index.jsp"><img id="log" width=120px height=117px src="upimages/logo1.jpg" alt="" /><br></a>
                </div>
                <nav class="navbar navbar-default menu" role="navigation">
                    <h3 class="nav_right">
                        <a href="index.jsp"><img id="log" width=120px height=117px src="upimages/logo1.jpg"
                                                 class="img-responsive" alt="" /></a>
                    </h3>
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle"
                                    data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span>
                            </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse"
                             id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav menu1">
                                <li><a href="index.jsp">HOME</a></li>
                                <li><a href="brands.jsp">BRANDS</a></li>
                                    <%
                                        if (session.getAttribute("uuname") != null) {
                                            out.println("<li><a href=\"vieworder.jsp\">MY ORDERS</a></li>");
                                        }
                                    %>         
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                            <ul class="login">
                                <%
                                    if (session.getAttribute("uuname") != null) {
                                        out.println("<a href=\"signout.jsp\"><li class=\"login_top\"><i class=\"sign\"></i><span>Sign Out</span></li></a>");
                                    } else {
                                        out.println("<a href=\"login.jsp\"><li class=\"login_top\"><i class=\"sign\"></i><span>Sign In</span></li></a>");
                                        out.println("<a href=\"register.jsp\"><li class=\"login_bottom\"><i class=\"register\"> </i><span>Register</span></li></a>");
                                    }
                                %>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <div class="clearfix"></div>
            </div>
            <div class="search">
                <input type="text" class="text" value="Enter Product Details"
                       onfocus="this.value = '';"
                       onblur="if (this.value == '') {
                                   this.value = 'Enter Product Details';
                               }">
                <input type="submit" value="Search">
            </div>
        </div>
    </div>
</div>
