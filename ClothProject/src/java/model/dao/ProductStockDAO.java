package model.dao;

import java.util.List;
import model.to.ProductStock;
import org.hibernate.Query;

public class ProductStockDAO {
     private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<ProductStock> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductStock");
            List<ProductStock> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static ProductStock getRecord(int stockid) {
        try {
            ProductStock record = (ProductStock) HibernateUtil.getHibernateSession().get(ProductStock.class, stockid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
