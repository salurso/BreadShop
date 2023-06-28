<%@ page import="model.Utente" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/homeAdmin.css?v=<%=new Random().nextInt()%>"/>
    <title>Forneria Del Cilento</title>
</head>
<body>
<%@ include file="headerAdmin.jsp" %>
<%if(request.getAttribute("result")!=null){%>
<div class="alert" id="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <%=request.getAttribute("result")%>
</div>
<%}%>
<div class="container">
    <button class="item" id="add_product" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="manage_product" value=" " onclick="location.href='HomeServletAdministrator?action=manage_product'">
    </button>
    <button class="item" id="sold-out_products" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="orders" value=" " onclick="location.href='HomeServletAdministrator?action=orders'">
    </button>
    <button class="item" id="users" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
    </button>
    <button class="item" id="manage_category" value=" " onclick="location.href='HomeServletAdministrator?action=manage_category'">
    </button>
</div>
</body>
</html>
