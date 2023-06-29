package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.ProdottoDAO;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name="ManageAdministrator", value="/ManageAdministrator")
public class ManageAdministrator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UtenteDAO uDAO = new UtenteDAO();
        if(action.contains("addAdmin")){
            String x[] = request.getParameter("action").split("addAdmin");
            String email = x[1];
            uDAO.makeAdministrator(email);
            ArrayList<Utente> u = (ArrayList<Utente>) uDAO.doRetrieveAll();
            request.setAttribute("users", u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/administrator/users.jsp");
            dispatcher.forward(request, response);
        }
        if(action.equals("removeAdmin")){
            String x[] = request.getParameter("action").split("removeAdmin");
            String email = x[1];
            uDAO.makeAdministrator(email);
            ArrayList<Utente> u = (ArrayList<Utente>) uDAO.doRetrieveAll();
            request.setAttribute("users", u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/administrator/users.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}