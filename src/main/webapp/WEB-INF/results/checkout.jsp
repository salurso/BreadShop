<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="./css/checkout.css?v=<%=new Random().nextInt()%>"/>
<%--  <link rel="stylesheet" type="text/css" href="./css/cartOrder.css?v=<%=new Random().nextInt()%>"/>--%>

</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<%
  ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
  ArrayList<Pagamento> creditCards = (ArrayList<Pagamento>) request.getAttribute("creditCards");
%>
<div class="container">

  <form action="OrderServlet" method="post">
    <div class="col">
      <h3 class="title">METODO DI PAGAMENTO</h3>

      <div class="tabular--wrapper">
        <div class="table-container">
          <table>
            <tr>
              <th> Numero </th>
              <th> Titolare carta </th>
              <th> Data di scadenza </th>
              <th> </th>
            </tr>
            <%
              int i=0;
              for(Pagamento p : creditCards){
                String number = String.valueOf(p.getNumber()).substring(String.valueOf(p.getNumber()).length()-4);
            %>
            <tr>
              <td>termina con <%=number%></td>
              <td><%=p.getHolder()%></td>
              <td><%=p.getExpMonth()%>/<%=p.getExpYear()%></td>
              <td><input type="radio" id="card<%=i%>" name="card" value="<%=p.getId()%>"></td>
            </tr>
            <%
                i++;
              }
            %>
            <input type="submit" name="action" id="check" value="inserisci" class="submit-btn">
          </table>
        </div>
      </div>
    </div><br>

    <div class="row">
      <div class="col">
        <h3 class="title">indirizzo</h3>
        <div class="inputBox">
          <span>telefono :</span>
          <input type="text" name="phone_number" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getPhone_number()%>"<%}%> placeholder="333 333 3333">
        </div>
        <div class="inputBox">
          <span>città :</span>
          <input type="text" name="city" <%if(utente.getCity()!=null){%>value="<%=utente.getCity()%>"<%}%> placeholder="Agropoli">
        </div>
        <div class="inputBox">
          <span>provincia :</span>
          <input type="province" name="province" <%if(utente.getProvince()!=null){%>value="<%=utente.getProvince()%>"<%}%> placeholder="SA">
        </div>
        <div class="inputBox">
          <span>Indirizzo :</span>
          <input type="text" name="street" <%if(utente.getStreet()!=null){%>value="<%=utente.getStreet()%>"<%}%> placeholder="Via Rossi">
        </div>

        <div class="flex">
          <div class="inputBox">
            <span>Num. civico</span>
            <input type="text" name="street_number" <%if(utente.getStreet()!=null){%>value="<%=utente.getStreet_number()%>"<%}%> placeholder="15">
          </div>
          <div class="inputBox">
            <span>CAP :</span>
            <input type="text" name="cap" <%if(utente.getCap()!=null){%>value="<%=utente.getCap()%>"<%}%> placeholder="84070">
          </div>
        </div>
      </div>

      <div class="col">
        <h3 class="title">pagamento</h3>
        <%if(request.getParameter("card")!=null){
          Pagamento p = (Pagamento) request.getAttribute("card");
        %>
          <input type="hidden" name="cardId" value="<%=p.getId()%>">
        <%}else{%>
          <input type="hidden" name="cardId" value="insert">
        <%}%>
        <div class="inputBox">
          <span>carte accettate :</span>
          <img src="./images/card_img.png" alt="mastercard - visa - paypal">
        </div>
        <div class="inputBox">
          <span>titolare della carta :</span>
          <input type="text" name="holder" <%if(request.getParameter("card")!=null){Pagamento p = (Pagamento) request.getAttribute("card");%>value="<%=p.getHolder()%>"<%}%> placeholder="Mario Rossi">
        </div>
        <div class="inputBox">
          <span>numero carta di credito :</span>
          <input type="text" name="creditCardNumber" <%if(request.getParameter("card")!=null){Pagamento p = (Pagamento) request.getAttribute("card");String number = String.valueOf(p.getNumber()).substring(String.valueOf(p.getNumber()).length()-4);%>value="termina con <%=number%>"<%}%> placeholder="1111 2222 3333 4444">
        </div>
        <div class="inputBox">
          <span>CVV :</span>
          <input type="text" name="cvv" <%if(request.getParameter("card")!=null){%>value="metodo selezionato"<%}%> placeholder="123">
        </div>

        <span>Data di scadenza</span>
        <div class="flex">
          <div class="inputBox">
            <span>mese :</span>
            <input type="text" name="expMonth" <%if(request.getParameter("card")!=null){Pagamento p = (Pagamento) request.getAttribute("card");%>value="<%=p.getExpMonth()%>"<%}%> placeholder="01">
          </div>
          <div class="inputBox">
            <span>anno :</span>
            <input type="number" name="expYear" <%if(request.getParameter("card")!=null){Pagamento p = (Pagamento) request.getAttribute("card");%>value="<%=p.getExpYear()%>"<%}%> placeholder="2035">
          </div>
        </div>
      </div>

      <div class="col">
        <h3 class="title">prodotti</h3>

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
                      <small id="price<%=p.getId()%>"><%=p.getPrice()%></small>
                      <a class="link-user" onclick="remove(<%=p.getId()%>)">Rimuovi</a>
<%--                      <a class="link-user" href="ManageCart?action=removeProduct&id=<%=p.getId()%>&email=<%=utente.getEmail()%>">Rimuovi</a>--%>
                      <%total+=(p.getPrice()*c.getQuantity());%>
                    </div>
                  </div>
                </td>
                <td><input type="number" id="num_<%=p.getId()%>" name="quantity" min=1 value="<%=c.getQuantity()%>" onchange="changeQuantity('<%=p.getId()%>')"></td>
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
                  <td><input type="text" name="total" id="total" value="<%=total%>" readonly/></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" id="email" name="email" value="<%=utente.getEmail()%>"/>
    <%if(total==0){
    %>
    <div class="return">
      <a class="return-prod" href="InitServlet?action=product">RITORNA AI PRODOTTI</a>
    </div>
    <%
      }else{
    %>
    <input type="submit" name="action" value="Acquista" class="submit-btn"/>
    <%}%>
  </form>

</div>

<script>
  function changeQuantity(id){
    var email = document.getElementById("email").value;
    var inputElement = document.getElementById('num_' + id); //elemento che contiene la quantità
    var quantity = inputElement.value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ManageCart", true); //richiesta asincrona
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); //necessario nella post, non indispensabile nel get

    var params = "action=changeQuantity&id=" + encodeURIComponent(id) +
            "&email=" + encodeURIComponent(email) +
            "&quantity=" + encodeURIComponent(quantity);

    xhr.send(params);
    setTimeout(function() {
      location.reload();
    }, 100);
  }

  function remove(id){
    var email = document.getElementById("email").value;
    var xhr = new XMLHttpRequest();

    xhr.open("POST", "ManageCart", true); //richiesta asincrona
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); //necessario nella post, non indispensabile nel get

    var params = "action=removeProduct&id=" + encodeURIComponent(id) +
                 "&email=" + encodeURIComponent(email);
    xhr.send(params);
    setTimeout(function() {
      location.reload();
    }, 100);
  }
</script>

</body>
</html>
