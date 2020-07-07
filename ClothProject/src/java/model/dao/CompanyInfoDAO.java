package model.dao;

import java.util.List;
import model.to.CompanyInfo;
import org.hibernate.Query;

public class CompanyInfoDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<CompanyInfo> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CompanyInfo");
            List<CompanyInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static CompanyInfo getRecord(String companyid) {
        try {
            CompanyInfo record = (CompanyInfo) HibernateUtil.getHibernateSession().get(CompanyInfo.class, companyid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
}
