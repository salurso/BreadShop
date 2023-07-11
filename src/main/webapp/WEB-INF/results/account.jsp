<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="./css/account.css?v=<%=new Random().nextInt()%>"/>

</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<%
  ArrayList<Pagamento> creditCards = (ArrayList<Pagamento>) request.getAttribute("creditCards");
%>
<div class="container">

  <div class="col-metod">
    <h3 class="title">I TUOI METODI DI PAGAMENTO </h3>

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
            <td><button class="btn-user"><a class="link-user-remove" onclick="insertCard(<%=p.getId()%>)">Rimuovi Metodo</a></button></td>
          </tr>
          <%
              i++;
            }
          %>
        </table>
      </div>
    </div>
  </div><br><br>
  <div id="forms">
  <div class="row">
<%--  <form action="UpdateAddress" method="post">--%>

      <div class="col">
        <h3 class="title">il mio indirizzo</h3>
        <div class="inputBox">
          <span>telefono :</span>
          <input type="text" name="phone_number" id="phone_number" maxlength="10" <%if(utente.getPhone_number()!=null){%>value="<%=utente.getPhone_number()%>"<%}%> placeholder="3333333333">
        </div>
        <div class="inputBox">
          <span>citta' :</span>
          <input type="text" name="city" id="city" maxlength="50" <%if(utente.getCity()!=null){%>value="<%=utente.getCity()%>"<%}%> placeholder="Agropoli">
        </div>
        <div class="inputBox">
          <span>provincia :</span>
          <input type="province" name="province" id="province" maxlength="2" <%if(utente.getProvince()!=null){%>value="<%=utente.getProvince()%>"<%}%> placeholder="SA">
        </div>
        <div class="inputBox">
          <span>Indirizzo :</span>
          <input type="text" name="street" id="street" maxlength="50" <%if(utente.getStreet()!=null){%>value="<%=utente.getStreet()%>"<%}%> placeholder="Via Rossi">
        </div>

        <div class="flex">
          <div class="inputBox">
            <span>Num. civico</span>
            <input type="text" name="street_number" id="street_number" maxlength="3" <%if(utente.getStreet()!=null){%>value="<%=utente.getStreet_number()%>"<%}%> placeholder="15">
          </div>
          <div class="inputBox">
            <span>CAP :</span>
            <input type="text" name="cap" id="cap" maxlength="5" <%if(utente.getCap()!=null){%>value="<%=utente.getCap()%>"<%}%> placeholder="84070">
          </div>
        </div>
        <button class="btn-user"><a class="link-user-remove" onclick="updateAddress()">Rimuovi Admin</a></button>
<%--        onclick="return(validateOperation())"--%>
      </div>
<%--  </form>--%>

  <form action="OrderServlet" method="post">
      <div class="col">
        <h3 class="title">INSERISCI NUOVO METODO DI PAGAMENTO</h3>
        <input type="hidden" name="cardId" id="cardId" value="insert">
<%--        <div class="inputBox">--%>
<%--          <span>carte accettate :</span>--%>
<%--          <img src="./images/card_img.png" alt="mastercard - visa - paypal">--%>
<%--        </div>--%>
        <div class="inputBox">
          <span>titolare della carta :</span>
          <input type="text" name="holder" id="holder" placeholder="Mario Rossi">
        </div>
        <div class="inputBox">
          <span>numero carta di credito :</span>
          <input type="text" name="creditCardNumber" id="creditCardNumber"  maxlength="16" placeholder="1111 2222 3333 4444">
        </div>
        <div class="inputBox">
          <span>CVV :</span>
          <input type="text" name="cvv" id="cvv" maxlength="3" placeholder="123">
        </div>

        <span>Data di scadenza</span>
        <div class="flex">
          <div class="inputBox">
            <span>mese :</span>
            <input  type="text" name="expMonth" id="expMonth"  maxlength="2" placeholder="01">
          </div>
          <div class="inputBox">
            <span>anno :</span>
            <input type="text" name="expYear" id="expYear" maxlength="4" placeholder="2035">
          </div>
        </div>
      </div>
  </form>
  </div>
  </div>
  <input type="hidden" id="email" name="email" value="<%=utente.getEmail()%>"/>


</div>

<script>
  function updateAddress(){
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone_number").value;
    var city = document.getElementById("city").value;
    var province = document.getElementById("province").value;
    var street = document.getElementById("street").value;
    var streetNumber = document.getElementById("street_number").value;
    var cap = document.getElementById("cap").value;

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function (){
      if(xhr.readyState == 4 && xhr.status == 200){
        alert(xhr.responseText);
      }
    };
    xhr.open("POST", "UpdateAccount?action=address&email=" + email + "&phone=" + phone + "&city=" + city + "&province=" + province + "&street=" + street + "&streetNumber=" + streetNumber + "&cap=" + cap, true); //richiesta asincrona
    // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); //necessario nella post, non indispensabile nel get

    // var params = "action=address&email=" + encodeURIComponent(email) +
    //         "&phone=" + encodeURIComponent(phone) +
    //         "&city=" + encodeURIComponent(city) +
    //         "&province=" + encodeURIComponent(province) +
    //         "&street=" + encodeURIComponent(street) +
    //         "&streetNumber=" + encodeURIComponent(streetNumber) +
    //         "&cap=" + encodeURIComponent(cap);
    xhr.send();
  }
</script>

</body>
</html>
