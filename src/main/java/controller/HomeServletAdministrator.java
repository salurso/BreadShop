package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeServletAdministrator", value = "/HomeServletAdministrator")
public class HomeServletAdministrator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){

        }
        if(action.equals("utenti")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/userManagement.jsp");
            ds.forward(request, response);
        }
        if(action.equals("prova")){
            OrdineDAO oDAO = new OrdineDAO();
            ArrayList<Ordine> orders = new ArrayList<>();
            orders = (ArrayList<Ordine>) oDAO.doRetrieveAll();
            request.setAttribute("orders", orders);
            UtenteDAO uDAO = new UtenteDAO();
            ArrayList<Utente> user = new ArrayList<>();
            user = (ArrayList<Utente>) uDAO.doRetrieveNotAdmin();
            request.setAttribute("user", user);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeprova.jsp");
            ds.forward(request, response);
        }
        if(action.equals("prodotti_esauriti")){
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/sold-outProducts.jsp");
            ds.forward(request, response);
        }
        if(action.equals("orders")){
            OrdineDAO oDAO = new OrdineDAO();
            ArrayList<Ordine> orders = new ArrayList<>();
            orders = (ArrayList<Ordine>) oDAO.doRetrieveAll();
            request.setAttribute("orders", orders);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/order.jsp");
            ds.forward(request, response);
        }
        if(action.equals("user")){
            UtenteDAO uDAO = new UtenteDAO();
            ArrayList<Utente> users = new ArrayList<>();
            users = uDAO.doRetrieveAll();
            request.setAttribute("users", users);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/users.jsp");
            ds.forward(request, response);
        }
        if(action.equals("add_product")){
            CategoriaDAO cDAO = new CategoriaDAO();
            ArrayList<String> categories = cDAO.getCategoryName();
            request.setAttribute("categories", categories);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/addProduct.jsp");
            ds.forward(request, response);
        }
        if(action.equals("manage_product")){
            ProdottoDAO pDAO = new ProdottoDAO();
            ArrayList<Prodotto> products = new ArrayList<Prodotto>();
            products = (ArrayList<Prodotto>) pDAO.doRetrieveAll();
            request.setAttribute("products", products);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/manageProduct.jsp");
            ds.forward(request, response);
        }
        if(action.equals("manage_category")){
            CategoriaDAO cDAO = new CategoriaDAO();
            ArrayList<Categoria> categories = (ArrayList<Categoria>) cDAO.doRetrieveAll();
            request.setAttribute("categories", categories);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/manageCategory.jsp");
            ds.forward(request, response);
        }


//        HttpSession session = request.getSession();
//        session.setAttribute("filters", action);
//        ProdottoDAO pDAO = new ProdottoDAO();
//        ArrayList<Prodotto> prodottiCategoria = new ArrayList<>();
//        prodottiCategoria = (ArrayList<Prodotto>) pDAO.doRetrieveByCategory(action);
//        request.setAttribute("categoria", prodottiCategoria);
//        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/products.jsp");
//        ds.forward(request, response);
    }

//        ProdottoDAO pDAO = new ProdottoDAO();
//        ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
//        prodotti = (ArrayList<Prodotto>) pDAO.doRetrieveAll();
//        request.setAttribute("prodotti", prodotti);
//        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/administrator/homeAdmin.jsp");
//        ds.forward(request, response);
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
