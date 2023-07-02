<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/manageProductAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/categoryAdmin.css?v=<%=new Random().nextInt()%>"/>
    <title>Categorie</title>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <%  ArrayList<Categoria> categories = (ArrayList<Categoria>) request.getAttribute("categories");    %>
    <div class="home_ord">
        <h3> CATEGORIE </h3>
    </div>
    <div class="tabular--wrapper">
        <div class="table-container">
            <table id="categories">
                <thead>
                <tr>
                    <th>NOME</th>
                    <th>DESCRIZIONE</th>
                    <th></th>
                </tr>
                </thead>
                <br>
                <%
                for(Categoria c : categories){
                %>
                <tbody>
                <tr>
                    <td><%=c.getName()%></td>
                    <td><%=c.getDescription()%></td>
                    <td><button class="btn-card" value=" " onclick="location.href='ManageCategory?action=<%=c.getName()%>'">Modifica categoria</button></td>
                </tr>
                </tbody>
                <%
                }
                %>
            </table>
        </div>
    </div>
        <div class="category">
            <form action="UpdateCategory" method="post">
                <div class="box" id="category-info">

                    <label for="name">nome: </label>
                    <input id="name" name="name" type="text" value="" maxlength="50">

                    <label for="description">descrizione: </label>
                    <textarea name="description" id="description" style="height:200px" maxlength="200"></textarea>

                    <input type="submit" name="action" value="AGGIUNGI CATEGORIA" onclick="return(validateUpdate())">
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
