<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="java.time.temporal.UnsupportedTemporalTypeException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/navbar.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/product.css?v=<%=new Random().nextInt()%>"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


    <%
        ArrayList<Prodotto> products = (ArrayList<Prodotto>) request.getAttribute("product");
        ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");
    %>
    <title>Prodotti</title>


</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<section class="home_ord" id="home_prod">
    <div class="container_ord" data-aos="fade-up" data-aos-duration="3000"
         data-aos-anchor-placement="top-bottom">
        <h3> Prodotti del Cilento </h3>
        <%--    <p> Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è--%>
        <%--      considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo--%>
        <%--    </p>--%>
    </div>
</section>

<div class="container-prod">
        <%
    for(String category : categories){
  %>

    <h3 class="title"><%=category%></h3>

    <div class="product-container">
        <%
            for(Prodotto p : products)
                if(p.getNameCategory().equals(category)){
        %>
        <div class="container">
            <div class="card">
                <%if(session.getAttribute("login")==null){%>
                    <form action="InitServlet?action=login" method="post">
                <%}else{%>
                    <form action="AddCartServlet" method="post">
                <%}%>
                        <img src="upload/<%=p.getImage()%>" alt="Card 1">
                        <h3><%=p.getName()%></h3>
                        <div class="price"><%=p.getPrice()%>€</div>
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        <input type="hidden" name="quantity" min=1  value="1">
                        <%if(session.getAttribute("login")!=null){%>
                            <input type="hidden" name="email" value="<%=utente.getEmail()%>">
                        <%}%>
        <%--                <a href="AddCartServlet?id=<%=p.getId()%>&email=<%=utente.getEmail()%>" class="add-to-cart-btn">Add to Cart</a>--%>
                        <input class="btn-cart" type="submit" value="Add to cart">
                        <a href="ProductServlet?id=<%=p.getId()%>" class="add-to-cart-btn" >View More</a>
                    </form>
            </div>
        </div>
        <%
                }
        %>
    </div>
    <%
    }
    %>
<%--            <script>--%>
<%--                $(document).ready(function () {--%>
<%--                    $(".btn-cart").click(function () {--%>
<%--                        location.reload()--%>
<%--                        window.location="products.jsp"--%>
<%--                    });--%>
<%--                });--%>
<%--            </script>--%>
<%--        <div class="overlay">--%>
<%--            <div class="overlay-content">--%>
<%--                <button class="btn_closed" onclick="function closeOverlay(){--%>
<%--     var overlay = document.querySelector('.overlay');--%>
<%--      overlay.style.display = 'none';--%>
<%--    }--%>
<%--    closeOverlay()">Chiudi anteprima</button>--%>
<%--                <form action="AddCartServlet" method="post">--%>
<%--                <img src="" alt="Preview Image" id="preview-image">--%>
<%--                <h3 id="preview-title" name=""><%=p.getName()%></h3>--%>
<%--                <p id="preview-category"><%=p.getNameCategory()%></p>--%>
<%--                <p id="preview-price"><%=p.getPrice()%></p>--%>
<%--                <p id="preview-description"><%=p.getDescription()%></p>--%>
<%--                <div class="price">#<%=p.getId()%></div>--%>

            <%--                <input id="cart" class="add-to-cart-btn" type="submit">Add to Ca</input>--%>
<%--                <a href="AddCartServlet?id=<%=p.getId()%>&price=<%=p.getPrice()%>&email=<%=utente.getEmail()%>" class="add-to-cart-btn">Add to Cart</a>--%>
<%--                    <button onclick="location.href='AddCartServlet'"></button>--%>
<%--                <a href="#" class="add-cart-btn">Add to Cart</a>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    <script>--%>
<%--        document.addEventListener("DOMContentLoaded", function() {--%>
<%--            const cards = document.querySelectorAll(".card");--%>
<%--            const overlay = document.querySelector(".overlay");--%>
<%--            const previewImage = document.getElementById("preview-image");--%>
<%--            const previewTitle = document.getElementById("preview-title");--%>
<%--            const previewCategory = document.getElementById("preview-category");--%>
<%--            const previewPrice = document.getElementById("preview-price");--%>
<%--            const previewDescription = document.getElementById("preview-description");--%>
<%--            const addToCartBtn = document.querySelector(".add-to-cart-btn");--%>
<%--            const closeBtn = document.querySelector(".close-btn");--%>

<%--            cards.forEach(function(card) {--%>
<%--                card.addEventListener("click", function() {--%>
<%--                    const imgSrc = this.querySelector("img").src;--%>
<%--                    const title = this.querySelector("h3").textContent;--%>
<%--                    const category = "Category"; // Aggiungi la categoria corretta qui--%>
<%--                    const price = this.querySelector(".price").textContent;--%>

<%--                    previewImage.src = imgSrc;--%>
<%--                    previewTitle.textContent = title;--%>
<%--                    previewCategory.textContent = category;--%>
<%--                    previewPrice.textContent = price;--%>
<%--                    previewDescription.textContent = "Description"; // Aggiungi la descrizione corretta qui--%>

<%--                    overlay.classList.add("active");--%>
<%--                });--%>
<%--            });--%>

<%--            addToCartBtn.addEventListener("click", function(event) {--%>
<%--                event.preventDefault();--%>
<%--                // Aggiungi il codice per l'azione "Aggiungi al carrello" qui--%>
<%--            });--%>

<%--            function closeOverlay() {--%>
<%--                var overlay = document.querySelector('.overlay');--%>
<%--                overlay.style.display = 'none';--%>
<%--            }--%>
<%--        });--%>

<%--        // function addCart(){--%>
<%--        //     var id = document.querySelectorAll("input");--%>
<%--        // }--%>

<%--    </script>--%>
</body>
</html>