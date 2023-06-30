<%@ page import="model.Carrello" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.ProdottoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrello</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<div>
  <div class="home_ord">

    <h3> CARRELLO </h3>

  </div>
  <%
    if(utente!=null){
  %>

  <h1 class="main-title"> Ciao <%=utente.getName()%>, ecco i tuoi ordini:  </h1>
  <div class="tabular--wrapper">
    <div class="table-container">

      <%
        ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
      %>
      <table>
        <thead>
        <tr>
          <th></th>
          <th>Nome </th>
          <th>Prezzo</th>
          <th>Quantità</th>
        </tr>
        </thead>
        <br>
      <%
      for(Carrello c : carts){
        if(c.getEmail().equals(utente.getEmail())){
          Prodotto p = c.getProducts();
      %>
        <tbody>
        <tr>
          <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
          <td><%=p.getName()%></td>
          <td><%=p.getPrice()%></td>
          <td><%=c.getQuantity()%></td>
        </tr>
        </tbody>
      </table>
      <%
          }
        }
      %>
    </div>
    <%
    }else{%>
    <h3> BUCCHIN, ACCATT COCCOS, E' VACANT </h3>
    <%
      }
    %>
  </div>
</div>
</body>
</html>
