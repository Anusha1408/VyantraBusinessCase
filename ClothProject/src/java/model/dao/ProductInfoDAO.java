package model.dao;

import java.util.List;
import model.to.CartItem;
import model.to.ProductInfo;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

public class ProductInfoDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<ProductInfo> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductInfo");
            List<ProductInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static ProductInfo getRecord(int productid) {
        try {
            ProductInfo record = (ProductInfo) HibernateUtil.getHibernateSession().get(ProductInfo.class, productid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<ProductInfo> viewRecordPhotoForSubCategoryId(int subcategoryid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductInfo where subCategoryId = :sid");
            query.setParameter("sid", subcategoryid);
            List<ProductInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<ProductInfo> getAllProductByCompanyID(String companyid) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from ProductInfo where companyId = :cid");
            query.setParameter("cid", companyid);
            List<ProductInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<ProductInfo> getRandomProduct() {
        try {
            SQLQuery query = HibernateUtil.getHibernateSession().createSQLQuery("select * from ProductInfo order by rand() limit 12 ");
            query.addEntity(ProductInfo.class);
            List<ProductInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

}
