<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 21/06/2023
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/cart.css?v=<%=new Random().nextInt()%>"/>
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
    <div class="tabular--wrapper">
        <div class="table-container">

            <%
                ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");

                for(Ordine o : orders){
                    if(utente.getEmail().equals(o.getEmail_user())){
                        ArrayList<Prodotto> product = o.getProducts();

            %>
            <table>
                <thead>
                <tr>
                    <th>Immagine</th>
                    <th>Nome</th>
                    <th>Descrizione </th>
                    <th>Prezzo </th>
                    <th>Quantità</th>
                    <th>Elimina</th>
                </tr>
                </thead>
                <br>
                <%for(Prodotto p : product){ %>

                <tbody>
                <tr>
                    <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getDescription()%></td>
                    <td><%= p.getPrice()%></td>
                    <td>2</td>
                    <td><button name="eliminaDaCarrello" value="<%=p.getId()%>"></button></td>
                </tr>
                </tbody>
                <%
                    }   %>


            </table>
            <%
                    }
                }
            %>
        </div>
        <%
        }else{%>
        <h3>Attenzione, il tuo carrello è vuoto</h3>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
