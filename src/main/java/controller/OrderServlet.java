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

        String action = request.getParameter("action");
        String addres = null;
        String email = request.getParameter("email");
        if(action.equals("checkout")){
            CarrelloDAO cDAO = new CarrelloDAO();
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            PagamentoDAO pDAO = new PagamentoDAO();
            ArrayList<Pagamento> creditCards = pDAO.doRetriveByEmail(email);
//            if(request.getParameter("card")!=null && !request.getParameter("card").isEmpty()) {
//                long number = Long.parseLong(request.getParameter("card"));
//                request.setAttribute("card", pDAO.doRetriveByNumber(number));
//            }
            request.setAttribute("carts", carts);
            request.setAttribute("creditCards", creditCards);
            addres = "./WEB-INF/results/checkout.jsp";
        }
        if(action.equals("inserisci")){
            CarrelloDAO cDAO = new CarrelloDAO();
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            PagamentoDAO pDAO = new PagamentoDAO();
            ArrayList<Pagamento> creditCards = pDAO.doRetriveByEmail(email);
            long number = Long.parseLong(request.getParameter("card"));
            request.setAttribute("card", pDAO.doRetriveByNumber(number));
            request.setAttribute("carts", carts);
            request.setAttribute("creditCards", creditCards);
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
            o.setEmail_user(email);

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