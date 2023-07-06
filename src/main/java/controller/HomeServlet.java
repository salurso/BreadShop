package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categoria;
import model.CategoriaDAO;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomePage", value = "/HomePage")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO pDAO = new ProdottoDAO();
        ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
        prodotti = (ArrayList<Prodotto>) pDAO.doRetrieveAll();
        request.setAttribute("prodotti", prodotti);
        CategoriaDAO cDAO = new CategoriaDAO();
        ArrayList<Categoria> categories = (ArrayList<Categoria>) cDAO.doRetrieveAll();
        request.setAttribute("categories", categories);
        RequestDispatcher ds = request.getRequestDispatcher("index.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
