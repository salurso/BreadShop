
<%@ page import = "model.Prodotto" %>
<%@ page import = "model.Categoria" %>
<%@ page contentType = "text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.List" %>

<html>
<head>
    <title> Prodotti </title>
</head>
<body>
    Sei loggato come "${utente.nome}" con email "${utente.email}"
    <h1> Prodotti </h1>
    <%
        List<Prodotto> prodotti = (List<Prodotto>)request.getAttribute("prodotti");
        List<Categoria> categorie = (List<Categoria>)request.getServletContext().getAttribute("categorie");
    %>

    <table id="customers">
        <tr>
            <th> Nome </th>
            <th> Descrizione </th>
            <th> Costo </th>
        </tr>
        <% for (Prodotto p : prodotti) { %>
        <tr>
            <td> <%= p.getNome()%> </td>
            <td> <%=p.getDescrizione()%> </td>
            <td> <%=p.getCosto()%></td>
        </tr>
        <% } %>
    </table>

    <br>
    <hr/>
    <br>

    <form action = "show-category" method = "get">
        <label for = "categorie"> Scegli una categoria </label>
        <select id = "categorie" name = "categorie">
            <% for (Categoria c : categorie) { %>
            <option value = "<%=c.getNome().toLowerCase()%>"> <%=c.getNome()%> </option>
            <% } %>
        </select>
        <button type = "submit"> Scegli </button>
        oppure <button type="submit" formaction="index.jsp">Exit </button>   <!-- questo permette di lanciare un'azione divera ma con gli stessi parametri - qui è un errore (non ho bisogno dei parametri di questo form per uscire) ma è utile da sapere -->

    </form>
</body>
</html>
