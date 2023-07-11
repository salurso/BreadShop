package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "LoginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String check;
        HttpSession session = request.getSession();
        UtenteDAO uDAO = new UtenteDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utente utente = new Utente();

        // Creare il pattern utilizzando la regex
        Pattern pEmail = Pattern.compile(".+@.+\\.[a-z]+");
        Pattern pPass = Pattern.compile("^[a-zA-Z0-9!@#$%^&*]*$");
        // Verifica la stringa data con il pattern
        Matcher mEmail = pEmail.matcher(email);
        Matcher mPass = pPass.matcher(password);
        // controlla se è stata trovata una corrispondenza
        boolean matchFound = mEmail.matches() && mPass.matches();

        StringTokenizer st = new StringTokenizer(email, ".");
        String lastToken = null;
        while (st.hasMoreTokens()) {
            lastToken = st.nextToken();
        }

        // convalida
        if (matchFound && lastToken.length() >= 2 && email.length() - 1 != lastToken.length() && password.length() >=8 ) {
            utente = UtenteDAO.doRetrieveByEmailPassword(email, password);
        } else {
            check = "Login errato!";
            request.setAttribute("check", check);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/results/login.jsp");
            rd.include(request, response);
        }

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
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
                rd.include(request, response);
            }
        }
//        else if(request.getParameter("action").equals("logout")){
//            session.invalidate();
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.forward(request, response);
//        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}