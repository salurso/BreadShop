package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categoria;
import model.CategoriaDAO;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;

@WebServlet(name = "UpdateCategory", value = "/UpdateCategory")
public class UpdateCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoriaDAO cDAO = new CategoriaDAO();
        if(action.equals("AGGIORNA")){
            Categoria c = new Categoria();
            c.setName(request.getParameter("id"));
            c.setDescription(request.getParameter("description"));

            String result;
            if(cDAO.doUpdate(c)==0){
                result = "Problema aggiornamento!";
            }else{
                result = "Prodotto aggiornato!";
            }
            request.setAttribute("result", result);

            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
            ds.forward(request, response);
        }
        if(action.equals("ELIMINA")){
            String name = request.getParameter("name");
            String result;
            if(cDAO.doDelete(name)==0){
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
