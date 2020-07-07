package model.dao;

import java.util.List;
import model.to.CartItem;
import org.hibernate.Query;

public class CartItemDAO {
     private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<CartItem> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CartItem");
            List<CartItem> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static CartItem getRecord(int itemid) {
        try {
            CartItem record = (CartItem) HibernateUtil.getHibernateSession().get(CartItem.class, itemid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static List<CartItem> getCartItemsAccordingToCartId(int cartid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CartItem where cartId = :cid");
            query.setParameter("cid", cartid);
            List<CartItem> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static CartItem getCartItemAccordingToCartIdandProductId(int cartid,int productid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CartItem where cartId = :cid and productId = :pid");
            query.setParameter("cid", cartid);
            query.setParameter("pid", productid);
            List<CartItem> records = query.list();
            if(records!=null && records.size() > 0){
                return records.get(0);
            }else{
                return null;
            }
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
