package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name="ManageCart", value="/ManageCart")
public class ManageCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CarrelloDAO cDAO = new CarrelloDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        if(action.equals("removeProduct")){
            String email = request.getParameter("email");
            cDAO.doDelete(id, email);
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            request.setAttribute("carts", carts);
        }else if(action.equals("removeProductSession")){
            HttpSession session = request.getSession();
            ArrayList<Carrello> carts = (ArrayList<Carrello>) session.getAttribute("carts");
            int i=0;
            for(Carrello c : carts) {
                if (c.getProducts().getId() == id) {
                    carts.remove(i);
                    break;
                }
                i++;
            }
            session.setAttribute("carts", carts);
        }else if(action.equals("addQuantity")){
            String email = request.getParameter("email");
            cDAO.addQuantity(id, email);
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            request.setAttribute("carts", carts);
        }
        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/results/cart.jsp");
        ds.forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}