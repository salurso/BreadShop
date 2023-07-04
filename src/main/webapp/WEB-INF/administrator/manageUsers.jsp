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
  <link rel="stylesheet" type="text/css" href="./css/manageUsers.css?v=<%=new Random().nextInt()%>"/>

  <title>Utenti</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/headerAdmin.jsp" %>

<div>
  <div class="home_ord">
    <h3> UTENTI </h3>
  </div>
  <h1 class="main-title"> Ecco la lista di tutti gli utenti  </h1>
  <div class="tabular--wrapper">
    <div class="table-container">
      <%
        ArrayList<Utente> users = (ArrayList<Utente>) request.getAttribute("users");

      %>

      <%--            <h2>Ordini di: <%=o.getEmail_user()%></h2>--%>
      <table>
        <thead>
        <tr>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Email</th>
          <th>Admin</th>
          <th>Action</th>

        </tr>
        </thead>
        <br>
        <% for(Utente u : users){ %>
        <tbody>
        <tr>
          <td><%= u.getName() %></td>
          <td><%= u.getSurname()%></td>
          <td><%= u.getEmail()%></td>
          <td><%= u.isAdmin()%></td>
          <td><button class="btn-user"><a class="link-user-rendi" href="ManageAdministrator?action=addAdmin<%=u.getEmail()%>">Rendi Amministratore</a></button>
          <button class="btn-user"><a class="link-user-remove" href="ManageAdministrator?action=removeAdmin<%=u.getEmail()%>">Rimuovi Amministratore</a></button></td>
        </tr>
        </tbody>
        <%
          }   %>
      </table>
    </div>
  </div>
</div>

<%--  <h1 class="main-title"> Ecco la lista di tutti gli utenti  </h1>--%>
<%--  <div class="tabular--wrapper">--%>
<%--    <div class="table-container">--%>

<%--      <table>--%>
<%--        <tr>--%>
<%--          <th>Nome</th>--%>
<%--          <th>Cognome</th>--%>
<%--          <th>Email</th>--%>
<%--          <th>Admin</th>--%>
<%--          <th></th>--%>
<%--          <th></th>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--          ArrayList<Utente> users = (ArrayList<Utente>) request.getAttribute("users");--%>
<%--          for(Utente u : users){--%>
<%--        %>--%>

<%--        <tr>--%>
<%--          <td><%=u.getName()%></td>--%>
<%--          <td><%=u.getSurname()%></td>--%>
<%--          <td><%=u.getEmail()%></td>--%>
<%--          <td><%=u.isAdmin()%></td>--%>
<%--          <td><button class="btn-user"><a class="link-user" href="ManageAdministrator?action=addAdmin<%=u.getEmail()%>">Rendi Amministratore</a></button></td>--%>
<%--          <td><button class="btn-user"><a class="link-user" href="ManageAdministrator?action=removeAdmin<%=u.getEmail()%>">Rimuovi Amministratore</a></button></td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--          }--%>
<%--        %>--%>
<%--      </table>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

</body>
</html>
