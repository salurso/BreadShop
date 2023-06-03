<%@ page import="model.UtenteDAO" %>
<%@ page import="model.Utente" %>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/home.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="css/navbar.css?=<%=new Random().nextInt()%>"/>
    <title>Forneria Del Cilento</title>
</head>
<body>
<header class="header">
<%--   <nav class="navbar">--%>
        <div class="logo"><a href="#">Forneria Del Cilento</a></div>
        <ul class="links">
            <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
            <li><a href="InitServlet?action=specialita">Specialità</a></li>
            <li><a href="InitServlet?action=contatti">Contatti</a></li>
            <li><a><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
<%--            <%--%>
<%--                Utente utente = (Utente) session.getAttribute("login");--%>
<%--                if(utente!=null){--%>
<%--            %>--%>
<%--            <li><i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></li>--%>
<%--            <%}%>--%>
        </ul>
        <%
            Utente utente = (Utente) session.getAttribute("login");
            if(utente!=null){
        %>

        <a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a>
        <%}else{%>
        <a href="InitServlet?action=login" class="action_btn">Login</a>
        <%}%>
        <div class="toggle_btn">
            <i class="fa-solid fa-bars"></i>
        </div>
<%--   </nav>--%>
</header>

<div class="dropdown_menu">
        <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
        <li><a href="InitServlet?action=specialita">Specialità</a></li>
        <li><a href="InitServlet?action=contatti">Contatti</a></li>
        <li><a><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
        <%
            if(utente!=null){
        %>
        <li><a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a></li>
        <%}else{%>
        <li><a href="InitServlet?action=login" class="action_btn">Login</a></li>
        <%}%>
    </div>

<%--HOME--%>
<section class="home" id="home">
    <div class="container">
        <h3> Forneria Del Cilento </h3>
        <p> Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è
            considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo
        </p>
        <a class="btn_prod" href="prodotti"> I nostri Prodotti</a>
    </div>
</section>

<%--ABOUT--%>

<section class="about" id="about">
    <div class="about-img">
        <img src="./images/aboutimg.jpg">
    </div>
    <div class="about-text">
        <h2> Our History</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
        <a href="#" class="btn_about"> Learn More</a>
    </div>
</section>

<%--PRODUCT--%>

<section class="product" id="product">
    <div class="heading">
        <h2> Our Products </h2>
    </div>

    <div class="products-container">
        <div class="box">
            <img src="./images/pane1.avif" alt="">
            <h3> Pane Bianco </h3>
            <div class="content-prod">
                <span> €3.00/kg</span>
                <a href="#"> Add to cart </a>
            </div>
        </div>
            <div class="box">
                <img src="./images/pane1.avif" alt="">
                <h3> Pane Bianco </h3>
                <div class="content-prod">
                    <span> €3.00/kg</span>
                    <a href="#"> Add to cart </a>
                </div>
             </div>
                <div class="box">
                    <img src="./images/pane1.avif" alt="">
                    <h3> Pane Bianco </h3>
                    <div class="content-prod">
                        <span> €3.00/kg</span>
                        <a href="#"> Add to cart </a>
                    </div>
                </div>
                    <div class="box">
                        <img src="./images/pane1.avif" alt="">
                        <h3> Pane Bianco </h3>
                        <div class="content-prod">
                            <span> €3.00/kg</span>
                            <a href="#"> Add to cart </a>
                        </div>
                    </div>
        <div class="box">
            <img src="./images/pane1.avif" alt="">
            <h3> Pane Bianco </h3>
            <div class="content-prod">
                <span> €3.00/kg</span>
                <a href="#"> Add to cart </a>
            </div>
        </div>
        <div class="box">
            <img src="./images/pane1.avif" alt="">
            <h3> Pane Bianco </h3>
            <div class="content-prod">
                <span> €3.00/kg</span>
                <a href="#"> Add to cart </a>
            </div>
        </div>
    </div>

</section>








<%--<section id="about">--%>
<%--    <div class="content">--%>
<%--        <div class="title">--%>
<%--            <h2> La storia del nostro pane</h2>--%>
<%--            <p>Più di 30 anni di esperienza!!</p>--%>
<%--        </div>--%>
<%--        <div class="about-content">--%>
<%--            <div>--%>
<%--                <p>--%>
<%--                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy--%>
<%--                    text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.--%>
<%--                    It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.--%>
<%--                </p>--%>
<%--                <p>--%>
<%--                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy--%>
<%--                    text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.--%>
<%--                    It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.--%>
<%--                </p>--%>
<%--                <a href="#" class="btn_about"> Learn More </a>--%>
<%--            </div>--%>
<%--            <img src="./images/fotoabout.jpeg" alt="fotoabout">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
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
</body>
</html>

