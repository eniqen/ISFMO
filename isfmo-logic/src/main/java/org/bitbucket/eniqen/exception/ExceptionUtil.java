package org.bitbucket.eniqen.exception;

/**
 * Created by Mikhail on 30.12.2015.
 */
public class ExceptionUtil {
    private static final LoggerWrapper LOG = LoggerWrapper.get(ExceptionUtil.class);

    public static void check(boolean found, long id) {
        check(found, "id=" + id);
    }

    public static void check(boolean found, String msg) {
        if (!found) throw LOG.getNotFoundException("Not found entity with " + msg);
    }

    public static <T> T check(T object, long id) {
        return check(object, "id=" + id);
    }

    public static <T> T check(T object, String msg) {
        check(object != null, msg);
        return object;
    }
}
