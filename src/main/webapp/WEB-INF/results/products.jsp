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

  <%--<script>--%>
  <%--  function myprod(id){--%>
  <%--    let prod = document.getElementById(id);--%>
  <%--    prod.style.display = 'block';--%>
  <%--  }--%>

  <%--  function prodprev(id){--%>
  <%--    let prod_prev = document.getElementById(id);--%>
  <%--    prod_prev.style.display = 'flex';--%>

  <%--  }--%>
  <%--</script>--%>
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

    <div class="product" data-name="<%=p.getId()%>">
      <img src="upload/<%=p.getImage()%>" alt="CardImage">
      <h3> <%=p.getName()%> </h3>
      <div class="price"><%=p.getPrice()%>€</div>
      <a class="popup-btn"> Quick View </a>
    </div>


    <div class="product-preview">
      <div class="preview" data-target="<%=p.getId()%>" >
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


  <script type="text/javascript">

    var productsPreview = document.querySelectorAll('.product-preview');
    var popupBtn = document.querySelectorAll('.popup-btn');
    var closeBtn = document.querySelectorAll('.close-btn');

    //QUICK VIEW

    var popup = function(popupClick) {
      productsPreview.onclick = () => {
        previewContainer.style.display = 'flex';
        preview.classList.add('active');
      }
    }

    popupBtn.forEach((popupBtn, i) =>{
      popupBtn.addEventListener("click", ()=>{
        popup(i)
      });
    });


    //CHIUSURA

    closeBtn.forEach((closeBtn) =>{
      closeBtn.addEventListener("click", () =>{
        productsPreview.forEach((popupView) =>{
          popupView.classList.remove('active');
        });
      });
    });
  </script>

</body>
</html>
