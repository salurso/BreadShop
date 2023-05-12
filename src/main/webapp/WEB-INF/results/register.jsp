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
    <input type="text" placeholder="Username" name ="username" id = "username" required>
    <input type="text" placeholder="Name" name="name" id = "name" required>
    <input type="text" placeholder="Surname" name="surname" id = "surname"required>
    <input type="email" placeholder="E-mail" name="email" id="email" required>
    <input type="password" placeholder="Password" name="password" id = "password" required>
    <hr>
    <button onclick="return(validateRegistration())" type="submit">Sign up</button>
    <p style="color: red; text-align: center"><%=x%></p>

    <div class="user">
      Sei gia' registrato? <a href="login"> Login Here </a>
    </div>
  </form>
</div>

</body>
</html>
