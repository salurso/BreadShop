package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CarrelloDAO;
import model.ProdottoDAO;

import java.io.IOException;

@WebServlet(name = "AddCartServlet", value = "/AddCartServlet")
public class AddCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        double price = Double.parseDouble(request.getParameter("price"));
        String email = request.getParameter("email");

        ProdottoDAO pDAO = new ProdottoDAO();
        double priceProduct = pDAO.getPriceById(id);
        CarrelloDAO cDAO = new CarrelloDAO();
        cDAO.doInsert(email, id, 2, priceProduct);
        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/cart.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
