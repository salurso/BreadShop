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
import java.util.Date;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String email = request.getParameter("email");
//        double total = Double.parseDouble(request.getParameter("total"));
        String action = request.getParameter("action");
        String addres = null;
        if(action.equals("checkout")){
            CarrelloDAO cDAO = new CarrelloDAO();
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            request.setAttribute("carts", carts);
            addres = "./WEB-INF/results/checkout.jsp";
        }
        if(action.equals("Acquista")){
            Ordine o = new Ordine();
            o.setPhone_number(request.getParameter("phone_number"));
            o.setCity(request.getParameter("city"));
            o.setProvince(request.getParameter("province"));
            o.setVia(request.getParameter("street"));
            o.setHouse_number(Integer.parseInt(request.getParameter("street_number")));
            o.setCap(Integer.parseInt(request.getParameter("cap")));
            o.setTotal(Double.parseDouble(request.getParameter("total")));
            o.setEmail_user(request.getParameter("email"));
//            java.sql.Date date = (java.sql.Date) new Date();
//            o.setDate(date);

            String result = null;
            OrdineDAO oDAO = new OrdineDAO();
            if(oDAO.doInsert(o)!=1)
                result = "L'ordine non è andato a buon fine!";
            else
                result = "Ordine avvenuto con successo!";

            request.setAttribute("result", result);
            addres = "index.jsp";
        }

        RequestDispatcher ds = request.getRequestDispatcher(addres);
        ds.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}