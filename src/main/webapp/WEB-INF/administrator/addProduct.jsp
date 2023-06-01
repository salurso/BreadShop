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
        <input type="text" name="prodotto">
        <input type="file" id="image" name="image" value="inserisci immagine">
        <input type="submit" value="inserisci prodotto">INSERISCI PRODOTTO</input>
    </form>
</body>
</html>
