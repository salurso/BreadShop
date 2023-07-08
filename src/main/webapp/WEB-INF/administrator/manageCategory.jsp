<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/admin/manageCategory.css?v=<%=new Random().nextInt()%>"/>
    <title>Categorie</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbarAdmin.jsp" %>

<%  ArrayList<Categoria> categories = (ArrayList<Categoria>) request.getAttribute("categories");%>

<div class="tabular--wrapper">
    <div class="table-container">
        <table id="categories">
            <thead>
            <tr>
                <th>NOME</th>
                <th>DESCRIZIONE</th>
            </tr>
            </thead>
            <br>
            <%
                for(Categoria c : categories){
            %>
            <tbody>
            <tr>
                <td><%=c.getName()%><button class="btn_mod_cat" value=" " onclick="location.href='ManageCategory?action=<%=c.getName()%>'">Modifica categoria</button></td>
                <td><%=c.getDescription()%></td>

            </tr>
            </tbody>
            <%
                }
            %>
        </table>
    </div>
</div>

<%--<div class="category">--%>
<%--    <form action="UpdateCategory"  method="POST">--%>

<%--        <h3 class="add_prod_title">Aggiungi Categoria</h3>--%>

<%--        <label for="name"> Nome: </label>--%>
<%--        <input id="name" name="name" type="text" value="" maxlength="50">--%>

<%--        <label for="description">Descrizione: </label>--%>
<%--        <textarea class="box" name="description" id="description" style="height:200px" maxlength="200"></textarea>--%>

<%--        <input class="btn_add" type="submit" name="action" value="AGGIUNGI CATEGORIA" onclick="return(validateUpdate())">--%>

<%--    </form>--%>
<%--</div>--%>

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