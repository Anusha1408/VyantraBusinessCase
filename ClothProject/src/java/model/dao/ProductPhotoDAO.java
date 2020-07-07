package model.dao;

import java.util.List;
import model.to.ProductPhoto;
import org.hibernate.Query;

public class ProductPhotoDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<ProductPhoto> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductPhoto");
            List<ProductPhoto> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static ProductPhoto getRecord(int photoid) {
        try {
            ProductPhoto record = (ProductPhoto) HibernateUtil.getHibernateSession().get(ProductPhoto.class, photoid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static List<ProductPhoto> getProductPhoto(int productid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductPhoto where productId = :pid");
            query.setParameter("pid", productid);
            List<ProductPhoto> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
