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
    <link rel="stylesheet" type="text/css" href="./css/navbar.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/orders.css?v=<%=new Random().nextInt()%>"/>
    <title>I miei Ordini</title>
</head>
<body>

<div>
    <%@ include file="/WEB-INF/navbar/navbar.jsp" %>
    <div class="home_ord">



    </div>
    <div class="container_ord">
        <%
            if(utente!=null){
        %>
        <h1>  Ciao <%=utente.getName()%>, ecco i tuoi ordini: </h1>
    <%
        ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");

        for(Ordine o : orders){
            ArrayList<Prodotto> product = o.getProducts();
    %>

    <% if(utente.getEmail().equals(o.getEmail_user())){ %>
    <table>
        <tr>
            <th>DATA: <%=o.getDate()%></th><th>TOTALE: <%=o.getTotal()%></th><th>INVIA A: <%=o.getEmail_user()%></th><th>ORDINE #: <%=o.getId()%></th>
           <% } %>
        </tr>
        <%for(Prodotto p : product){%>
        <tr>
            <td><img src="upload/<%=p.getImage()%>"></td><td><%=p.getName()%></td><td>quantità</td><td><%=p.getPrice()%></td>
        </tr>
        <%}
        %>
    </table>
    <%
            }
            }else{%>
    <h3>ERROREEEEEE, REGISTRATIIIIIIIIIIIIII</h3>
    <% } %>


</div>
</div>

</body>
</html>
