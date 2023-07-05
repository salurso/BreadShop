package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UpdateProduct", value = "/UpdateProduct")
public class UpdateProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ProdottoDAO pDAO = new ProdottoDAO();

        OrdineDAO oDAO = new OrdineDAO();
        ArrayList<Ordine> orders = new ArrayList<>();
        orders = (ArrayList<Ordine>) oDAO.doRetrieveAll();
        request.setAttribute("orders", orders);
        UtenteDAO uDAO = new UtenteDAO();
        ArrayList<Utente> users = new ArrayList<>();
        users = (ArrayList<Utente>) uDAO.doRetrieveNotAdmin(); //RESTITUISCE TUTTI GLI UTENTI NON ADMIN
        request.setAttribute("users", users);
        ArrayList<Utente> admin = new ArrayList<>();
        admin = (ArrayList<Utente>) uDAO.doRetrieveAdmin(); //RESTITUISCE TUTTI GLI UTENTI CHE SONO ADMIN
        request.setAttribute("admin", admin);

        if(action.equals("AGGIORNA")){
            Prodotto p = new Prodotto();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setName(request.getParameter("name"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
//            p.setImage(request.getParameter("image"));
            p.setDescription(request.getParameter("description"));
            p.setNameCategory(request.getParameter("categories"));

            String result;
            if(pDAO.doUpdate(p)==0){
                result = "Problema aggiornamento!";
            }else{
                result = "Prodotto aggiornato!";
            }
            request.setAttribute("result", result);

            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
            ds.forward(request, response);
        }
        if(action.equals("ELIMINA")){
            int id = Integer.parseInt(request.getParameter("id"));
            String result;
            if(pDAO.doDelete(id)==0){
                result = "Problema eliminazione!";
            }else{
                result = "Prodotto eliminato!";
            }

            request.setAttribute("result", result);

            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
            ds.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
