<%@ page import="java.util.Random" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente" %>
<%@ page import="model.Prodotto" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" type="text/css" href="./css/checkout.css?v=<%=new Random().nextInt()%>"/>
  <link rel="stylesheet" type="text/css" href="./css/cartOrder.css?v=<%=new Random().nextInt()%>"/>

</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<%
  ArrayList<Carrello> carts = (ArrayList<Carrello>) request.getAttribute("carts");
%>
<div class="container">

  <form action="">

    <div class="row">

      <div class="col">
        <h3 class="title">indirizzo</h3>
        <div class="inputBox">
          <span>telefono :</span>
          <input type="text" name="phone_number" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getPhone_number()%>"<%}%> placeholder="333-333-3333">
        </div>
        <div class="inputBox">
          <span>citta' :</span>
          <input type="text" name="city" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getCity()%>"<%}%> placeholder="Agropoli">
        </div>
        <div class="inputBox">
          <span>provincia :</span>
          <input type="province" name="province" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getProvince()%>"<%}%> placeholder="SA">
        </div>
        <div class="inputBox">
          <span>Indirizzo :</span>
          <input type="text" name="street" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getStreet()%>"<%}%> placeholder="Via Rossi">
        </div>

        <div class="flex">
          <div class="inputBox">
            <span>Num. civico</span>
            <input type="text" name="street_number" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getStreet_number()%>"<%}%> placeholder="15">
          </div>
          <div class="inputBox">
            <span>CAP :</span>
            <input type="text" name="cap" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getCap()%>"<%}%> placeholder="84070">
          </div>
        </div>
      </div>

      <div class="col">
        <h3 class="title">pagamento</h3>
        <div class="inputBox">
          <span>carte accettate :</span>
          <img src="./images/card_img.png" alt="mastercard - visa - paypal">
        </div>
        <div class="inputBox">
          <span>titolare della carta :</span>
          <input type="text" name="cardholder" placeholder="Mario Rossi">
        </div>
        <div class="inputBox">
          <span>numero carta di credito :</span>
          <input type="number" name="creditCardNumber" placeholder="1111-2222-3333-4444">
        </div>
        <div class="inputBox">
          <span>CVV :</span>
          <input type="text" name="cvv" placeholder="1234">
        </div>

        <span>Data di scadenza</span>
        <div class="flex">
          <div class="inputBox">
            <span>mese :</span>
            <input type="text" name="expMonth" placeholder="01">
          </div>
          <div class="inputBox">
            <span>anno :</span>
            <input type="number" name="expYear" placeholder="2035">
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
                  <td><input type="text" name="total" value="<%=total%>" readonly/></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" name="email" value="<%=utente.getEmail()%>"/>
    <input type="submit" name="action" value="Acquista" class="submit-btn">

  </form>

</div>

</body>
</html>