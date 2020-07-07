package model.dao;

import java.util.List;
import model.to.OrderDetails;
import org.hibernate.Query;

public class OrderDetailsDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<OrderDetails> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from OrderDetails");
            List<OrderDetails> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static List<OrderDetails> getAllRecord(long orderid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from OrderDetails where orderId = :oid");
            query.setParameter("oid", orderid);
            List<OrderDetails> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static OrderDetails getRecord(int detailid) {
        try {
            OrderDetails record = (OrderDetails) HibernateUtil.getHibernateSession().get(OrderDetails.class, detailid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
