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
    <script>
        function validateInsert() {
            var nameRGX=/^[a-zA-Z' ']*$/;
            var name=document.getElementById('name').value;
            if((nameRGX.test(name))==false){
                alert("Nome non valido!");
                return false;
            }

            var price=document.getElementById('price').value;
            var priceRGX=/^[0-9'.']*$/;
            if(priceRGX.test(price)==false){
                alert("Errore nella definizione del prezzo: usare il '.' invece della ','");
                return false;
            }

            var filePart=document.getElementById('image').value;;
            alert(filePart.length);
            if(filePart.length>32){
                alert("Nome immagine massimo 20 caratteri");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <div class="container-info">
        <form action="InsertProduct" enctype="multipart/form-data" method="POST">
            <label for="name">Nome: </label>
            <input type="text" name="name" id="name" maxlength="50" required>

            <label for="price">Prezzo: </label>
            <input type="text" name="price" id="price" required>

            <label for="image">Immagine: </label>
            <input type="file" id="image" name="image" value="inserisci immagine">

            <label for="categories">Nome categoria: </label>
            <select id="categories" name="categories" required>
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
            <textarea name="description" id="description" style="height:200px" maxlength="200"></textarea>

            <input type="submit" value="INSERISCI PRODOTTO" onclick="return(validateInsert())">
        </form>
    </div>
</body>
</html>
