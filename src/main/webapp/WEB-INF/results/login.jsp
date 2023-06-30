<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <title>Benvenuti</title>
</head>
<body>

<%if(request.getAttribute("check")!=null){%>
<div class="alert" id="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <%=request.getAttribute("check")%>
</div>
<%}%>

<div class="wrapper">
    <h1>Login </h1>

    <form action="loginServlet" method="post">
        <input type="text" placeholder="E-mail" name="email" id="email"required>
        <i class="bi bi-person-fill"></i>
        <input type="password" placeholder="Password" name="password" id="password" required>
        <div class="recover">
            <a href="#">Password Dimenticata?</a>
        </div>
    <button onclick="return(validateLogin())" type="submit"> Login </button>
    </form>

    <div class="user">
        Sei nuovo? <a href="Register"> Register Here </a>
    </div>
</div>
<script>
    function validateLogin() {
        var password = document.getElementById('password').value;
        var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passwordRGX=/^[a-zA-Z0-9!@#$%^&*]*$/;
        var resultPassword=passwordRGX.test(password);
        if (password.length < 8) {
            alert("La password non rispetta il numero minimo di caratteri");
            return false;
        }
        if (resultPassword == false) {
            alert("La password non rispecchia il formato corretto.Riprovare");
            return false;
        }

        var email = document.getElementById('email').value;
        var resultEmail = emailRGX.test(email);
        if (resultEmail == false) {
            alert("L'email non rispecchia il formato corretto.Riprovare");
            return false;
        }

        return true;
    }
</script>
</body>
</html>










