package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        double total = Double.parseDouble(request.getParameter("total"));
        CarrelloDAO cDAO = new CarrelloDAO();
        ArrayList<Carrello> carts = cDAO.doRetrieveAll();
        request.setAttribute("carts", carts);
//        UtenteDAO uDAO = new UtenteDAO();
//        request.setAttribute("user", uDAO.doRetrieveByEmail(email));

        RequestDispatcher ds = request.getRequestDispatcher("./WEB-INF/results/checkout.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}