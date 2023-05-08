
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "model.Prodotto" %>
<%@ page import = "model.Categoria" %>
<%@ page import = "model.Utente" %>
<%@ page import = "java.util.*" %>

<html>
<head>
    <title> Categoria </title>
    <link rel="stylesheet" href="stile.css">
</head>
<body>

<%
    List<Prodotto> prodottiInCat = (List<Prodotto>) request.getAttribute("prodotti"); // the products in the selected category
    Categoria categoria = (Categoria)request.getAttribute("categoria"); // the category with its data
%>

Sei loggato come "${utente.nome}" con email "${utente.email}"
<h1> <%=categoria.getNome().toUpperCase()%> </h1>
<h2> <%=categoria.getDescrizione().toUpperCase()%> </h2>

    <table id="customers">
        <tr>
            <th> Nome </th>
            <th> Descrizione </th>
            <th> Costo </th>
        </tr>
        <% for (Prodotto p : prodottiInCat) { %>
        <tr>
            <td> <%= p.getNome()%> </td>
            <td> <%=p.getDescrizione()%> </td>
            <td> <%=p.getCosto()%> </td>
        </tr>
        <% } %>
    </table>
<br>
<a href ="show-prodotti"> Go back to list of products</a>
</body>
</html>
