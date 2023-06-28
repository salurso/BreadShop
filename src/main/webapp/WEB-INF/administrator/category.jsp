<%@ page import="model.Categoria" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/categoryAdmin.css?v=<%=new Random().nextInt()%>"/>
    <%Categoria p = (Categoria) request.getAttribute("categories");%>
    <title>Categoria </title>
</head>
<body>
    <div class="category">
        <form>
            <div class="box" id="category-info">

                <label for="name">nome: </label>
                <input id="name" name="name" type="text" value="<%=p.getName()%>" maxlength="50">

                <label for="description">descrizione: </label>
                <textarea name="description" id="description" style="height:200px" maxlength="200"><%=p.getDescription()%></textarea>

                <input type="submit" name="action" value="AGGIORNA" onclick="return(validateUpdate())">
                <input type="submit" name="action" value="ELIMINA">
            </div>
        </form>
    </div>
<script>
    function validateUpdate() {
        var nameRGX=/^[a-zA-Z' ']*$/;
        var name=document.getElementById('name').value;
        if((nameRGX.test(name))==false){
            alert("Nome non valido!");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
