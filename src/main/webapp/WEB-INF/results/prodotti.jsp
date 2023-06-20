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
  <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
  <link rel="stylesheet" type="text/css" href="./css/productAdmin.css?v=<%=new Random().nextInt()%>"/>
  <%
    Prodotto p = (Prodotto) request.getAttribute("product");
  %>
  <title><%=p.getName()%></title>

</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<div class="product">
  <div class="box" id="product-img">
    <img class="card-img" src="upload/<%=p.getImage()%>" alt="Card image" width="600" height="400">
  </div>
  <form action="UpdateProduct" method="POST">
    <div class="box" id="product-info">
      <h4><%=p.getName()%></h4>

      <label for="id">id: </label>
      <input id="id" name="id" type="text" value="<%=p.getId()%>" readonly>

      <label for="name">nome: </label>
      <input id="name" name="name" type="text" value="<%=p.getName()%>" maxlength="50">

      <label for="price">prezzo: </label>
      <input id="price" name="price" type="text" value="<%=p.getPrice()%>">

      <%--            <label for="image">Immagine: (il nome del file deve essere di max 20 caratteri)</label>--%>
      <%--            <input type="file" id="image" name="image" value="<%=p.getImage()%>">--%>

      <label for="categories">Nome categoria: </label>
      <select id="categories" name="categories">
        <%
          ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");
          for(String c : categories){
            if(c.equals(p.getNameCategory())){
        %>
        <option value="<%=c%>" selected><%=c%></option>
        <%      }else{
        %>
        <option value="<%=c%>"><%=c%></option>
        <%      }
        }
        %>
      </select>

      <label for="description">descrizione: </label>
      <textarea name="description" id="description" style="height:200px" maxlength="200"><%=p.getDescription()%></textarea>

      <input type="submit" name="action" value="AGGIORNA" onclick="return(validateUpdate())">
      <input type="submit" name="action" value="ELIMINA">
    </div>
  </form>
</div>
</body>
</html>