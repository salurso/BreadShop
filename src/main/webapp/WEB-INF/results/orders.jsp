<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Pagamento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/orders.css?v=<%=new Random().nextInt()%>"/>
    <title>I miei Ordini</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<div>
    <div class="home_ord">
        <h3> ORDINI </h3>
    </div>
    <%
        if(utente!=null){
    %>
    <h1 class="main-title"> Ciao <%=utente.getName()%>, ecco i tuoi ordini:  </h1>
    <%
        ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");
        ArrayList<Pagamento> cards = (ArrayList<Pagamento>) request.getAttribute("cards");
        for(Ordine o : orders){
            if(utente.getEmail().equals(o.getEmail_user())){
                ArrayList<Prodotto> products = o.getProducts();
    %>
    <div class="tabular--wrapper">

        <div class="table-container">

            <table>
                <thead>
                <tr>
                    <th>EFFETTUATO IL:<br><%=o.getDate()%></th>
                    <th>TOTALE: <%=o.getTotal()%></th>
                    <th colspan="2">INVIA A:<br><%=o.getVia()%>, <%=o.getHouse_number()%>, <%=o.getCity()%></th>
                    <th>ORDINE #<%=o.getId()%></th>
                </tr>
                </thead>
                <br>
                <%for(Prodotto p : products){ %>

                <tbody>
                <tr>
                    <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getDescription()%></td>
                    <td><%= p.getPrice()%></td>
                    <td><%=p.getQuantity()%></td>
                </tr>
                </tbody>
                <%
                    }   %>
            </table>
            </div>
        </div>
        <%
                }
            }
        %>
        <%
        }else{%>
        <h3>Attenzione, non ci sono ordini recenti!</h3>
        <%
            }
        %>

</div>

</body>
</html>