package model.dao;

import java.util.List;
import model.to.OrderInfo;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

public class OrderInfoDAO {
     private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<OrderInfo> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from OrderInfo order by orderId desc");
            List<OrderInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static List<OrderInfo> getAllRecord(String username) {
        try {
            SQLQuery query = HibernateUtil.getHibernateSession().createSQLQuery("select * from OrderInfo where userName = :uname order by orderId desc");
            query.setParameter("uname", username);
            query.addEntity(OrderInfo.class);
            List<OrderInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static OrderInfo getRecord(long orderid) {
        try {
            OrderInfo record = (OrderInfo) HibernateUtil.getHibernateSession().get(OrderInfo.class, orderid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
