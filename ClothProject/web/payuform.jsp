<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>


<%!
    public boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }
%>
<%!
    public String hashCal(String type, String str) {
        byte[] hashseq = str.getBytes();
        StringBuffer hexString = new StringBuffer();
        try {
            MessageDigest algorithm = MessageDigest.getInstance(type);
            algorithm.reset();
            algorithm.update(hashseq);
            byte messageDigest[] = algorithm.digest();

            for (int i = 0; i < messageDigest.length; i++) {
                String hex = Integer.toHexString(0xFF & messageDigest[i]);
                if (hex.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(hex);
            }

        } catch (NoSuchAlgorithmException nsae) {
        }

        return hexString.toString();

    }
%>
<%
    String total = session.getAttribute("total")!= null ? session.getAttribute("total").toString() : "0";
    String address = session.getAttribute("address") != null ? session.getAttribute("address").toString() : "";
%>
<%    
    
    
    String merchant_key = "yoxcWQG6";
    String salt = "KfuAiZg54x";
    String action1 = "";
    String base_url = "https://sandboxsecure.payu.in";
    int error = 0;
    String hashString = "";

    Enumeration paramNames = request.getParameterNames();
    Map<String, String> params = new HashMap<String, String>();
    while (paramNames.hasMoreElements()) {
        String paramName = (String) paramNames.nextElement();

        String paramValue = request.getParameter(paramName);

        params.put(paramName, paramValue);
    }
    params.put("amount", total);
    params.put("address1",address);
    params.put("productinfo", "Cloths");
    String txnid = "";
    if (empty(params.get("txnid"))) {
        Random rand = new Random();
        String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
        txnid = hashCal("SHA-256", rndm).substring(0, 20);
    } else {
        txnid = params.get("txnid");
    }
    String udf2 = txnid;
    String txn = "abcd";
    String hash = "";
    String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
    if (empty(params.get("hash")) && params.size() > 0) {
        if (empty(params.get("key"))
                || empty(params.get("txnid"))
                || empty(params.get("amount"))
                || empty(params.get("firstname"))
                || empty(params.get("email"))
                || empty(params.get("phone"))
                || empty(params.get("productinfo"))
                || empty(params.get("surl"))
                || empty(params.get("furl"))
                || empty(params.get("service_provider"))) {
            error = 1;
        } else {
            String[] hashVarSeq = hashSequence.split("\\|");

            for (String part : hashVarSeq) {
                hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                hashString = hashString.concat("|");
            }
            hashString = hashString.concat(salt);

            hash = hashCal("SHA-512", hashString);
            action1 = base_url.concat("/_payment");
        }
    } else if (!empty(params.get("hash"))) {
        hash = params.get("hash");
        action1 = base_url.concat("/_payment");
    }


%>
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
            var hash = '<%= hash%>';
            function submitPayuForm() {

                if (hash == '')
                    return;

                var payuForm = document.forms.payuForm;
                payuForm.submit();
            }
        </script>
    </head>

    <body onload="submitPayuForm();">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="main">
                <div class="container">
                    <div class="Product_top">

                        <form action="<%= action1%>" method="post" name="payuForm">
                        <input type="hidden" name="key" value="<%= merchant_key%>" />
                        <input type="hidden" name="hash" value="<%= hash%>"/>
                        <input type="hidden" name="txnid" value="<%= txnid%>" />
                        <input type="hidden" name="udf2" value="<%= txnid%>" />
                        <input type="hidden" name="service_provider" value="payu_paisa" />
                        <table class="table">

                            <tr>
                                <td>Payable Amount: </td>
                                <td><input name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount")%>" /></td>
                                <td>First Name: </td>
                                <td><input name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname")%>" /></td>
                            </tr>
                            <tr>
                                <td>Email: </td>
                                <td><input name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email")%>" /></td>
                                <td>Phone: </td>
                                <td><input name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone")%>" /></td>
                            </tr>
                            <tr  style="display:none">
                                <td>Product Info: </td>
                                <td colspan="3"><input name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo")%>" size="64" /></td>
                            </tr>
                            <tr  style="display:none">
                                <td>Success URI: </td>
                                <td colspan="3"><input name="surl" value="http://localhost:8084/ClothProject/process_payment.jsp" size="64" /></td>
                            </tr>
                            <tr  style="display:none">
                                <td>Failure URI: </td>
                                <td colspan="3"><input name="furl" value="http://localhost:8084/ClothProject/failure.jsp" size="64" /></td>
                            </tr>
                            <tr>
                                <td><b>Optional Parameters</b></td>
                            </tr>
                            <tr  style="display:none">
                                <td>Last Name: </td>
                                <td><input name="lastname" id="lastname" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname")%>" /></td>
                                <td>Cancel URI: </td>
                                <td><input name="curl" value="" /></td>
                            </tr>
                            <tr>
                                <td>Address1: </td>
                                <td><input name="address1" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1")%>" /></td>
                                <td>Address2: </td>
                                <td><input name="address2" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2")%>" /></td>
                            </tr>
                            <tr>
                                <td>City: </td>
                                <td><input name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city")%>" /></td>
                                <td>State: </td>
                                <td><input name="state" value="<%= (empty(params.get("state"))) ? "" : params.get("state")%>" /></td>
                            </tr>
                            <tr>
                                <td>Country: </td>
                                <td><input name="country" value="<%= (empty(params.get("country"))) ? "" : params.get("country")%>" /></td>
                                <td>Zipcode: </td>
                                <td><input name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode")%>" /></td>
                            </tr>
                            <tr  style="display:none">
                                <td>UDF1: </td>
                                <td><input name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1")%>" /></td>

                            <tr  style="display:none">
                                <td>UDF3: </td>
                                <td><input name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3")%>" /></td>
                                <td>UDF4: </td>
                                <td><input name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4")%>" /></td>
                            </tr>
                            <tr style="display:none">
                                <td>UDF5: </td>
                                <td><input name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5")%>" /></td>
                                <td>PG: </td>
                                <td><input name="pg" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg")%>" /></td>
                            </tr>
                            <tr>
                                <% if (empty(hash)) { %>
                                <td colspan="4"><input class="btn btn-primary" type="submit" value="Proceed to Pay Given Amount" /></td>
                                    <% }%>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>