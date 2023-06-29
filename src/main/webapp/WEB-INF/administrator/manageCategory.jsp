<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Categoria" %><%--
  Created by IntelliJ IDEA.
  User: Costantino
  Date: 28/06/2023
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/manageProductAdmin.css?v=<%=new Random().nextInt()%>"/>
    <title>Categorie</title>
</head>
<body>
    <%@ include file="headerAdmin.jsp" %>
    <%  ArrayList<Categoria> categories = (ArrayList<Categoria>) request.getAttribute("categories");    %>
    <div class="div-categories">
        <table ID="categories">
            <tr>
                <th>NOME</th>
                <th>DESCRIZIONE</th>
                <th></th>
            </tr>
            <%
            for(Categoria c : categories){
            %>
            <tr>
                <td><%=c.getName()%></td>
                <td><%=c.getDescription()%></td>
                <td><button class="btn-card" value=" " onclick="location.href='ManageProduct?action=<%=c.getName()%>'">Gestisci prodotto</button></td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
