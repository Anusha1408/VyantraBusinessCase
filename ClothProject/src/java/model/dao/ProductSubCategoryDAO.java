package model.dao;

import java.util.List;
import model.to.ProductSubCategory;
import org.hibernate.Query;

public class ProductSubCategoryDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<ProductSubCategory> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductSubCategory");
            List<ProductSubCategory> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static ProductSubCategory getRecord(int subcategoryid) {
        try {
            ProductSubCategory record = (ProductSubCategory) HibernateUtil.getHibernateSession().get(ProductSubCategory.class, subcategoryid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static List<ProductSubCategory> getAllRecord(String categoryid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductSubCategory where categoryId = :catid");
            query.setParameter("catid", categoryid);
            List<ProductSubCategory> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
