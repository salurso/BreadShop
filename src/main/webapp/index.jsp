<%@ page import="model.UtenteDAO" %>
<%@ page import="model.Utente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/home.css"/>
  <title>Forneria Del Cilento</title>
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo"><a href="#">Forneria Del Cilento</a></div>
        <ul class="links">
            <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
            <li><a href="InitServlet?action=specialita">Specialità</a></li>
            <li><a href="InitServlet?action=contatti">Contatti</a></li>
            <%
                Utente utente = (Utente) session.getAttribute("login");
                if(utente!=null){
            %>
            <li><i class="fa-solid fa-cart-shopping fa-lg"></i></li>
            <%}%>
        </ul>
        <%
//            Utente utente = (Utente) session.getAttribute("login");
            if(utente!=null){
        %>

        <a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a>
        <%}else{%>
        <a href="InitServlet?action=login" class="action_btn">Login</a>
        <%}%>
        <div class="toggle_btn">
            <i class="fa-solid fa-bars"></i>
        </div>
    </div>
    <div class="dropdown_menu">
        <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
        <li><a href="InitServlet?action=specialita">Specialità</a></li>
        <li><a href="InitServlet?action=contatti">Contatti</a></li>
        <%
//            Utente utente = (Utente) session.getAttribute("login");
            if(utente!=null){
        %>
       <li> <i class="fa-solid fa-cart-shopping fa-lg"></i></li>
        <li><a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%></a></li>
        <%}else{%>
        <li><a href="InitServlet?action=login" class="action_btn">Login</a></li>
        <%}%>
    </div>
</header>

<section id="showprod">
<div class="container">
    <h1><span class="color"> Forneria </span>Del Cilento</h1>
    <p> Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è
        considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo
    </p>
<a class="btn_prod" href="prodotti"> I nostri Prodotti</a>
</div>
</section>



<script>
    const toggleBtn = document.querySelector('.toggle_btn')
    const toggleBtnIcon = document.querySelector('.toggle_btn i')
    const dropDownMenu= document.querySelector('.dropdown_menu')

    toggleBtn.onclick=function (){
        dropDownMenu.classList.toggle('open')
        const isOpen = dropDownMenu.classList.contains('open')

        toggleBtnIcon.classList = isOpen
            ? 'fa-solid fa-xmark'
            : 'fa-solid fa-bars'
    }
</script>
</form>
</body>
</html>

