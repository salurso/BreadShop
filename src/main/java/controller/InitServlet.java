package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InitServlet", value = "/InitServlet")
public class InitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        UtenteDAO uDAO = new UtenteDAO();
        Utente utente = UtenteDAO.doRetrieveByEmailPassword(request.getParameter("email"), request.getParameter("password"));
        if(action==null){

        }
        if(action.equals("login")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
            ds.forward(request, response);
        }
        if(action.equals("contatti")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/contacts.jsp");
            ds.forward(request, response);
        }
        if(action.equals("product")){
            ProdottoDAO pDAO = new ProdottoDAO();
            ArrayList<Prodotto> products = new ArrayList<Prodotto>();
            products = (ArrayList<Prodotto>) pDAO.doRetrieveAll();
            request.setAttribute("product", products);
            ArrayList<String> categories = pDAO.getCategories();
            request.setAttribute("categories", categories);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/products.jsp");
            ds.forward(request, response);
        }
        if(action.equals("orders")){
            OrdineDAO oDAO = new OrdineDAO();
            ArrayList<Ordine> orders = new ArrayList<>();
            orders = (ArrayList<Ordine>) oDAO.doRetrieveAll();
            request.setAttribute("orders", orders);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/orders.jsp");
            ds.forward(request, response);
        }
        if(action.equals("specialita")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/specialita.jsp");
            ds.forward(request, response);
        }



//        session.setAttribute("filters", action);
//        ProdottoDAO pDAO = new ProdottoDAO();
//        ArrayList<Prodotto> prodottiCategoria = new ArrayList<>();
//        prodottiCategoria = (ArrayList<Prodotto>) pDAO.doRetrieveByCategory(action);
//        request.setAttribute("categoria", prodottiCategoria);
//        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/products.jsp");
//        ds.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
