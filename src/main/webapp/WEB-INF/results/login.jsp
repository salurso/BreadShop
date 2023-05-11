<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Benvenuti</title>
    
    <%
        String x = " ";
        if(request.getAttribute("parametri")!=null){
            x="Email o password errati!";
        }
    %>

</head>
<body>
<br>
<br>
<div class="wrapper">
    <h1>Login </h1>
    <form action="Homepage">
        <input type="text" placeholder="Username" id="username" required>
        <i class="bi bi-person-fill"></i>
        <input type="password" placeholder="Password" id="password" required>
        <div class="recover">
            <a href="#">Password Dimenticata?</a>
        </div>
        <button onclick="validateLogin()" type="submit" id="submit"> Login </button>
        <p style="color: red; text-align: center"><%=x%></p>
    </form>
    <div class="user">
        Sei nuovo? <a href="Register"> Register Here </a>
    </div>
</div>


<script>
    function validateLogin() {
        //var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        //var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        //var resultEmail = emailRGX.test(email);
        var passwordRGX=/^[a-zA-Z0-9!@#$%^&*]*$/;
        var resultPassword=passwordRGX.test(password);

        if (password.length < 8) {
            alert("La password non rispetta il numero minimo di caratteri");
            return false;
        }

        // if (passwordForm.password.value != passwordForm.password2.value) {
        //     alert("La passord inserita non coincide con la prima!")
        //     passwordForm.password.focus()
        //     passwordForm.password.select()
        //     return false
        // }
        // if (resultEmail == false) {
        //     alert("L'email non rispecchia il formato corretto.Riprovare");
        //     return false;
        // }

        if (resultPassword == false) {
            alert("La password è errata. Riprovare");
            return false;
        }
        return true;
    }
</script>
</body>
</html>









