package controller;

import java.util.List;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DBController {

    public static boolean loginUser(String email, String password) {
        boolean isSuccessful = true;

        Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT * FROM customer WHERE email= '" + email + "' AND password= '" + password + "'");
        List result = query.list();
        transaction.commit();
        session.flush();
        session.close();
        if (result.isEmpty()) {
            isSuccessful = false;
        }
        
        return isSuccessful;
    }

}
