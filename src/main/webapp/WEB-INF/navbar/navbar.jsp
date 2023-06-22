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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="css/navbar.css?=<%=new Random().nextInt()%>"/>
</head>
<body>

<header class="header">

  <div class="logo"><a href="HomePage">Forneria Del Cilento</a></div>
  <ul class="links">
    <li><a href="InitServlet?action=product">Prodotti</a></li>
    <li><a href="InitServlet?action=specialita">Specialità</a></li>
    <li><a href="InitServlet?action=contatti">Contatti</a></li>
    <li><a href="InitServlet?action=carrello" ><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>

  </ul>
  <%
    Utente utente = (Utente) session.getAttribute("login");
    if(utente!=null){
  %>
  <ul class="menu">
    <li class="has-children"><a class="action_btn"> Ciao <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%><i class="fa fa-caret-down" aria-hidden="true"></i></a>
      <ul class="sub-menu">
        <li><a href="InitServlet?action=orders"> Ordini</a></li>
        <li><a href="loginServlet?action=logout"> Logout </a></li>
      </ul>
    </li>
  </ul>


  <%}else{%>
  <a href="InitServlet?action=login" class="action_btn">Login</a>
  <%}%>
  <div class="toggle_btn">
    <i class="fa-solid fa-bars"></i>
  </div>

</header>

<div class="dropdown_menu">
  <li><a href="InitServlet?action=product">Prodotti</a></li>
  <li><a href="InitServlet?action=specialita">Specialità</a></li>
  <li><a href="InitServlet?action=contatti">Contatti</a></li>
  <li><a href="InitServlet?action=orders">Ordini</a></li>
  <li><a href="./WEB-INF/results/cart.jsp"><i class="fa-solid fa-cart-shopping" style="color: #38271E;"></i></a></li>
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
