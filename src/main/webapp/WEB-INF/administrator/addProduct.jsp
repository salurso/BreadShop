<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
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
        <div class="add_product">
        <form action="InsertProduct" enctype="multipart/form-data" method="POST">
            <h3>Aggiungi Prodotto</h3>

            <div class="inputbox">
                <input class="box" type="text" name="name" id="name" maxlength="50"  required>
                <span> Nome </span>
            </div>

            <div class="inputbox">
                <input class="box" type="text" name="price" id="price" required>
                <span> Price </span>
            </div>

            <input class="box" type="file" id="image" name="image" value="inserisci immagine">

            <label for="categories">Categoria: </label>
            <select class="box" id="categories" name="categories" required>
                <option value="Seleziona_categoria" disabled selected>Seleziona Categoria</option>
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
            <textarea class="box" name="description" id="description" style="height:200px" maxlength="200"></textarea>

            <input class="btn_add" type="submit" value="INSERISCI PRODOTTO" onclick="return(validateInsert())">

        </form>
        </div>
    </div>


</body>
</html>
