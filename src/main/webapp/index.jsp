<%@ page import="model.UtenteDAO" %>
<%@ page import="model.Utente" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Categoria" %>
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Forneria Del Cilento</title>
</head>
<body>
<%if(request.getAttribute("result")!=null){%>
<input type="hidden" id="alert" value="<%=request.getAttribute("result")%>">
<%}%>

<header class="header">

    <div class="logo"><a href="HomePage">Forneria Del Cilento</a></div>
    <ul class="links">
        <li><a href="InitServlet?action=product">Prodotti</a></li>
        <li><a href="InitServlet?action=specialita">Specialità</a></li>
        <li><a href="InitServlet?action=contatti">Contatti</a></li>
        <li><a href="InitServlet?action=account">Account</a></li>
        <li><a href="CartServlet" ><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>

    </ul>
    <%
        Utente utente = (Utente) session.getAttribute("login");
        if(utente!=null){
    %>
    <ul class="menu">
        <li class="has-children"><a class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%><i class="fa fa-caret-down" aria-hidden="true"></i></a>
            <ul class="sub-menu">
                <li><a href="InitServlet?action=orders"> Ordini</a></li>
                <li><a href="LogoutServlet"> Logout </a></li>
            </ul>
        </li>
    </ul>


    <%}else{%>
    <a href="InitServlet?action=login" class="action_btn">Login</a>
    <%}%>
    <div class="toggle_btn">
        <i class="fa-solid fa-bars"></i>
    </div>

</header>

<div class="dropdown_menu">
    <li><a href="InitServlet?action=product">Prodotti</a></li>
    <li><a href="InitServlet?action=specialita">Specialità</a></li>
    <li><a href="InitServlet?action=contatti">Contatti</a></li>
    <li><a href="InitServlet?action=orders">Ordini</a></li>
    <li><a href="InitServlet?action=account">Account</a></li>
    <li><a href="InitServlet?action=carts"><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
    <%
        if(utente!=null){
    %>
    <li><a class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a></li>
    <li><a href="LogoutServlet"> Logout </a></li>
    <%}else{%>
    <li><a href="InitServlet?action=login" class="action_btn">Login</a></li>
    <%}%>
</div>


<section class="home" id="home">
    <div class="container">

        <h3> Forneria Del Cilento </h3>
        <p>
            Benvenuti al Panificio del Cilento ad Agropoli. Da noi troverete pane fragrante appena sfornato, dolci artigianali e prelibatezze salate, tutto preparato con passione e ingredienti di qualità.
            Siamo pronti ad offrirvi un'esperienza culinaria autentica nel cuore del Cilento. Vi aspettiamo con gioia per deliziare i vostri sensi!
        </p>
    </div>
</section>

<%--ABOUT--%>

<section class="about" id="about">
    <div class="about-img">
        <img src="./images/aboutimg.jpg">
    </div>
    <div class="about-text">
        <h2> Qualità e Tradizione</h2>
        <p>La Forneria del Cilento nasce ad Agropoli, all'interno del Parco Nazionale, con l'intenzione e la volontà di esaltare ogni giorno i prodotti ed i sapori autentici di una terra ricca di storia e tradizioni. </p>
        <p> Con la passione nella cura e nella lavorazione delle materie prime, con la continua ricerca delle ricette migliori per la soddisfazione quotidiana dei clienti, con la gentilezza e la disponibilità che li contraddistinguono,</p>
        <p>Simone e Marielena vi aspettano nel loro laboratorio artigianale per poter condividere con voi i sapori genuini del Cilento.</p>
        <a href="InitServlet?action=contatti" class="btn_about"> Learn More</a>
    </div>
</section>

<%--PRODUCT--%>
<div class="container-prod">
    <h3 class="title"> Categorie </h3>
    <div class="product-container">

        <div class="product" data-name="p-1">
            <img src="./images/paneFresco.png" alt="Card 1">
            <h3> Linea Fresco </h3>
        </div>

        <div class="product" data-name="p-2">
            <img src="./images/fresaBianca.png" alt="Card 1">
            <h3> Linea Secco </h3>
        </div>

        <div class="product" data-name="p-3">
            <img src="./images/focacciaOrigan.png" alt="Card 1">
            <h3> Rosticceria </h3>
        </div>

        <div class="product" data-name="p-4">
            <img src="./images/pasticceria.png" alt="Card 1">
            <h3> Pasticceria </h3>
        </div>

        <div class="product" data-name="p-5">
            <img src="./images/speciale.png" alt="Card 1">
            <h3> Speciali </h3>
        </div>
    </div>
</div>

<div class="product-preview">
    <div class="preview" data-target="p-1">
        <i class="fas fa-times"></i>
        <img src="./images/paneFresco.png" alt="Card 1">
        <h3> Linea Fresco </h3>
        <p>Pane fresco: croccante fuori, morbido dentro. Una delizia quotidiana.</p>
    </div>

    <div class="preview" data-target="p-2">
        <i class="fas fa-times"></i>
        <img src="./images/fresaBianca.png" alt="Card 1">
        <h3> Linea Secco </h3>
        <p>Pane secco: croccante e leggermente duro. Perfetto da sbriciolare per dare un tocco di croccantezza ai piatti.</p>
    </div>

    <div class="preview" data-target="p-3">
        <i class="fas fa-times"></i>
        <img src="./images/focacciaOrigan.png" alt="Card 1">
        <h3> Rosticceria </h3>
        <p>Rosticceria: sfiziosa varietà di delizie salate. Gusti irresistibili per un'esperienza golosa.</p>
    </div>

    <div class="preview" data-target="p-4">
        <i class="fas fa-times"></i>
        <img src="./images/pasticceria.png" alt="Card 1">
        <h3> Pasticceria </h3>
        <p>Pasticceria: dolci artigianali che conquistano il palato. Un tripudio di golosità.</p>
    </div>

    <div class="preview" data-target="p-5">
        <i class="fas fa-times"></i>
        <img src="./images/speciale.png" alt="Card 1">
        <h3> Speciali </h3>
        <p>Specialità: un'esplosione di sapori unici. Un'esperienza gastronomica indimenticabile</p>
    </div>

</div>

<section class="mid" id="mid">
    <div class="container-mid">
        <h3> Acquista i nostri prodotti! </h3>
        <p>Scopri il gusto autentico al Panificio del Cilento! Siamo qui per deliziare i tuoi sensi con il pane più fragrante,<br>
            dolci artigianali irresistibili e prelibatezze salate uniche. I nostri prodotti di alta qualità sono realizzati con passione e ingredienti selezionati.<br>
            Vieni a trovarci e lasciati conquistare dal sapore genuino del Cilento.<br>
            Assapora l'autenticità, vivi l'esperienza del gusto al Panificio del Cilento! Ti aspettiamo con gioia.
        </p><br>
        <a class="home_btn" href="InitServlet?action=product"> Nostro shop</a>
    </div>
</section>


<%--footer--%>

<footer class="footer">
    <div class="container-footer">
        <div class="row-footer">
            <div class="footer-col">
                <h4>Company</h4>
                <ul>
                    <li><a href="InitServlet?action=contatti">about us</a></li>
                    <li><a href="InitServlet?action=product">prodotti</a></li>
                    <li><a href="InitServlet?action=specialita">specialità</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Made by</h4>
                <ul>
                    <li><a>Andrea Salurso</a></li>
                    <li><a>Costantino Paciello</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Follow Us</h4>
                <div class="social">
                    <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://twitter.com/i/flow/login?redirect_after_login=%2Fhome%3F"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/forneriadelcilento/?utm_medium=copy_link"><i class="fab fa-instagram"></i></a>
                    <a href="https://it.linkedin.com/?original_referer=https%3A%2F%2Fwww.google.com%2F"><i class="fab fa-linkedin-in"></i></a>

                </div>
            </div>
        </div>
    </div>
</footer>

<script>

    $(document).ready(function() {
        $('.toggle_btn').click(function() {
            $('.dropdown_menu').toggleClass('open');
        });

        $(window).resize(function() {
            if ($(window).width() > 992) {
                $('.dropdown_menu').removeClass('open');
            }
        });
    });



        // script products
        const previewContainer = document.querySelector('.product-preview');
        const previewBox = Array.from(previewContainer.querySelectorAll('.preview'));

        // per ogni prodotto quando ci clicchi mostra le info
        document.querySelectorAll('.product-container .product').forEach(function(product) {
            product.addEventListener('click', function() {
                previewContainer.style.display = 'flex';
                const name = product.getAttribute('data-name');

                previewBox.forEach(function(preview) {
                    const target = preview.getAttribute('data-target');
                    if (name === target) {
                        preview.style.display = 'block';
                    } else {
                        preview.style.display = 'none';
                    }
                });
            });
        });

        previewBox.forEach(function(close) {
            close.querySelector('.fa-times').addEventListener('click', function() {
                close.style.display = 'none';
                previewContainer.style.display = 'none';
            });
        });
    // });

    if(document.getElementById("alert").value!=null)
        alert(document.getElementById("alert").value);
</script>
</body>
</html>

