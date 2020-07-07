package operational;

import java.sql.Date;

public class Checks {

    public static boolean isEmpty(String value) {
        return value.equals("");
    }

    public static boolean isNumeric(String value) {
        try {
            Integer.parseInt(value);
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }

    }

    public static boolean isDate(String date) {
        try {
            Date.valueOf(date);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

}
