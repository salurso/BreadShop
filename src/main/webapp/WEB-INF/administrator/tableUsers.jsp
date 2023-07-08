<%@ page import="model.Utente" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 06/07/2023
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ViewUser</title>
</head>
<body>
<%
    ArrayList<Utente> users = (ArrayList<Utente>) request.getAttribute("users");

%>

<table>
    <thead>
    <tr>
        <th>Nome</th>
        <th>Cognome</th>
        <th>Email</th>
        <th>Admin</th>
        <th></th>
        <th></th>

    </tr>
    </thead>
    <br>
    <% for(Utente u : users){ %>
    <%--        <% for(Utente u : dataArray) %>--%>
    <tbody>
    <tr>
        <td><%=u.getName()%></td>
        <td><%=u.getSurname()%></td>
        <td class="emailUser" value="<%=u.getEmail()%>"><%=u.getEmail()%></td>
        <td class="isAdmin"><%=u.isAdmin()%></td>
        <%if(u.getEmail().equals(u.getEmail())){%>
        <td><button class="btn-user"><a class="link-user-disabled">Rendi Amministratore</a></button></td>
        <td><button class="btn-user"><a class="link-user-disabled">Rimuovi Amministratore</a></button></td>
        <%}else{%>
        <td><button class="btn-user" onclick="addAdmin()"><a class="link-user-rendi" value="<%=u.getEmail()%>" onclick="addAdmin()" id="btn-add">Rendi Amministratore</a></button></td>
        <td><button class="btn-user"><a class="link-user-remove" href="ManageAdministrator?action=removeAdmin<%=u.getEmail()%>">Rimuovi Amministratore</a></button></td>
        <%}%>
        <%--          href="ManageAdministrator?action=addAdmin<%=u.getEmail()%>--%>
    </tr>

    </tbody>
    <%
        }   %>
</table>

</body>
</html>
