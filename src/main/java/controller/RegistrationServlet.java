package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;

@WebServlet(name = "RegistrationServlet", value = "/process_registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String nome = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean admin = request.getParameter("admin") != null;

        Utente utente = new Utente();
        utente.setUsername(username);
        utente.setName(nome);
        utente.setEmail(email);
        utente.setPassword(password);
        utente.setAdmin(admin);

        request.getSession().setAttribute("utente", utente);

        UtenteDAO utenteDAO = new UtenteDAO();
        utenteDAO.doSave(utente);

        RequestDispatcher dispatcher =
            request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}

