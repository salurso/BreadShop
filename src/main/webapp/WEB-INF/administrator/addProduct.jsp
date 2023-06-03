<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: Costantino
  Date: 01/06/2023
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/addProductAdmin.css?v=<%=new Random().nextInt()%>"/>
    <title>Inserisci prodotto</title>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <div class="container-info">
        <form action="InsertProduct" enctype="multipart/form-data" method="POST">
            <label for="name">Nome: </label>
            <input type="text" name="name" id="name">

            <label for="price">Prezzo: </label>
            <input type="text" name="price" id="price">

            <label for="image">Immagine: (il nome del file deve essere di max 20 caratteri)</label>
            <input type="file" id="image" name="image" value="inserisci immagine">

            <label for="categories">Nome categoria: </label>
            <select id="categories" name="categories">
                <%
                    ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");
                    for(String c : categories){
                %>
                <option value="<%=c%>"><%=c%></option>
                <%
                    }
                %>
            </select>

            <label for="description">Descrizione: </label>
            <textarea name="description" id="description" style="height:200px"></textarea>

            <input type="submit" value="INSERISCI PRODOTTO">
        </form>
    </div>
</body>
</html>
