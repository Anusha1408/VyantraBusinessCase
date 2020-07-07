<%@page import="model.dao.HibernateUtil"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.dao.OrderInfoDAO"%>
<%@page import="model.to.OrderInfo"%>
<%

    if (request.getParameter("orderid") != null && request.getParameter("orderstatus") != null) {
        String orderid = request.getParameter("orderid").toString();
        String orderstatus = request.getParameter("orderstatus").toString();
        String shippingdate = request.getParameter("shippingdate");
        try {
            OrderInfo order = OrderInfoDAO.getRecord(Long.parseLong(orderid));
            if(order!=null){
                order.setOrderStatus(orderstatus);
                if(shippingdate!=null){
                    java.sql.Date date = java.sql.Date.valueOf(shippingdate);
                    order.setShippingDate(new Timestamp(date.getTime()));
                }
                HibernateUtil.updateRecord(order);
            }
        } catch (Exception ex) {

        }
    }
    response.sendRedirect("orders.jsp");

%>