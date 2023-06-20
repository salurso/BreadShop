<%@ page import="model.Utente" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 20/06/2023
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navbar</title>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header class="header">
  <%--   <nav class="navbar">--%>
  <div class="logo"><a href="#">Forneria Del Cilento</a></div>
  <ul class="links">
    <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
    <li><a href="InitServlet?action=specialita">Specialità</a></li>
    <li><a href="InitServlet?action=contatti">Contatti</a></li>
    <li><a><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
  </ul>
  <%
    Utente utente = (Utente) session.getAttribute("login");
    if(utente!=null){
  %>

  <a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a>
  <%}else{%>
  <a href="InitServlet?action=login" class="action_btn">Login</a>
  <%}%>
  <div class="toggle_btn">
    <i class="fa-solid fa-bars"></i>
  </div>
  <%--   </nav>--%>
</header>
<div class="dropdown_menu">
  <li><a href="InitServlet?action=prodotti">Prodotti</a></li>
  <li><a href="InitServlet?action=specialita">Specialità</a></li>
  <li><a href="InitServlet?action=contatti">Contatti</a></li>
  <li><a><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
  <%
    if(utente!=null){
  %>
  <li><a href="InitServlet?action=login" class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> </a></li>
  <%}else{%>
  <li><a href="InitServlet?action=login" class="action_btn">Login</a></li>
  <%}%>
</div>

<script>
//script dropdown
const toggleBtn = document.querySelector('.toggle_btn')
const toggleBtnIcon = document.querySelector('.toggle_btn i')
const dropDownMenu= document.querySelector('.dropdown_menu')

toggleBtn.onclick=function (){
dropDownMenu.classList.toggle('open')
const isOpen = dropDownMenu.classList.contains('open')

toggleBtnIcon.classList = isOpen
? 'fa-solid fa-xmark'
: 'fa-solid fa-bars'
}
</script>


</body>
</html>
