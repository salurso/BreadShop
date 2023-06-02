<%--
  Created by IntelliJ IDEA.
  User: Costantino
  Date: 01/06/2023
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserisci prodotto</title>
</head>
<body>
    <form action="InsertProduct" enctype="multipart/form-data" method="POST">
        <label for="name">Nome: </label>
        <input type="text" name="name" id="name">
        <label for="price">Prezzo: </label>
        <input type="number" name="price" id="price">
        <label for="imgage">Immagine: </label>
        <input type="file" id="imgage" name="image" value="inserisci immagine">
        <label for="description">Descrizione: </label>
        <input type="text" name="description" id="description">
        <label for="category">Nome categoria: </label>
        <input type="text" name="category" id="category">

        <input type="submit" value="INSERISCI PRODOTTO">
    </form>
</body>
</html>
