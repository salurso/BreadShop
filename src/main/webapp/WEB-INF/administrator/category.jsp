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
<div class="tabular--wrapper">
    <div class="table-container">
        <table id="categories1">
            <thead>
            <tr>
                <th>NOME</th>
                <th>DESCRIZIONE</th>
                <th></th>
            </tr>
            </thead>
            <br>
            <tbody>
            <tr>
                <td><%=p.getName()%></td>
                <td><%=p.getDescription()%></td>
                <td><input class="btn_delete" type="submit" name="action" value="ELIMINA" onclick="return(confirmDelete())"></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="category">
    <form action="UpdateCategory"  method="POST">
        <h3 class="add_prod_title">Aggiorna Categoria</h3>

        <label for="name"> Nome: </label>
        <input id="name" name="name" type="text" value="<%=p.getName()%>" maxlength="50">

        <label for="description">Descrizione: </label>
        <textarea class="box" name="description" id="description" style="height:200px" maxlength="200"><%=p.getDescription()%></textarea>

        <input class="btn_update" type="submit" name="action" value="AGGIORNA">
    </form>
</div>


<script>
    function confirmDelete(){
        if(confirm("Sei sicuro di voler eliminare?\nRICORDA: verranno eliminati anche i prodotti appartententi a questa categoria!")){
            window.location.href="UpdateCategory?action=ELIMINA&name=<%=p.getName()%>";
        }else{
            alert("eliminazione annullata");
        }
    }
</script>
</body>
</html>