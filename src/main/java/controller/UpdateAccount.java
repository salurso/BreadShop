package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UpdateAccount", value = "/UpdateAccount")
public class UpdateAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UtenteDAO uDAO = new UtenteDAO();
        String result = null;
        if(action.equals("address")) {
            String phone = request.getParameter("phone");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String street = request.getParameter("street");
            String streetNumber = request.getParameter("streetNumber");
            String cap = request.getParameter("cap");
            String email = request.getParameter("email");

            if((uDAO.updateAddress(phone, city, province, street, streetNumber, cap, email))==1){
                result="Indirizzo aggiornato!";
            }else{
                result="Problema aggiornato!";
            }

//             Imposta la risposta
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(result);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomeServletAdministrator?action=homeAdmin");
        requestDispatcher.forward(request, response);
    }
}
