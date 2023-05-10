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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String address = "";

        UtenteDAO utenteDAO = new UtenteDAO();
        Utente utente = utenteDAO.doRetrieveByUsernamePassword(username, password);
        if (utente!=null){   // the user is in the db then s/he is registered and can go on
            // Salva l'utente nella sessione
            HttpSession session = request.getSession();
            session.setAttribute("utente", utente);
            // Redirect alla home page dell'utente
            address = "show-prodotti";
        } else {

            // Redirect alla pagina con un messaggio di errore
            address ="index.jsp?error=1";  // con redirect, la pagina non può essere in WEB-INF, il browser non potrebbe raggiungerla
        }

        response.sendRedirect(address);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
