package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
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
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/results/homeAdmin.jsp");
                rd.include(request, response);
            }
        }
        else if(request.getParameter("action").equals("logout")){
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("Homepage");
            rd.forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}