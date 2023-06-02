<%@ page import="model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/homeAdmin.css"/>
    <title>Forneria Del Cilento</title>

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
<header>
    <div class="navbar">
        <div class="logo"><a href="#">Forneria Del Cilento</a></div>
        <ul class="links">
            <li><a href="HomeServletAdministrator?action=utenti">Utenti</a></li>
            <li><a href="HomeServletAdministrator?action=prodotti_esauriti">Prodotti esauriti</a></li>
            <li><a href="HomeServletAdministrator?action=ordini">Ordini</a></li>

            <li><i class="fa-solid fa-cart-shopping fa-lg"></i></li>
        </ul>
        <a href="InitServlet?action=login" class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a>
        <div class="toggle_btn">
            <i class="fa-solid fa-bars"></i>
        </div>
    </div>
    <div class="dropdown_menu">
        <li><a href="HomeServletAdministrator?action=utenti">Utenti</a></li>
        <li><a href="HomeServletAdministrator?action=prodotti_esauriti">Prodotti esauriti</a></li>
        <li><a href="HomeServletAdministrator?action=ordini">Ordini</a></li>
        <li><i class="fa-solid fa-cart-shopping fa-lg"></i></li>
        <li><a href="InitServlet?action=login" class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%></a></li>
    </div>
</header>
<div class="container">
    <button class="item" id="add_product" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="manage_product" value=" " onclick="location.href='HomeServletAdministrator?action=manage_product'">
    </button>
    <button class="item" id="sold-out_products" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="orders" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="users" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
</div>

</body>
</html>
