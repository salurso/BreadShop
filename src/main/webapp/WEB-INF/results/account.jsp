<%@ page import="model.Utente" %>
<%@ page import="java.util.Random" %>
<%@ page import="model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Ordine" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="./css/admin/homeAdmin.css?v=<%=new Random().nextInt()%>"/>

<%--  <%--%>
<%--    Utente utente = (Utente) session.getAttribute("login");--%>
<%--//    request.getAttribute("account");--%>
<%--  %>--%>

  <title>Account </title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbar.jsp" %>
<div class="side-menu">
  <div class="brand-name">
    <h1>Informazioni</h1>
  </div>

  <ul>
    <li><span></span></li>
  </ul>
</div>


</body>
</html>


