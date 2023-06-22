<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %><%--
  Created by IntelliJ IDEA.
  User: Costantino
  Date: 05/06/2023
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <title>Ordini</title>
</head>
<body>
    <div>
        <%@ include file="/WEB-INF/administrator/headerAdmin.jsp" %>

        <h1>  Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%>, ecco i tuoi ordini </h1>

        <%
            ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");

            for(Ordine o : orders){
                ArrayList<Prodotto> product = o.getProducts();
        %>
        <table>
            <tr>
                <th>DATA: <%=o.getDate()%></th><th>TOTALE: <%=o.getTotal()%></th><th>INVIA A: <%=o.getEmail_user()%></th><th>ORDINE #: <%=o.getId()%></th>

            </tr>
            <%for(Prodotto p : product){%>
            <tr>
                <td><img src="upload/<%=p.getImage()%>"></td><td><%=p.getName()%></td><td>quantità</td><td><%=p.getPrice()%></td>
            </tr>
            <%}%>
        </table>
        <%
            }
        %>
    </div>
</body>
</html>
