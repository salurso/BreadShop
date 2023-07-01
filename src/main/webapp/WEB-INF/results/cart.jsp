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
//loggato
    if(utente!=null){
      ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
      if(carts!=null){
  %>
      <h1 class="main-title"> Ciao <%=utente.getName()%>, ecco i tuoi ordini:  </h1>
      <div class="tabular--wrapper">
        <div class="table-container">
          <table>
            <thead>
            <tr>
              <th></th>
              <th>Nome</th>
              <th>Prezzo</th>
              <th>Quantità</th>
              <th></th>
            </tr>
            </thead>
            <br>
            <tbody>
          <%
          double total=0;
          for(Carrello c : carts){
            if(c.getEmail().equals(utente.getEmail())){
              Prodotto p = c.getProducts();

          %>
            <tr>
              <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
              <td><%=p.getName()%></td>
              <td><%=p.getPrice()%></td>
              <td><input type="number" name="quantity" min=1  value="<%=c.getQuantity()%>" onchange="location.href='ManageCart?action=addQuantity&id=<%=p.getId()%>&email=<%=utente.getEmail()%>'"></td>
              <td><a class="link-user" href="ManageCart?action=removeProduct&id=<%=p.getId()%>&email=<%=utente.getEmail()%>">rimuovi</a></td>
              <%total+=(p.getPrice()*c.getQuantity());%>
            </tr>
          <%
              }
            }
          %>
            <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td>Totale: <%=total%></td>
            </tr>
            </tbody>
          </table>
        </div>
    <%
      }else{
//loggato senza prodotti
    %>
        <h1 class="main-title"> Ciao <%=utente.getName()%> il tuo carrello è vuoto!  </h1>
    <%
      }
//non loggato
    }else{
        ArrayList<Carrello> carts = (ArrayList<Carrello>) session.getAttribute("carts");
        if(carts!=null){
    %>
        <h1 class="main-title"> Benvenuto, ecco i tuoi ordini:</h1>
        <div class="tabular--wrapper">
          <div class="table-container">
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
              <tbody>
              <%
              double total=0;
              for(Carrello c : carts){
                Prodotto p = c.getProducts();
              %>
              <tr>
                <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
                <td><%=p.getName()%></td>
                <td><%=p.getPrice()%></td>
                <td><%=c.getQuantity()%></td>
                <td><a class="link-user" href="ManageCart?action=removeProductSession&id=<%=p.getId()%>">rimuovi</a></td>
                <%total+=(p.getPrice()*c.getQuantity());%>
              </tr>
              <%
                }
              %>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Totale: <%=total%></td>
              </tr>
              </tbody>
            </table>
          </div>
    <%
//non loggato senza prodotti
        }else{
    %>
          <h1 class="main-title"> Benvenuto, il tuo carrello è vuoto!</h1>
    <%
        }
    }
    %>
  </div>
</div>
</body>
</html>
