<%
    String address = request.getParameter("address");
    String action = request.getParameter("action");
    String total = request.getParameter("total");
    if (address != null && action != null && total != null) {
        if (address.isEmpty()) {
            response.sendRedirect("checkout.jsp");
        } else {
            session.setAttribute("address", address);
            if (action.contains("COD")) {
                session.setAttribute("payment", "COD");
                response.sendRedirect("insertOrderInfo");
            } else {
                session.setAttribute("total", total);
                response.sendRedirect("payuform.jsp");
            }
        }
    } else {
        response.sendRedirect("checkout.jsp");
    }

%>