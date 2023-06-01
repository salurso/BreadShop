package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Prodotto;
import model.ProdottoDAO;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "InsertProduct", value = "/InsertProduct")
public class InsertProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = "PANE";
        Double prezzo = 2.5;
        String descrizione = "prova inserimento";

        Part part = request.getPart("image");
        InputStream in = part.getInputStream();

        Prodotto p = new Prodotto();
        p.setName(name);
        p.setPrice(prezzo);
        p.setImage(in);
        p.setDescription(descrizione);

        ProdottoDAO pDAO = new ProdottoDAO();
        pDAO.doInsertProduct(p);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}