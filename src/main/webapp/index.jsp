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
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>--%>
    <%--    <link rel="stylesheet" href="animate.min.css">--%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Forneria Del Cilento</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>


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
        <p>Simone e Marielena vi aspettano nel loro laboratorio artigianale per poter condividere con voi i sapori genuini del Cilento.</p>
        <a href="#" class="btn_about"> Learn More</a>
    </div>
</section>

<%--PRODUCT--%>
<div class="container-prod">
    <h3 class="title"> Categorie </h3>
    <div class="product-container">

        <div class="product" data-name="p-1">
            <img src="./upload/paneFresco.png" alt="Card 1">
            <h3> Linea Fresco </h3>
        </div>

        <div class="product" data-name="p-2">
            <img src="./upload/fresaBianca.png" alt="Card 1">
            <h3> Linea Secco </h3>
        </div>

        <div class="product" data-name="p-3">
            <img src="./upload/focacciaOrigan.png" alt="Card 1">
            <h3> Rosticceria </h3>
        </div>

        <div class="product" data-name="p-4">
            <img src="./upload/pasticceria.png" alt="Card 1">
            <h3> Pasticceria </h3>
        </div>

        <div class="product" data-name="p-5">
            <img src="./upload/speciale.png" alt="Card 1">
            <h3> Speciali </h3>
        </div>

    </div>
</div>

<div class="product-preview">
    <div class="preview" data-target="p-1">
        <i class="fas fa-times"></i>
        <img src="./upload/paneFresco.png" alt="Card 1">
        <h3> Linea Fresco </h3>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
    </div>

    <div class="preview" data-target="p-2">
        <i class="fas fa-times"></i>
        <img src="./upload/fresaBianca.png" alt="Card 1">
        <h3> Linea Secco </h3>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
    </div>

    <div class="preview" data-target="p-3">
        <i class="fas fa-times"></i>
        <img src="./upload/focacciaOrigan.png" alt="Card 1">
        <h3> Rosticceria </h3>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
    </div>

    <div class="preview" data-target="p-4">
        <i class="fas fa-times"></i>
        <img src="./upload/pasticceria.png" alt="Card 1">
        <h3> Pasticceria </h3>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
    </div>

    <div class="preview" data-target="p-5">
        <i class="fas fa-times"></i>
        <img src="./upload/speciale.png" alt="Card 1">
        <h3> Speciali </h3>
        <p>Lorem Ipsum dolor sit amet consectetur adipisicing elit. Consequatr, dolorem</p>
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

<script>

    // //script dropdown
    // const toggleBtn = document.querySelector('.toggle_btn')
    // const toggleBtnIcon = document.querySelector('.toggle_btn i')
    // const dropDownMenu= document.querySelector('.dropdown_menu')
    //
    // toggleBtn.onclick=function (){
    //     dropDownMenu.classList.toggle('open')
    //     const isOpen = dropDownMenu.classList.contains('open')
    //
    //     toggleBtnIcon.classList = isOpen
    //         ? 'fa-solid fa-xmark'
    //         : 'fa-solid fa-bars'
    // }
    //
    //
    // // script products
    // let previewContainer = document.querySelector('.product-preview');
    // let previewBox = previewContainer.querySelectorAll('.preview');
    //
    // //per ogni prodotto quando ci clicchi mostra le info
    // document.querySelectorAll('.product-container .product').forEach(product =>{
    //     product.onclick = () =>{
    //         previewContainer.style.display='flex';
    //         let name = product.getAttribute('data-name');
    //         previewBox.forEach(preview =>{
    //             let target = preview.getAttribute('data-target');
    //             if(name === target){
    //                 preview.classList.add('active');
    //             }
    //         });
    //     };
    // });
    //
    // previewBox.forEach(close =>{
    //     close.querySelector('.fa-times').onclick = () =>{
    //         close.classList.remove('active');
    //         previewContainer.style.display ='none';
    //     };
    // });

    window.addEventListener('DOMContentLoaded', function() {
        // script dropdown
        const toggleBtn = document.querySelector('.toggle_btn');
        const toggleBtnIcon = document.querySelector('.toggle_btn i');
        const dropDownMenu = document.querySelector('.dropdown_menu');

        toggleBtn.addEventListener('click', function() {
            dropDownMenu.classList.toggle('open');
            const isOpen = dropDownMenu.classList.contains('open');

            toggleBtnIcon.classList = isOpen ? 'fa-solid fa-xmark' : 'fa-solid fa-bars';
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
    });

</script>
</body>
</html>

