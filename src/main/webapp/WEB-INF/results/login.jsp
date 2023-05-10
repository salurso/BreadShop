<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Benvenuti</title>
</head>
<body>
<br>
<br>
<%--<c:if test="${param.error == 1}">--%>
<%--<p style="color:red"> Il nome utente non è presente all'interno del database, Prova di nuovo o registrati.</p>--%>
<%--</c:if>--%>
<div class="wrapper">
    <h1>Login </h1>
    <form action="loginServlet">
        <input type="text" placeholder="Username" required>
        <i class="bi bi-person-fill"></i>
        <input type="password" placeholder="Password" required>
        <div class="recover">
            <a href="#">Password Dimenticata?</a>
        </div>
    <button> Login </button>
    </form>
    <div class="user">
        Sei nuovo? <a href="Register"> Register Here </a>
    </div>
</div>
</body>
</html>










