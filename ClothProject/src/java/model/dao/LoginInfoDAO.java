package model.dao;

import java.util.List;
import model.to.LoginInfo;
import org.hibernate.Query;

public class LoginInfoDAO {

    private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<LoginInfo> getAllRecord() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from LoginInfo");
            List<LoginInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }
    
    public static LoginInfo getRecord(String username) {
        try {
            LoginInfo record = (LoginInfo) HibernateUtil.getHibernateSession().get(LoginInfo.class, username);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

}
