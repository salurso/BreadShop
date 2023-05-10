<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione</title>
  <link rel="stylesheet" href="style.css">

  <%
    String x=" ";
    if(request.getAttribute("check")!=null){
      x="Email già presente!";
    }
  %>

  <script>
    function validateRegistration() {
      var email = document.getElementById('email').value;
      var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      if ((emailRGX.test(email) == false)) {
        alert("Formato email non valido!");
        return false;
      }

      var passwordRGX=/^[a-zA-Z0-9!@?]*$/;
      var password = document.getElementById('password').value;
      if((passwordRGX.test(password))==false){
        alert("Caratteri password non validi!");
        return false;
      }
      if((password.length<8 ||password.length>30 ))
      {
        alert("Dimensione password non valida!");
        return false;
      }

      var nomeRGX=/^[a-zA-Z' ']*$/;
      var nome=document.getElementById('name').value;
      if((nomeRGX.test(nome))==false){
        alert("Nome non valido!");
        return false;
      }

      var cognomeRGX=/^[a-zA-Z' ']*$/;
      var cognome=document.getElementById('surname').value;
      if((cognomeRGX.test(cognome))==false){
        alert("Cognome non valido!");
        return false;
      }
      
      return true;
    }
  </script>
</head>
<body>

<div class="wrapper_reg">
  <h1>Sign Up </h1>
  <form action="process_registration" method="post">
    <input type="text" placeholder="Username" name ="username" required>
    <input type="text" placeholder="Name" name="name" required>
    <input type="text" placeholder="Surname" name="surname" required>
    <input type="email" placeholder="E-mail" name="email" id="email" required>
    <!--    <input type="text" placeholder="Phone number" name="phone_number">-->
    <!--    <input type="text" placeholder="Province" name="province">-->
    <!--    <input type="text" placeholder="City" name="city">-->
    <!--    <input type="text" placeholder="CAP" name="cap">-->
    <!--    <input type="text" placeholder="Street" name="street">-->
    <!--    <input type="text" placeholder="Civic number" name="civic_number">-->
    <input type="password" placeholder="Password" name="password" required>
    <hr>
    <button onclick="return(validateRegistration())" type="submit">Sign up</button>
    <div class="user">
      Sei gia' registrato? <a href="login.jsp"> Login Here </a>
    </div>
  </form>
</div>

</body>
</html>
