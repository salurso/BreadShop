package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InitServlet", value = "/InitServlet")
public class InitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){

        }
        if(action.equals("login")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
            ds.forward(request, response);
        }
        if(action.equals("contatti")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/contatti.jsp");
            ds.forward(request, response);
        }
        if(action.equals("product")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/prodotti.jsp");
            ds.forward(request, response);
        }
        if(action.equals("specialita")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/specialita.jsp");
            ds.forward(request, response);
        }

        HttpSession session = request.getSession();
        session.setAttribute("filters", action);
        ProdottoDAO pDAO = new ProdottoDAO();
        ArrayList<Prodotto> prodottiCategoria = new ArrayList<>();
        prodottiCategoria = (ArrayList<Prodotto>) pDAO.doRetrieveByCategory(action);
        request.setAttribute("categoria", prodottiCategoria);
        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/prodotti.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
