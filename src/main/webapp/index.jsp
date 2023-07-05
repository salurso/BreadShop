<%@ page import="model.UtenteDAO" %>
<%@ page import="model.Utente" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
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
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>--%>
    <%--    <link rel="stylesheet" href="animate.min.css">--%>
    <link rel="stylesheet" href="aos-by-red.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Forneria Del Cilento</title>
</head>
<body>
<header class="header">
    <%--   <nav class="navbar">--%>
    <div class="logo"><a href="HomePage">Forneria Del Cilento</a></div>
    <ul class="links">

        <li><a href="InitServlet?action=product">Prodotti</a></li>
        <li><a href="InitServlet?action=specialita">Specialità</a></li>
        <li><a href="InitServlet?action=contatti">Contatti</a></li>
<%--        <li><a href="InitServlet?action=accounts"> Account</a></li>--%>

        <li><a href="CartServlet" ><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>

    </ul>
<%--            <div class="search">--%>
<%--                <label>--%>
<%--                    <input type="text" placeholder="Search here">--%>
<%--                    <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--                </label>--%>
<%--            </div>--%>
    <%
        Utente utente = (Utente) session.getAttribute("login");
        if(utente!=null){
    %>
    <ul class="menu">

        <li class="has-children"><a class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%><i class="fa fa-caret-down" aria-hidden="true"></i></a>
            <ul class="sub-menu">
                <li><a href="InitServlet?action=orders"> Ordini</a></li>
<%--                <li><a href="InitServlet?action=accounts"> Account</a></li>--%>
                <li><a href="loginServlet?action=logout"> Logout </a></li>
            </ul>
        </li>
    </ul>

    <%}else{%>
    <a href="InitServlet?action=login" class="action_btn">Login</a>
    <%}%>
    <div class="toggle_btn">
        <i class="fa-solid fa-bars"></i>
    </div>
    <%--   </nav>--%>
</header>

<div class="dropdown_menu">
    <li><a href="InitServlet?action=product">Prodotti</a></li>
    <li><a href="InitServlet?action=specialita">Specialità</a></li>
    <li><a href="InitServlet?action=contatti">Contatti</a></li>
<%--    <li><a href="InitServlet?action=accounts"> Account</a></li>--%>
    <li><a href="InitServlet?action=orders">Ordini</a></li>
    <li><a href="CartServlet"><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
    <%
        if(utente!=null){
    %>
    <li><a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a></li>
    <%}else{%>
    <li><a href="InitServlet?action=login" class="action_btn">Login</a></li>
    <%}%>
</div>

<%--HOME--%>
<h2><%=request.getAttribute("result")%></h2>
<section class="home" id="home">
    <div class="container">
        <h3> Forneria Del Cilento </h3>
        <p> Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è
            considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo
        </p>
        <a class="home_btn" href="product"> Learn More </a>
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
        <p>Simone e Marielena vi aspettano nel loro laboratorio artigianale per poter condividere con voi i sapori genuini del Cilento.</p>
        <a href="#" class="btn_about"> Learn More</a>
    </div>
</section>



<%--PRODUCT--%>
<div class="container-prod">
    <h3 class="title"> I Nostri Prodotti</h3>
    <div class="product-container">

        <div class="product" data-name="p-1">
            <img src="./images/pane1.webp" alt="fotopane">
            <h3> Pane Bianco </h3>
            <div class="price">€3.00/kg</div>
        </div>

        <div class="product" data-name="p-2">
            <img src="./images/pane1.webp" alt="fotopane">
            <h3> Rosticceria </h3>
            <div class="price">€3.00/kg</div>
        </div>

        <div class="product" data-name="p-3">
            <img src="./images/semola.png" alt="fotopane">
            <h3> Pane di Semola </h3>
            <div class="price">€4.99/kg</div>
        </div>

        <div class="product" data-name="p-4">
            <img src="./images/semola.png" alt="fotopane">
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
            <h3> Specialità </h3>
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
        <img src="./images/semola.png" alt ="fotopane">
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
        <img src="./images/paneBianco.png" alt ="fotopane">
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
            <a href="WEB-INF/results/products.jsp" class="more">Learn More</a>
        </div>
    </div>

    <div class="preview" data-target="p-6">
        <i class="fas fa-times"></i>
        <img src="./images/frese.png" alt="fotopane">
        <h3> Specialità </h3>
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

<section class="mid" id="mid">
    <div class="container-mid">
        <h3> Acquista i nostri prodotti! </h3>
        <p> La forneria del cilento, si impegna ad offrire <br>
            la miglior qualità e velocità di spedizione su tutto il territorio del Cilento <br>
            Cosa aspetti? Acquista anche tu il nostro pane
        </p>
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
                    <li><a href="#">about us</a></li>
                    <li><a href="#">our products</a></li>
                    <li><a href="#">our service</a></li>
                    <li><a href="#">privacy & policy</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Get Help</h4>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">shipping</a></li>
                    <li><a href="#">returns</a></li>
                    <li><a href="#">order status</a></li>
                    <li><a href="#">payment options</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Online Shop</h4>
                <ul>
                    <li><a href="#">Pane</a></li>
                    <li><a href="#">Rosticceria</a></li>
                    <li><a href="#">Biscotti</a></li>
                    <li><a href="#">Specialità</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Follow Us</h4>
                <div class="social">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>

                </div>
            </div>
        </div>
    </div>
</footer>


<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>

    AOS.init({
        duration: 4000,
        once: true,
    });

    //script search
    // const header = document.querySelector(".header"),
    //     searchIcon = document.querySelector("#searchIcon");
    //
    //     searchIcon.addEventListener("click", () =>{
    //         header.classList.toggle("openSearch");
    //         if(header.classList.contains("openSearch")){
    //            return searchIcon.classList.replace("fa-magnifying-glass", "fa-xmark");
    //         }
    //         searchIcon.classList.replace("fa-xmark", "fa-magnifying-glass")
    // });

    //script dropdown
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

    //per ogni prodotto quando ci clicchi mostra le info
    document.querySelectorAll('.product-container .product').forEach(product =>{
        product.onclick = () =>{
            previewContainer.style.display='flex';
            let name = product.getAttribute('data-name');
            previewBox.forEach(preview =>{
                let target = preview.getAttribute('data-target');
                if(name === target){
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

