package controller;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Customer;
import model.CustomerOrder;
import model.HibernateUtil;
import model.OrderedProduct;
import model.OrderedProductId;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Product;

public class DBController {

    public static boolean loginUser(Customer customer) {
        boolean isSuccessful = true;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM customer WHERE email= :email AND password= :password");
            query.setParameter("email", customer.getEmail());
            query.setParameter("password", customer.getPassword());
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
            Query query = session.createSQLQuery("SELECT * FROM customer WHERE email= :email");
            query.setParameter("email", customer.getEmail());
            List result = query.list();
            if (!result.isEmpty()) {
                isSuccessful = false;
            } else {
                session.save(customer);
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

    public static Customer getcustomer(String email) {
        Customer customer;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM customer WHERE email=:email")
                    .addEntity(Customer.class);
            query.setParameter("email", email);
            customer = (Customer) query.list().get(0);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return customer;
    }

    public static List<Product> getProductForCategory(String categoryName) {
        List<Product> products = new ArrayList<>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM product WHERE category_name='" + categoryName + "'")
                    .addEntity(Product.class);
            products = query.list();

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

    public static List<OrderedProduct> getOrderedProductsOf(int orderid) {
        List<OrderedProduct> orderedProducts;
        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM ordered_product WHERE customer_order_id=:orderid")
                    .addEntity(OrderedProduct.class);
            query.setParameter("orderid", orderid);
            orderedProducts = query.list();

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return orderedProducts;
    }

    public static int getCurrentOrderOfCustomer(String email) {
        int id = -1;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT id FROM customer_order WHERE customer_email='" + email + "' AND status='" + "current" + "'");
            if (query.list().size() > 0) {
                id = Integer.parseInt(query.list().get(0).toString());
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

        return id;
    }

    public static int createOrderForCustomer(String email) {
        int orderid = -1;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Customer customer = getcustomer(email);
            System.out.println(customer.getEmail() + customer.getUserName());
            CustomerOrder order = new CustomerOrder();
            order.setCustomer(customer);
            order.setStatus("current");

            Query query = session.createSQLQuery("INSERT INTO customer_order (customer_email,status) VALUES (:email,:status)");
            query.setParameter("email", email);
            query.setParameter("status", "current");
            session.save(order);
            tx.commit();

            orderid = getCurrentOrderOfCustomer(email);
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return orderid;
    }

    public static boolean addProductToOrderedProduct(CustomerOrder order, Product product) {
        boolean isSuccessful = true;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM ordered_product WHERE product_id=:pid AND customer_order_id=:orderid")
                    .addEntity(OrderedProduct.class);
            query.setParameter("pid", product.getId());
            query.setParameter("orderid", order.getId());
            if (query.list().isEmpty()) {
                System.out.println("Product " + product.getName() + " is not in ordered_product");
                OrderedProduct orderedProduct = new OrderedProduct();
                orderedProduct.setId(new OrderedProductId(order.getId(), product.getId()));
                orderedProduct.setCustomerOrder(order);
                orderedProduct.setProduct(product);
                orderedProduct.setQuantity(1);
                session.save(orderedProduct);
            } else {
                System.out.println("Product " + product.getName() + " is in ordered_product");
                OrderedProduct orderedProduct = (OrderedProduct) query.list().get(0);
                System.out.println("Quantity is: " + orderedProduct.getQuantity());
                orderedProduct.setQuantity(orderedProduct.getQuantity() + 1);
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

    public static CustomerOrder getCustomerOrder(int orderid) {
        CustomerOrder customerOrder;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM customer_order WHERE id=:id")
                    .addEntity(CustomerOrder.class);
            query.setParameter("id", orderid);
            customerOrder = (CustomerOrder) query.list().get(0);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return customerOrder;
    }

    public static Product getProduct(int pid) {
        Product product;

        Session session = HibernateUtil.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            Query query = session.createSQLQuery("SELECT * FROM product WHERE id=:id")
                    .addEntity(Product.class);
            query.setParameter("id", pid);
            product = (Product) query.list().get(0);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            session.close();
        }

        return product;
    }

}
