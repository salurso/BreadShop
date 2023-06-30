<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%
    Prodotto p = (Prodotto) request.getAttribute("product");
  %>

    <title><%=p.getName()%> - <%=p.getNameCategory()%></title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>

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
        <div class="price"><%=p.getDescription()%></div>
        <input type="hidden" name="id" value="<%=p.getId()%>">
        <input type="number" name="quantity" min=1  value="1">
        <%if(session.getAttribute("login")!=null){%>
        <input type="hidden" name="email" value="<%=utente.getEmail()%>">
        <%}%>
        <%--                <a href="AddCartServlet?id=<%=p.getId()%>&email=<%=utente.getEmail()%>" class="add-to-cart-btn">Add to Cart</a>--%>
        <input class="btn-cart" type="submit" value="Add to cart">
      </form>
  </div>
</div>
</body>
</html>
