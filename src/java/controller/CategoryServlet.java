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
        String category = request.getParameter("cetegory");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/category.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        int pid = Integer.parseInt(request.getParameter("pid"));
        System.out.println(action + email + pid);

        if (action.equals("addToCart")) {

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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
