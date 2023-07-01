<%@ page import="model.Carrello" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.ProdottoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrello</title>
  <link rel="stylesheet" type="text/css" href="./css/cart.css?v=<%=new Random().nextInt()%>"/>

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

  <div class="tabular--wrapper">
    <div class="table-container">

      <%
        ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
      %>
      <table>
        <thead>
        <tr>
          <th>Prodotto</th>
          <th>Nome </th>
          <th>Prezzo</th>
          <th>Quantità</th>
          <th>Totale</th>
          <th>Action</th>
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
          <td>€<%=p.getPrice()%></td>
          <td><%=c.getQuantity()%></td>
          <td><%=c.getTotal()%></td>
          <td><button>Rimuovi</button></td>
        </tr>
        </tbody>
        <%
            }
          }
        %>
      </table>

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
