<%@ page import="model.Categoria" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/admin/categoryAdmin.css?v=<%=new Random().nextInt()%>"/>
    <%Categoria p = (Categoria) request.getAttribute("categories");%>
    <title>Categoria </title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbarAdmin.jsp" %>

<div class="category">
    <form action="UpdateCategory"  method="POST">
        <h3 class="add_prod_title">Modifica Categoria</h3>

        <label for="name"> Nome: </label>
        <input id="name" name="name" type="text" value="<%=p.getName()%>" maxlength="50">

        <label for="description">Descrizione: </label>
        <textarea class="box" name="description" id="description" style="height:200px" maxlength="400"><%=p.getDescription()%></textarea>

        <div class="btnadd">
            <input class="btn_update" type="submit" name="action" value="AGGIORNA" onclick="return(validateUpdate())">
        </div>
    </form>
        <input class="btn_delete" type="submit" name="action" value="ELIMINA" onclick="return(confirmDelete())">
</div>


<script>
    function confirmDelete(){
        if(confirm("Sei sicuro di voler eliminare?\nRICORDA: verranno eliminati anche i prodotti appartententi a questa categoria!")){
            window.location.href="UpdateCategory?action=ELIMINA&name=<%=p.getName()%>";
        }else{
            alert("eliminazione annullata");
        }
    }

    function validateUpdate() {
        var nameRGX = /^[a-zA-Z' ']*$/;
        var name = document.getElementById('name').value;
        if ((nameRGX.test(name)) == false) {
            alert("Nome non valido!");
            return false;
        }
    }
</script>
</body>
</html>