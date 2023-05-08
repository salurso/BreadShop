package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet(name = "RegistrationServlet", value = "/process_registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String nome = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utente utente = new Utente();
        utente.setUsername(username);
        utente.setName(nome);
        utente.setEmail(email);
        utente.setPassword(password);
//        utente.setAdmin(admin);

        request.getSession().setAttribute("utente", utente);
        UtenteDAO utenteDAO = new UtenteDAO();
        if(UtenteDAO.checkEmail(request.getParameter("email"))){
            request.setAttribute("check","Email già presente");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/results/register.jsp");
            dispatcher.forward(request, response);
        }else{
            String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$";
            Pattern p = Pattern.compile(regex);
            if(p.matcher(utente.getEmail()).matches()){
                request.setAttribute("check","Email non valida");
                RequestDispatcher dispatcher =
                        request.getRequestDispatcher("/WEB-INF/results/error.jsp");
                dispatcher.forward(request, response);
            }
        }
        UtenteDAO.doRegistration(utente);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/index.jsp");
        dispatcher.forward(request, response);
    }
}

