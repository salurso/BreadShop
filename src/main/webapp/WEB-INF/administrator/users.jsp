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
  <link rel="stylesheet" type="text/css" href="./css/manageorders.css?v=<%=new Random().nextInt()%>"/>

  <title>Utenti</title>
</head>
<body>

<%@ include file="/WEB-INF/administrator/headerAdmin.jsp" %>
<div>
  <div class="home_ord">
    <h3> UTENTI </h3>
  </div>

  <h1 class="main-title"> Ecco la lista di tutti gli utenti  </h1>
  <div class="tabular--wrapper">
    <div class="table-container">

      <table>
        <tr>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Email</th>
        </tr>
        <%
          ArrayList<Utente> user = (ArrayList<Utente>) request.getAttribute("user");
          for(Utente u : user){
        %>

        <tr>
          <td><%=u.getName()%></td>
          <td><%=u.getSurname()%></td>
          <td><%=u.getEmail()%></td>
        </tr>
        <%
          }
        %>
      </table>
    </div>
  </div>
</div>

</body>
</html>
