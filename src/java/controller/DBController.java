package controller;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import model.Category;
import model.Customer;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Product;

public class DBController {

    public static boolean loginUser(String email, String password) {
        boolean isSuccessful = true;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM customer WHERE email= :email AND password= :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            List result = query.list();
            if (result.isEmpty()) {
                isSuccessful = false;
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return isSuccessful;
    }

    public static boolean RegisterUser(Customer customer) {
        boolean isSuccessful = true;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("INSERT INTO customer(email,userName,password) VALUES (:email,:username,:password)");
            query.setParameter("email", customer.getEmail());
            query.setParameter("username", customer.getUserName());
            query.setParameter("password", customer.getPassword());
            session.save(customer);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return isSuccessful;
    }

    public static List<Category> getCategories() {
        List<Category> categories;
        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM category")
                    .addEntity(Category.class);
            categories = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return categories;
    }

    public static List<Product> getProductForCategory(String categoryName) {
        List<Integer> ids;
        List<Product> products = new ArrayList<>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT product_id FROM category_has_product WHERE category_name='" + categoryName + "'");
            ids = query.list();
            for (Integer id : ids) {
                Product product = getProductWith(id);
                products.add(product);
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return products;
    }

    public static Product getProductWith(int id) {
        List<Product> product = null;
        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM product WHERE id='" + id + "' LIMIT 1")
                    .addEntity(Product.class);
            product = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return product.get(0);
    }

}
