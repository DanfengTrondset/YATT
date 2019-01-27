package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerOrder;
import model.Product;

public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("viewCategory")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/category.jsp");
            dispatcher.forward(request, response);
        }
        if (action.equals("viewCart")) {
            String email = request.getParameter("email");
            int orderid = DBController.getCurrentOrderOfCustomer(email);

            // no order
            if (orderid == -1) {
                orderid = DBController.createOrderForCustomer(email);
                System.out.println("orderid is -1, new id");
                System.out.println("new order id: " + orderid);
            }
            request.setAttribute("orderid", orderid);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/cart.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("viewHome")) {
            String email = request.getParameter("email");
            request.setAttribute("email", email);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("addToCart")) {

            String email = request.getParameter("email");
            int pid = Integer.parseInt(request.getParameter("pid"));
            System.out.println(action + email + pid);
            int orderid = DBController.getCurrentOrderOfCustomer(email);
            System.out.println("order id: " + orderid);

            // no order
            if (orderid == -1) {
                orderid = DBController.createOrderForCustomer(email);
                System.out.println("orderid is -1, new id");
                System.out.println("new order id: " + orderid);
            }

            Product product = DBController.getProduct(pid);
            System.out.println("Clicked product: " + product.getName());
            CustomerOrder order = DBController.getCustomerOrder(orderid);
            System.out.println("Clicked customer_order: " + order.getId() + order.getStatus());
            DBController.addProductToOrderedProduct(order, product);

            request.setAttribute("orderid", orderid);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/cart.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("editCart")) {
            String email = request.getParameter("email");
            int pid = Integer.parseInt(request.getParameter("pid"));
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
        }

        if (action.equals("checkout")) {
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            CustomerOrder order = DBController.getCustomerOrder(orderid);
            String email = order.getCustomer().getEmail();
            if (MailController.sendEmail(email)) {
                // pop up success message
                // go back to home
                // customer_order.setStatus("complete");
                if (DBController.setOrderStatus(orderid, "complete")) {
                    request.setAttribute("email", email);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // pop up fail message
            }

        }

        if (action.equals("clear")) {
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            if (DBController.clearOrderedProductsOf(orderid)) {
                // pop up success message
                // go back to home
                String email = DBController.getCustomerOrder(orderid).getCustomer().getEmail();
                request.setAttribute("email", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.forward(request, response);
            } else {
                // pop up fail message
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
