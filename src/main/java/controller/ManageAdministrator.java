package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
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
            String x[] = action.split("addAdmin");
            String email = x[1];
            uDAO.makeAdministrator(email);
            ArrayList<Utente> u = uDAO.doRetrieveAll();https://www.youtube.com/watch?v=Y_w9KjOrEXk&ab_channel=JavaTechie
            request.setAttribute("users", u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/administrator/manageUsers.jsp");
            dispatcher.forward(request, response);
        }
        if(action.contains("removeAdmin")){
            String x[] = action.split("removeAdmin");
            String email = x[1];
            uDAO.removeAdministrator(email);
            ArrayList<Utente> u = uDAO.doRetrieveAll();
            request.setAttribute("users", u);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/administrator/manageUsers.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UtenteDAO uDAO = new UtenteDAO();

        if(action.contains("addAdmin")){
            String x[] = action.split("addAdmin");
            String email = x[1];
            uDAO.makeAdministrator(email);
            ArrayList<Utente> u = uDAO.doRetrieveAll();
//
//            ObjectMapper objectMapper = new ObjectMapper();
//            String jsonData = objectMapper.writeValueAsString(u);

            // Imposta la risposta
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
            //response.getWriter().write(jsonData);
            request.setAttribute("users", u);
        }
//        doPost(request, response);
    }

}