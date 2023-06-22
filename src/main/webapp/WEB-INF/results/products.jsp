<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./css/navbar.css?v=<%=new Random().nextInt()%>"/>
  <link rel="stylesheet" type="text/css" href="./css/product.css?v=<%=new Random().nextInt()%>"/>

  <%
    ArrayList<Prodotto> products = (ArrayList<Prodotto>) request.getAttribute("product");
    ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");
  %>
  <title>Prodotti</title>

  <script>
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

</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>

<section class="home_ord" id="home_prod">
  <div class="container_ord" data-aos="fade-up" data-aos-duration="3000"
       data-aos-anchor-placement="top-bottom">
    <h3> Prodotti del Cilento </h3>
    <p> Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è
      considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo
    </p>
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

    <div class="product" data-name="p-1">
    <img src="upload/<%=p.getImage()%>" alt="CardImage">
      <h3> <%=p.getName()%> </h3>
      <div class="price"><%=p.getPrice()%>€</div>
<%--      <div class="btn">--%>
<%--        <a href="#" class="more">Add To Cart</a>--%>
<%--      </div>--%>
    </div>

    <div class="product-preview">
      <div class="preview" data-target="p-1">
        <i class="fas fa-times"></i>
        <img src="upload/<%=p.getImage()%>" alt="CardImage">
        <h3> <%=p.getName()%> </h3>
      </div>
      <p class="description"><%=p.getDescription()%></p>
      <div class="price"><%=p.getPrice()%>€</div>
      <div class="btn">
        <%--      <a>Learn More</a>--%>
      </div>
    </div>
    <%
        }
    %>
  </div>
  <%
    }
  %>
</div>







</body>
</html>