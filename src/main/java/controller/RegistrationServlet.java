package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "RegistrationServlet", value = "/process_registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String password = request.getParameter("password");

        Utente utente = new Utente();
//        utente.setUsername(username);
        utente.setEmail(email);
        utente.setName(name);
        utente.setSurname(surname);
        utente.setPassword(password);

        request.getSession().setAttribute("utente", utente);

        if (UtenteDAO.checkEmail(request.getParameter("email"))) {
            request.setAttribute("check", "E-mail già presente!");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/results/register.jsp");
            dispatcher.forward(request, response);
        } else {
            UtenteDAO.doRegistration(utente);
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/results/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
//        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
//        Pattern pattern = Pattern.compile(regex);
//        Matcher matcher = pattern.matcher(email);
//        if(!matcher.matches()){
//            request.setAttribute("check","invalidEmail");
//            RequestDispatcher dispatcher =
//                    request.getRequestDispatcher("/WEB-INF/error/error_register.jsp");
//            dispatcher.forward(request, response);
//        }
//
//        UtenteDAO utenteDAO = new UtenteDAO();
//        UtenteDAO.doRegistration(utente);
//        RequestDispatcher dispatcher =
//                request.getRequestDispatcher("/WEB-INF/login.jsp");
//        dispatcher.forward(request, response);
//    }


