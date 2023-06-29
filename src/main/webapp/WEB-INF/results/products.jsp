<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
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

    <div <%=p.getId()%> class="product" data-name="<%=p.getId()%>">
      <img src="upload/<%=p.getImage()%>" alt="CardImage">
      <h3> <%=p.getName()%> </h3>
      <div class="price"><%=p.getPrice()%>€</div>
      <a class="popup-btn"> Quick View </a>
    </div>


    <div class="product-preview">
      <div id="<%=p.getId()%>" class="preview" data-target="<%=p.getId()%>" >
        <a><i class="fas fa-times close-btn"></i></a>
        <div class="product-img">
          <img src="upload/<%=p.getImage()%>" alt="CardImage">
        </div>
        <div class="info">
          <h3> <%=p.getName()%></h3>
          <p><%=p.getDescription()%></p>
          <span class="price"><%=p.getPrice()%>€</span>
          <a href="#" class="add-cart-btn">Add to Cart</a>
          <a href="#" class="add-wish">Add to WhishList</a>
        </div>
      </div>

    </div>

    <%
        }
    %>
  </div>
    <%
  }%>
</div>
<script>
  let previewContainer = document.querySelector('.product-preview');
  let previewBox = previewContainer.querySelectorAll('.preview');

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
//altro metodo
<style>
  .container {
    display: flex;
    flex-wrap: wrap;
  }

  .card {
    width: 200px;
    padding: 10px;
    margin: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
  }

  .card img {
    width: 100%;
    height: auto;
    margin-bottom: 10px;
  }

  .overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  }

  .overlay.active {
    display: flex;
  }

  .overlay-content {
    width: 400px;
    padding: 20px;
    background-color: #fff;
    border-radius: 4px;
  }

  .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }

  .close-btn:hover {
    color: red;
  }

  .overlay-content img {
    width: 100%;
    height: auto;
    margin-bottom: 10px;
  }

  .overlay-content h3 {
    margin-top: 0;
  }

  .overlay-content p {
    margin-bottom: 10px;
  }

  .add-to-cart-btn {
    display: block;
    margin-top: 10px;
    padding: 10px 15px;
    background-color: #3498db;
    color: #fff;
    text-align: center;
    text-decoration: none;
    border-radius: 4px;
  }

  .add-to-cart-btn:hover {
    background-color: #2980b9;
  }
</style>
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
    <img src="upload/<%=p.getImage()%>" alt="Card 1">
    <h3><%=p.getName()%></h3>
    <div class="price"><%=p.getPrice()%>€</div>
  </div>

<%--  <div class="card">--%>
<%--    <img src="path_to_image2.jpg" alt="Card 2">--%>
<%--    <h3>Card 2</h3>--%>
<%--    <div class="price">24.99€</div>--%>
<%--  </div>--%>
  <!-- Add more cards here -->
</div>

<div class="overlay">
  <div class="overlay-content">
    <button class="btn_closed" onclick="function closeOverlay(){
     var overlay = document.querySelector('.overlay');
      overlay.style.display = 'none';
    }
    closeOverlay()">Chiudi anteprima</button>    <%--    <a><i class="fas fa-times close-btn"></i></a>--%>
    <img src="" alt="Preview Image" id="preview-image">
    <h3 id="preview-title"><%=p.getName()%></h3>
    <p id="preview-category"><%=p.getNameCategory()%></p>
    <p id="preview-price"><%=p.getPrice()%></p>
    <p id="preview-description"><%=p.getDescription()%></p>
    <a href="#" class="add-to-cart-btn">Add to Cart</a>
  </div>
</div>
  <%
    }
  %>
</div>
<%
  }
%>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const cards = document.querySelectorAll(".card");
    const overlay = document.querySelector(".overlay");
    const previewImage = document.getElementById("preview-image");
    const previewTitle = document.getElementById("preview-title");
    const previewCategory = document.getElementById("preview-category");
    const previewPrice = document.getElementById("preview-price");
    const previewDescription = document.getElementById("preview-description");
    const addToCartBtn = document.querySelector(".add-to-cart-btn");
    const closeBtn = document.querySelector(".close-btn");

    cards.forEach(function(card) {
      card.addEventListener("click", function() {
        const imgSrc = this.querySelector("img").src;
        const title = this.querySelector("h3").textContent;
        const category = "Category"; // Aggiungi la categoria corretta qui
        const price = this.querySelector(".price").textContent;

        previewImage.src = imgSrc;
        previewTitle.textContent = title;
        previewCategory.textContent = category;
        previewPrice.textContent = price;
        previewDescription.textContent = "Description"; // Aggiungi la descrizione corretta qui

        overlay.classList.add("active");
      });
    });

    addToCartBtn.addEventListener("click", function(event) {
      event.preventDefault();
      // Aggiungi il codice per l'azione "Aggiungi al carrello" qui
    });

    function closeOverlay() {
      var overlay = document.querySelector('.overlay');
      overlay.style.display = 'none';
    }
  });

  $(document).ready(function () {
    $(".btn_closed").click(function () {
      location.reload(true);
    });
  });
</script>

<%--<style>--%>
<%--  #image-container {--%>
<%--    text-align: center;--%>
<%--  }--%>

<%--  #image-container img {--%>
<%--    cursor: pointer;--%>
<%--    max-width: 300px;--%>
<%--  }--%>

<%--  #description {--%>
<%--    display: none;--%>
<%--    text-align: center;--%>
<%--  }--%>

<%--  .hide-button {--%>
<%--    display: none;--%>
<%--    position: absolute;--%>
<%--    top: 10px;--%>
<%--    right: 10px;--%>
<%--    padding: 5px;--%>
<%--    background-color: #ffffff;--%>
<%--    border: none;--%>
<%--    cursor: pointer;--%>
<%--  }--%>
<%--</style>--%>



<%--        <div id="image-container">--%>
<%--        <img src="./images/sfondoabout.jpg" alt="Immagine" onclick="showDescription()" />--%>
<%--      </div>--%>






<%--<div id="description">--%>
<%--  <img src="./images/sfondoabout.jpg" alt="Immagine" />--%>
<%--  <p>Questa è la descrizione dell'immagine.--%>
<%--    <button classe="hide-button" onclick="hideDescription()">Nascondi</button>--%>
<%--  </p>--%>

<%--</div>--%>

<%--<script>--%>
<%--  function showDescription() {--%>
<%--    var imageContainer = document.getElementById("image-container");--%>
<%--    var description = document.getElementById("description");--%>
<%--    var hideButton = document.getElementById("hide-button");--%>
<%--    imageContainer.style.display = "none";--%>
<%--    description.style.display = "block";--%>
<%--    hideButton.style.display = "block";--%>
<%--  }--%>

<%--  function hideDescription() {--%>
<%--    var imageContainer = document.getElementById("image-container");--%>
<%--    var description = document.getElementById("description");--%>
<%--    var hideButton = document.getElementById("hide-button");--%>
<%--    imageContainer.style.display = "block";--%>
<%--    description.style.display = "none";--%>
<%--    hideButton.style.display = "none";--%>
<%--  }--%>
<%--</script>--%>
<%--<div class="container">--%>
<%--  <h1> Prova </h1>--%>
<%--  <div class="video-container">--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--    <div class="video"><img src="./images/sfondoabout.jpg"></div>--%>
<%--  </div>         <div class="popup-video">--%>
<%--  <span>&times;</span>--%>
<%--  <img src="./images/sfondoabout.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--<style>--%>
<%--  .container{--%>
<%--    position: relative;--%>
<%--    min-height: 100vh;--%>
<%--    background: #334;--%>
<%--  }--%>
<%--  .container h1{--%>
<%--    color: #E4E0BB;--%>
<%--    text-align: center;--%>
<%--    padding: 15px;--%>
<%--    font-size: 40px;--%>
<%--    font-weight: normal;--%>
<%--  }--%>
<%--  .container .video-container{--%>
<%--    display: flex;--%>
<%--    flex-wrap: wrap;--%>
<%--    gap: 15px;--%>
<%--    justify-content: center;--%>
<%--    padding: 10px;--%>
<%--  }--%>
<%--  .container .video-container .video{--%>
<%--    height: 250px;--%>
<%--    width: 350px;--%>
<%--    border: 5px solid #ffffff;--%>
<%--    box-shadow:0 5px 15px rgba(0,0,0.7);--%>
<%--    cursor: pointer;--%>
<%--    overflow: hidden;--%>
<%--  }--%>
<%--  .container .video-container .video img{--%>
<%--    height: 100%;--%>
<%--    width: 100%;--%>
<%--    object-fit: cover;--%>
<%--    transition: .2s linear;--%>
<%--  }--%>
<%--  .container .video-container .video:hover img{--%>
<%--    transform:scale(1.1);--%>
<%--  }--%>
<%--  .container .popup-video{--%>
<%--    position: fixed;--%>
<%--    top: 0;--%>
<%--    left: 0;--%>
<%--    z-index: 100;--%>
<%--    background: rgba(0,0,0,.8);--%>
<%--    height: 100%;--%>
<%--    width: 100%;--%>
<%--    display: none;--%>
<%--  }--%>
<%--  .container .popup-video img{--%>
<%--    position: absolute;--%>
<%--    top:50%;--%>
<%--    left: 50%;--%>
<%--    transform: translate(-50%, -50%);--%>
<%--    width: 750px;--%>
<%--    border-radius: 5px;--%>
<%--    border: 3px solid #ffffff;--%>
<%--    object-fit: cover;--%>
<%--  }--%>
<%--  .container .popup-video span{--%>
<%--    position: absolute;--%>
<%--    top:5px;--%>
<%--    right: 20px;--%>
<%--    font-size: 50px;--%>
<%--    color: black;--%>
<%--    font-weight: bolder;--%>
<%--    z-index: 100;--%>
<%--    cursor: pointer;--%>
<%--  }--%>
<%--</style>--%>
<%--<script>--%>
<%--  document.querySelectorAll('.video-container img').forEach(vid =>{--%>
<%--    vid.onclick = () => {--%>
<%--      document.querySelector('.popup-video').style.display = 'block';--%>
<%--      document.querySelector('.popup-video img').src = vid.getAttribute('src');--%>
<%--    }--%>
<%--  });--%>
<%--  document.querySelector('.popup-video span').onclick = () =>{--%>
<%--    document.querySelector('.popup-video').style.display = 'none';--%>
<%--  }--%>
<%--</script>--%>

</body>

</html>
