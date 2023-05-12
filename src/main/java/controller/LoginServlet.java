package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "LoginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String parametri;
        HttpSession session = request.getSession();
//        Utente utente = UtenteDAO.doRetrieveByUsernamePassword(request.getParameter("username"), request.getParameter("password"));
        Utente utente = UtenteDAO.doRetrieveByEmailPassword(request.getParameter("email"), request.getParameter("password"));
        if (request.getParameter("action") == null) {
            if (utente == null) {
                parametri = "Email o password errati!";
                request.setAttribute("parametri", parametri);
                RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
                rs.include(request, response);
            }else if(utente != null && utente.isAdmin()==false){
                session.setAttribute("utente", utente);
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.include(request, response);
            }else if(utente != null && utente.isAdmin()==true){
                session.setAttribute("amministratore", utente);
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.include(request, response);
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}