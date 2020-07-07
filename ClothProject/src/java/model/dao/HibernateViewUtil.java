package model.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;

public class HibernateViewUtil {

   /* private static String errormessage;

    public static String getErrormessage() {
        return errormessage;
    }

    public static List<CourseInfo> getAllCourses() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from CourseInfo");
            List<CourseInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<StudentInfo> getAllStudentInfo() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from StudentInfo");
            List<StudentInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<StudentInfo> getAllStudentInfoAccordingToCourse(String courseid) {
        try {
            SQLQuery query = HibernateUtil.getHibernateSession().createSQLQuery("select * from StudentInfo where rollno in ( select rollno from StudentCourseInfo where courseid = :cid )");
            query.setParameter("cid", courseid);
            query.addEntity(StudentInfo.class);
            List<StudentInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static CourseInfo getCourses(String courseid) {
        try {
            CourseInfo record = (CourseInfo) HibernateUtil.getHibernateSession().get(CourseInfo.class, courseid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static LoginInfo getUser(String username) {
        try {
            LoginInfo record = (LoginInfo) HibernateUtil.getHibernateSession().get(LoginInfo.class, username);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static StudentInfo getStudent(int rollno) {
        try {
            StudentInfo record = (StudentInfo) HibernateUtil.getHibernateSession().get(StudentInfo.class, rollno);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static StudentPhoto getStudentPhoto(int photoid) {
        try {
            StudentPhoto record = (StudentPhoto) HibernateUtil.getHibernateSession().get(StudentPhoto.class, photoid);
            return record;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<StudentCourseInfo> getStudentCourseDetails(String courseid, int rollno) {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from StudentCourseInfo where courseid = :cid and rollno = :rno");
            query.setParameter("cid", courseid);
            query.setParameter("rno", rollno);
            List<StudentCourseInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<StudentCourseInfo> getAllStudentCourseDetails() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from StudentCourseInfo");
            List<StudentCourseInfo> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }

    public static List<StudentPhoto> getAllStudentPhoto() {
        try {
            Query query = HibernateUtil.getHibernateSession().createQuery("from StudentPhoto");
            List<StudentPhoto> records = query.list();
            return records;
        } catch (Exception ex) {
            errormessage = ex.toString();
            return null;
        }
    }*/
}
