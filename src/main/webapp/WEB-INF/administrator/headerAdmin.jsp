<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/headerAdmin.css?=<%=new Random().nextInt()%>"/>

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
</head>
<body>
<%
    Utente utente = (Utente) session.getAttribute("loginAdmin");
%>
<header class="header">

    <div class="logo"><a href="#">Forneria Del Cilento</a></div>
    <ul class="links">
        <li><a href="HomeServletAdministrator?action=utenti">Utenti</a></li>
        <li><a href="HomeServletAdministrator?action=prodotti_esauriti">Prodotti esauriti</a></li>
        <li><a href="HomeServletAdministrator?action=ordini">Ordini</a></li>
        <li><a href="HomeServletAdministrator?action=prova">PROVA</a></li>
    </ul>

    <ul class="menu">
        <li class="has-children"> <a href="InitServlet?action=login" class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> <i class="fa fa-caret-down" aria-hidden="true"></i></a>
            <ul class="sub-menu">
                <li><a href="loginServlet?action=logout"> Logout </a></li>
            </ul>
        </li>
    </ul>

    <div class="toggle_btn">
        <i class="fa-solid fa-bars"></i>
    </div>
    </div>
    <div class="dropdown_menu">
        <li><a href="HomeServletAdministrator?action=utenti">Utenti</a></li>
        <li><a href="HomeServletAdministrator?action=prodotti_esauriti">Prodotti esauriti</a></li>
        <li><a href="HomeServletAdministrator?action=ordini">Ordini</a></li>
        <li><a href="HomeServletAdministrator?action=prova">PROVA</a></li>
        <li><a href="InitServlet?action=login" class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%></a></li>
    </div>
</header>
</body>
</html>
