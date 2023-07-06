<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<%@ page import="model.Carrello" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/infoProduct.css?v=<%=new Random().nextInt()%>"/>
  <link rel="stylesheet" type="text/css" href="./css/footer.css?v=<%=new Random().nextInt()%>"/>


  <%
    Prodotto p = (Prodotto) request.getAttribute("product");
    Carrello c = (Carrello) request.getAttribute("carts");
  %>

    <title><%=p.getName()%> - <%=p.getNameCategory()%></title>
</head>
<body>

<%@ include file="/WEB-INF/navbar/navbar.jsp" %>


<div class="main-wrapper">
  <div class="container">
    <div class="product-div">
      <div class="product-div-left">
        <div class="img-container">
          <img src="upload/<%=p.getImage()%>">
        </div>
      </div>

      <div class="product-div-right">
        <span class="product-name"><%=p.getName()%></span>
        <span class="product-price">€<%=p.getPrice()%>/kg</span>


        <p class="product-description"> <%=p.getDescription()%>Il pane integrale è definito “funzionale” perché svolge un’azione benefica su una o più funzioni dell’organismo al fine di migliorare la salute ed il benessere.
          Il profumo di cereali tostati ed un intenso sapore di grano sono le caratteristiche predominanti.

          Questo prodotto ha ricevuto la Medaglia d’Argento al Concorso Premio Roma – Sezione Nazionale per i migliori pani di tipo funzionale. </p>
        <div class="btn-groups">
          <%if(session.getAttribute("login")==null){%>
          <form action="AddCartSession" method="post">
              <%}else{%>
            <form action="AddCartServlet" method="post">
                <%}%>
              <input type="hidden" name="id" value="<%=p.getId()%>"/>
             <input class="quantity" type="number" name="quantity" min=1  value="1">
              <%if(session.getAttribute("login")!=null){%>
              <input type="hidden" name="email" value="<%=utente.getEmail()%>"/>
              <%}%>
              <input class="add-cart-btn" type="submit" value="Add to cart"/>
            </form>
        </div>
      </div>

    </div>
  </div>
</div>



<%@ include file="/WEB-INF/navbar/footer.jsp" %>
<%--<div class="small-container single-product">--%>
<%--  <div class="row">--%>
<%--    <div class="col-2">--%>
<%--      <img src="upload/<%=p.getImage()%>" alt="Card 1" id="product-img">--%>
<%--    </div>--%>
<%--    <div class="col-2">--%>
<%--      <p><%=p.getNameCategory()%></p>--%>
<%--      <h1> <%=p.getName()%> </h1>--%>
<%--      <h4><%=p.getPrice()%></h4>--%>
<%--&lt;%&ndash;      <h5><%=c.getQuantity()%></h5>&ndash;%&gt;--%>
<%--      <a href="" class="btn_add_to_cart"> Add To Cart</a>--%>
<%--      <h3>Details<i class="fa fa-indent"></i></h3>--%>
<%--      <br>--%>
<%--      <p><%=p.getDescription()%></p>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

</body>
</html>
