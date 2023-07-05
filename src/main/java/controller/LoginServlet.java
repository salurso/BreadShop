package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Ordine;
import model.OrdineDAO;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String check;
        HttpSession session = request.getSession();
        UtenteDAO uDAO = new UtenteDAO();
        Utente utente = UtenteDAO.doRetrieveByEmailPassword(request.getParameter("email"), request.getParameter("password"));
        if (request.getParameter("action") == null) {
            if (utente == null && !uDAO.checkEmail(request.getParameter("email"))) {
                check = "Indirizzo E-mail non trovato!";
                request.setAttribute("check", check);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
                rd.include(request, response);
            }else if(utente == null && uDAO.checkEmail(request.getParameter("email"))){
                check = "Password non corretta!";
                request.setAttribute("check", check);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
                rd.include(request, response);
            }else if(utente != null && utente.isAdmin()==false){
                session.setAttribute("login", utente);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }else if(utente != null && utente.isAdmin()==true){
                session.setAttribute("loginAdmin", utente);

                OrdineDAO oDAO = new OrdineDAO();
                ArrayList<Ordine> orders = new ArrayList<>();
                orders = (ArrayList<Ordine>) oDAO.doRetrieveAll();
                request.setAttribute("orders", orders);
                ArrayList<Utente> users = new ArrayList<>();
                users = (ArrayList<Utente>) uDAO.doRetrieveNotAdmin(); //RESTITUISCE TUTTI GLI UTENTI NON ADMIN
                request.setAttribute("users", users);
                ArrayList<Utente> admin = new ArrayList<>();
                admin = (ArrayList<Utente>) uDAO.doRetrieveAdmin(); //RESTITUISCE TUTTI GLI UTENTI CHE SONO ADMIN
                request.setAttribute("admin", admin);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
                rd.include(request, response);
            }
        }
        else if(request.getParameter("action").equals("logout")){
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}