<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css"/>
    <%
        Prodotto p = (Prodotto) request.getAttribute("prodotto");
    %>
    <title><%=p.getName()%></title>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <div class="product">
        <div class="prod">
            <img class="card-img" src="upload/<%=p.getImage()%>" alt="Card image" width="600" height="400">
        </div>
        <div class="prod">
            <h4><%=p.getName()%></h4>
            <label>id: </label><input id="id" type="text" value="<%=p.getId()%>">
            <label>nome: </label><input id="name" type="text" value="<%=p.getName()%>">
            <label>prezzo: </label><input id="price" type="text" value="<%=p.getPrice()%>">
            <label>descrizione: </label><input id="description" type="text" value="<%=p.getDescription()%>">
        </div>
    </div>
</body>
</html>