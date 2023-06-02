<%@ page import="model.Utente" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.ProdottoDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/prod.css"/>
    <title>Gestione prodotti</title>

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
        <li> <i class="fa-solid fa-cart-shopping fa-lg"></i></li>
        <li><a href="InitServlet?action=login" class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%></a></li>
    </div>
</header>
<div class="cards-products">
<%
ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");
for(Prodotto p : prodotti){
%>

    <div class="card-product">
        <div class="card-body">
<%--            <a>--%>
                <img class="card-img" src="upload/<%=p.getImage()%>" alt="Card image" width="600" height="400">
<%--            </a>--%>
<%--            <div class="info-product">--%>
                <h4 class="card-title"><%=p.getName()%></h4>
                <div class="card-price"><%=p.getPrice()%>€</div>
                <div class="div-btn">
                    <button class="btn-card" value=" " onclick="location.href='ManageProduct?action=<%=p.getId()%>'">Gestisci prodotto</button>
                </div>
<%--            </div>--%>
        </div>
    </div>
<%
}
%>
    <div class="clearfix"></div>
</div>
</body>
</html>
