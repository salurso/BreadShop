<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/productAdmin.css?v=<%=new Random().nextInt()%>"/>
    <%
        Prodotto p = (Prodotto) request.getAttribute("prodotto");
    %>
    <title><%=p.getName()%></title>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <div class="product">
        <div class="box" id="product-img">
            <img class="card-img" src="upload/<%=p.getImage()%>" alt="Card image" width="600" height="400">
        </div>
        <div class="box" id="product-info">
            <h4><%=p.getName()%></h4>
            <label>id: </label><input id="id" type="text" value="<%=p.getId()%>"><br>
            <label>nome: </label><input id="name" type="text" value="<%=p.getName()%>"><br>
            <label>prezzo: </label><input id="price" type="text" value="<%=p.getPrice()%>"><br>
            <label>descrizione: </label><input id="description" type="text" value="<%=p.getDescription()%>">
        </div>
    </div>
</body>
</html>