package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Customer customer = new Customer();
            customer.setEmail(email);
            customer.setPassword(password);
            if (DBController.loginUser(customer)) {
                request.setAttribute("email", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            } else {
                // Notify user
            }
        }

        if (action.equals("register")) {
            String username = request.getParameter("username_register");
            String email = request.getParameter("email_register");
            String password = request.getParameter("password_register");
            String repeat_password = request.getParameter("repeat_password_register");
            Customer customer = new Customer();
            customer.setEmail(email);
            customer.setUserName(username);
            customer.setPassword(password);

            if (DBController.RegisterUser(customer)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                dispatcher.forward(request, response);
            } else {
                // miss field

                // email already used
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
