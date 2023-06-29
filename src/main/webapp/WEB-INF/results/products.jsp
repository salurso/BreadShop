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

<div class="container">
  <h1> Prova </h1>
  <div class="video-container">
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
    <div class="video"><img src="./images/sfondoabout.jpg"></div>
  </div>         <div class="popup-video">
  <span>&times;</span>
  <img src="./images/sfondoabout.jpg">
</div>
</div>
<style>
  .container{
    position: relative;
    min-height: 100vh;
    background: #334;
  }
  .container h1{
    color: #E4E0BB;
    text-align: center;
    padding: 15px;
    font-size: 40px;
    font-weight: normal;
  }
  .container .video-container{
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    justify-content: center;
    padding: 10px;
  }
  .container .video-container .video{
    height: 250px;
    width: 350px;
    border: 5px solid #ffffff;
    box-shadow:0 5px 15px rgba(0,0,0.7);
    cursor: pointer;
    overflow: hidden;
  }
  .container .video-container .video img{
    height: 100%;
    width: 100%;
    object-fit: cover;
    transition: .2s linear;
  }
  .container .video-container .video:hover img{
    transform:scale(1.1);
  }
  .container .popup-video{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 100;
    background: rgba(0,0,0,.8);
    height: 100%;
    width: 100%;
    display: none;
  }
  .container .popup-video img{
    position: absolute;
    top:50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 750px;
    border-radius: 5px;
    border: 3px solid #ffffff;
    object-fit: cover;
  }
  .container .popup-video span{
    position: absolute;
    top:5px;
    right: 20px;
    font-size: 50px;
    color: black;
    font-weight: bolder;
    z-index: 100;
    cursor: pointer;
  }
</style>
<script>
  document.querySelectorAll('.video-container img').forEach(vid =>{
    vid.onclick = () => {
      document.querySelector('.popup-video').style.display = 'block';
      document.querySelector('.popup-video img').src = vid.getAttribute('src');
    }
  });
  document.querySelector('.popup-video span').onclick = () =>{
    document.querySelector('.popup-video').style.display = 'none';
  }
</script>

</body>

</html>
