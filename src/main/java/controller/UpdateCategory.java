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

@WebServlet(name = "UpdateCategory", value = "/UpdateCategory")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoriaDAO cDAO = new CategoriaDAO();
        Categoria c = new Categoria();
        c.setName(request.getParameter("name"));
        String result = null;

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
            c.setDescription(request.getParameter("description"));

            if(cDAO.doUpdate(c)==0){
                result = "Problema aggiornamento!";
            }else{
                result = "Categoria aggiornato!";
            }
        }
        if(action.equals("ELIMINA")){
            ProdottoDAO pDAO = new ProdottoDAO();
            pDAO.doDeleteByCategory(c.getName());
            if(cDAO.doDelete(c.getName())!=0){
                result = "Categoria eliminato!";
            }else{
                result = "Problema eliminazione!";
            }
        }
        if(action.equals("AGGIUNGI CATEGORIA")){
            c.setDescription(request.getParameter("description"));

            if(cDAO.doInsert(c)==0){
                result = "Problema inserimento!";
            }else{
                result = "Categoria inserito!";
            }
        }
        request.setAttribute("result", result);

        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
