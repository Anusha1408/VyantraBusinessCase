package model.dao;

import java.util.List;
import model.to.CartInfo;
import org.hibernate.Query;

public class CartInfoDAO {
    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<CartInfo> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CartInfo");
            List<CartInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static CartInfo getRecord(int cartid) {
        try {
            CartInfo record = (CartInfo) HibernateUtil.getHibernateSession().get(CartInfo.class, cartid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static CartInfo getUserCart(String username) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CartInfo where userName = :uname and isOrder = 0");
            query.setParameter("uname", username);
            List<CartInfo> records = query.list();
            System.out.println(" GOODODOODOD ");
            if(records!=null && records.size() > 0){
                return records.get(0);
            }
            return null;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
}
