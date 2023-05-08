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
import java.util.List;

@WebServlet("/show-category")
public class CategoriaServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categorie = request.getParameter("categorie");
        CategoriaDAO categoriaDao = new CategoriaDAO();
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        String address;
        if (categorie ==null) {
            address = "/WEB-INF/results/error.jsp";
        } else {
            Categoria categoriaObj = categoriaDao.doRetrieveByName(categorie);
            int id = categoriaObj.getId();
            // looking for all the products belonging to the input category
            List<Prodotto> prodottiInCat = prodottoDAO.doRetrieveByCategory(id);

            request.setAttribute("prodotti", prodottiInCat);  // the products in that category
            request.setAttribute("categoria", categoriaObj); // the input category with is data

           address = "/WEB-INF/results/categoria.jsp";

        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}
