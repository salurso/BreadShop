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
        <a class="home_btn" href="prodotti"> I nostri Prodotti</a>
    </div>
</section>

<%--ABOUT--%>

<section class="about" id="about">
    <div class="about-img">
        <img src="./images/aboutimg.jpg">
    </div>
    <div class="about-text">
        <h2> Our History</h2>
        <p>La Forneria del Cilento nasce ad Agropoli, all'interno del Parco Nazionale, con l'intenzione e la volontà di esaltare ogni giorno i prodotti ed i sapori autentici di una terra ricca di storia e tradizioni. </p>
        <p> Con la passione nella cura e nella lavorazione delle materie prime, con la continua ricerca delle ricette migliori per la soddisfazione quotidiana dei clienti, con la gentilezza e la disponibilità che li contraddistinguono,</p>
        <p>Simone e Marielena vi aspettano nel loro laboratorio artigianale per poter condividere con voi i sapori genuini del Cilento.</p>
        <a href="#" class="btn_about"> Learn More</a>
    </div>
</section>

<%--<section class="mid">--%>
<%--    <div>--%>
<%--        <img src="./images/fotomid.png">--%>
<%--    </div>--%>
<%--</section>--%>


<%--PRODUCT--%>
<div class="container-prod">
    <h3 class="title">Our Products</h3>
    <div class="product-container">

    <div class="product" data-name="p-1">
        <img src="./images/pane1.webp" alt="fotopane">
        <h3> Pane Bianco </h3>
        <div class="price">€3.00/kg</div>
    </div>

        <div class="product" data-name="p-2">
            <img src="./images/rosticceria.png" alt="fotopane">
            <h3> Rosticceria </h3>
            <div class="price">€3.00/kg</div>
        </div>

        <div class="product" data-name="p-3">
            <img src="./images/semola.png" alt="fotopane">
            <h3> Pane di Semola </h3>
            <div class="price">€4.99/kg</div>
        </div>

        <div class="product" data-name="p-4">
            <img src="./images/integrale.png" alt="fotopane">
            <h3> Pane Integrale </h3>
            <div class="price">€3.00/kg</div>
        </div>

        <div class="product" data-name="p-5">
            <img src="./images/biscottato.png" alt="fotopane">
            <h3> Pane Biscottato </h3>
            <div class="price">€3.00/kg</div>
        </div>

        <div class="product" data-name="p-6">
            <img src="./images/frese.png" alt="fotopane">
            <h3> Frese Integrali </h3>
            <div class="price">€3.00/kg</div>
        </div>
    </div>
</div>

<div class="product-preview">
    <div class="preview" data-target="p-1">
        <i class="fas fa-times"></i>
        <img src="./images/pane1.webp" alt ="fotopane">
        <h3> Pane Bianco </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="#" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-2">
        <i class="fas fa-times"></i>
        <img src="./images/rosticceria.png" alt ="fotopane">
        <h3> Rosticceria </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="#" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-3">
        <i class="fas fa-times"></i>
        <img src="./images/semola.png" alt ="fotopane">
        <h3> Pane di Semola </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="#" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-4">
        <i class="fas fa-times"></i>
        <img src="./images/integrale.png" alt ="fotopane">
        <h3> Pane Integrale </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="#" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-5">
        <i class="fas fa-times"></i>
        <img src="./images/biscottato.png" alt ="fotopane">
        <h3> Pane Biscottato </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="./WEB-INF/results/prodotti.jsp" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-6">
        <i class="fas fa-times"></i>
        <img src="./images/frese.png" alt="fotopane">
        <h3> Frese Integrali </h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(250)</span>
        </div>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
        <div class="price">€3.00/kg</div>
        <div class="btn">
            <a href="#" class="more">Learn More</a>
        </div>
    </div>

</div>

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

    // script products

    let previewContainer = document.querySelector('.product-preview');
    let previewBox = previewContainer.querySelectorAll('.preview');

    document.querySelectorAll('.product-container .product').forEach(product =>{
        product.onclick = () =>{
            previewContainer.style.display='flex';
            let name = product.getAttribute('data-name');
            previewBox.forEach(preview =>{
                let target = preview.getAttribute('data-target');
                if(name == target){
                    preview.classList.add('active');
                }
            });
        };
    });

    previewBox.forEach(close =>{
        close.querySelector('.fa-times').onclick = () =>{
            close.classList.remove('active');
            previewContainer.style.display ='none';
        };
    });

</script>
</body>
</html>

