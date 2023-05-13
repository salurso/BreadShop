<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/homeAdmin.css"/>
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
                Utente utente = (Utente) session.getAttribute("loginAdmin");
                if(utente!=null){
            %>
            <li><i class="fa-solid fa-cart-shopping fa-lg"></i></li>
            <%}%>
        </ul>
        <%
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
</body>
</html>
