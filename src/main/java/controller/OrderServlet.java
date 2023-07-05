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
            request.setAttribute("carts", carts);
            request.setAttribute("creditCards", creditCards);
            addres = "./WEB-INF/results/checkout.jsp";
        }
        if(action.equals("inserisci")){
            CarrelloDAO cDAO = new CarrelloDAO();
            ArrayList<Carrello> carts = cDAO.doRetrieveAll();
            PagamentoDAO pDAO = new PagamentoDAO();
            ArrayList<Pagamento> creditCards = pDAO.doRetriveByEmail(email);
            int id = Integer.parseInt((request.getParameter("card")));
            request.setAttribute("card", pDAO.doRetriveById(id));
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

            Pagamento p = new Pagamento();

            CarrelloDAO cDAO = new CarrelloDAO();
            ArrayList<Carrello> carts = cDAO.doRetrieveByEmail(email);

            PagamentoDAO pDAO = new PagamentoDAO();
            String result = null;

            if(request.getParameter("cardId").equals("insert")){
                p.setCvv(Integer.parseInt(request.getParameter("cvv")));
                p.setHolder(request.getParameter("holder"));
                p.setExpYear(Integer.parseInt(request.getParameter("expMonth")));
                p.setExpYear(Integer.parseInt(request.getParameter("expYear")));
                p.setId(pDAO.doInsert(p));
                if(p.getId()!=0){

                    p.setNumber(Long.parseLong(request.getParameter("creditCardNumber")));
                    OrdineDAO oDAO = new OrdineDAO();
                    if(oDAO.doInsert(o, p.getId(), carts)!=1)
                        result = "L'ordine non è andato a buon fine!";
                    else {
                        result = "Ordine avvenuto con successo!";
                        cDAO.doDeleteByEmail(email);
                    }
                }else{
                    result = "L'ordine non è andato a buon fine!";
                }
            }else{
                p.setId(Integer.parseInt(request.getParameter("cardId")));
                OrdineDAO oDAO = new OrdineDAO();
                if(oDAO.doInsert(o, p.getId(), carts)!=1)
                    result = "L'ordine non è andato a buon fine!";
                else {
                    result = "Ordine avvenuto con successo!";
                    cDAO.doDeleteByEmail(email);
                }
            }

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