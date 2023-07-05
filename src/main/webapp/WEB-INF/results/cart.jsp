<%@ page import="model.Carrello" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.ProdottoDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="./css/cart.css?v=<%=new Random().nextInt()%>"/>

  <title>Carrello</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<div>
  <div class="home_ord">
    <h3> CARRELLO </h3>
  </div>

    <%
//loggato
  if(utente!=null){
    ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
    if(carts!=null && !carts.isEmpty()){
  %>
  <h1 class="main-title"> <%=utente.getName()%>, ecco il tuo carrello:  </h1>
  <div class="tabular--wrapper">
    <div class="table-container">
      <table>
        <tr>
          <th> Prodotto </th>
          <th> Quantità </th>
          <th> SubTotale </th>
        </tr>
        <%
          double total=0;
          for(Carrello c : carts){
            if(c.getEmail().equals(utente.getEmail())){
              Prodotto p = c.getProducts();
        %>
        <tr>
          <td>
            <div class="cart-info">
              <img class="ord-img" src="upload/<%=p.getImage()%>">
              <div>
                <p><%=p.getName()%></p>
                <small><%=p.getPrice()%></small>
                <a class="link-user" href="ManageCart?action=removeProduct&id=<%=p.getId()%>&email=<%=utente.getEmail()%>">Remove</a>
                <%total+=(p.getPrice()*c.getQuantity());%>
              </div>
            </div>
          </td>
          <td><input type="number" name="quantity" min=1  value="<%=c.getQuantity()%>" onchange="location.href='ManageCart?action=addQuantity&id=<%=p.getId()%>&email=<%=utente.getEmail()%>'"></td>
          <td><%=p.getPrice()*c.getQuantity()%></td>
        </tr>
        <%
            }
          }
        %>
      </table>

      <div class="total-price">
        <table>
          <tr>
            <td> Total </td>
            <td><%=total%></td>
          </tr>
          <tr>
            <td><button class="submit-ord" onclick="location.href='OrderServlet?action=checkout&email=<%=utente.getEmail()%>'">Procedi all'ordine</button></td>
          </tr>
        </table>
      </div>
    </div>

  </div>
    <%
    }else{
//loggato senza prodotti
    %>
  <h1 class="main-title"> <%=utente.getName()%> il tuo carrello è vuoto!  </h1>
  <h3 class="main-title"> <button class="send_prod" onclick="location.href='InitServlet?action=product'"> Our Shop </button></h3>

<%
    }
//non loggato
    }else{
      ArrayList<Carrello> carts = (ArrayList<Carrello>) session.getAttribute("carts");
      if(carts!=null && !carts.isEmpty()){
    %>
  <h1 class="main-title"> Ecco il tuo carrello: </h1>
  <div class="tabular--wrapper">
    <div class="table-container">
      <table>
        <tr>
          <th> Prodotto </th>
          <th> Quantità </th>
          <th> SubTotale </th>
        </tr>
        <%
          double total=0;
          for(Carrello c : carts){
            Prodotto p = c.getProducts();
        %>
        <tr>
          <td>
            <div class="cart-info">
              <img class="ord-img" src="upload/<%=p.getImage()%>">
              <div>
                <p><%=p.getName()%></p>
                <small><%=p.getPrice()%></small>
                <a class="link-user" href="ManageCart?action=removeProductSession&id=<%=p.getId()%>">Remove</a>
                <%total+=(p.getPrice()*c.getQuantity());%>
              </div>
            </div>
          </td>
          <td><input type="number" name="quantity" min=1  value="<%=c.getQuantity()%>" onchange="location.href='ManageCart?action=addQuantity&id=<%=p.getId()%>'"></td>
          <td><%=p.getPrice()*c.getQuantity()%></td>
        </tr>
        <%
          }
        %>
      </table>

      <div class="total-price">
        <table>
          <tr>
            <td> Total </td>
            <td><%=total%></td>
          </tr>
          <tr>
            <td><button class="submit-ord" onclick="location.href='InitServlet?action=login'">Procedi all'ordine</button></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
    <%
  //non loggato senza prodotti
    }else{
%>

    <h1 class="main-title"> Il tuo carrello è vuoto!</h1>
      <h3 class="main-title"> <button class="send_prod" onclick="location.href='InitServlet?action=product'"> Our Shop </button></h3>
<%--    <button class="send_prod" onclick="location.href='InitServlet?action=product'"> Our Shop </button>--%>


    <%
    }
  }
  %>
</body>
</html>