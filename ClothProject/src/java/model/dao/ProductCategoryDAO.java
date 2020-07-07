package model.dao;

import java.util.List;
import model.to.ProductCategory;
import org.hibernate.Query;

public class ProductCategoryDAO {
     private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<ProductCategory> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductCategory");
            List<ProductCategory> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static ProductCategory getRecord(String categoryid) {
        try {
            ProductCategory record = (ProductCategory) HibernateUtil.getHibernateSession().get(ProductCategory.class, categoryid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
