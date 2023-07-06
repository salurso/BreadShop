<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="./css/admin/manageUsers.css?v=<%=new Random().nextInt()%>"/>
  <title>Utenti</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbarAdmin.jsp" %>

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
          <%if(utente.getEmail().equals(u.getEmail())){%>
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
        <p id="bodyResponse"></p>
    </div>
  </div>
</div>

<script>
  function addAdmin(){
    var xhr = new XMLHttpRequest();
    var elements = document.getElementsByClassName("myInput");
    xhr.onreadystatechange = function (){
      if(xhr.readyState == 4 && xhr.status == 200){
        for (var i = 0; i < elements.length; i++) {
          elements[i].innerHTML = xhr.responseText;
        }
      }
    };
    for (var i = 0; i < elements.length; i++) {
      xhr.open("GET", "ManageAdministrator?action=addAdmin" + elements[i].value, true);
      xhr.send();
    }
    // document.getElementById("emailUser").value
  }

  // Supponiamo di avere una variabile "jsonResponse" contenente il JSON ricevuto dal server
//  var jsonResponse = '[{"dato":"Dato 1"}, {"dato":"Dato 2"}]';

  // Utilizza JSON.parse() per analizzare la stringa JSON in un oggetto JavaScript
//  var dataArray = JSON.parse(jsonResponse);
</script>

</body>
</html>
