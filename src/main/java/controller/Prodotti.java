package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name="Prodotti", value="/Prodotti")
public class Prodotti extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idProduct = Integer.parseInt(request.getParameter("action"));
        ProdottoDAO pDAO = new ProdottoDAO();
        ArrayList<String> categories = pDAO.getCategories();
        request.setAttribute("categories", categories);
        Prodotto p = pDAO.doRetrieveById(idProduct);
        request.setAttribute("product", p);
        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/prodotti.jsp");
        ds.forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}