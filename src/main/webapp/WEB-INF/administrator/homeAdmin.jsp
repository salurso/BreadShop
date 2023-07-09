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
    <link rel="stylesheet" type="text/css" href="./css/admin/homeProva.css?v=<%=new Random().nextInt()%>"/>
    <title>Forneria Del Cilento</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar/navbarAdmin.jsp" %>

<div>
        <%if(request.getAttribute("result")!=null){%>
    <div class="alert" id="alert">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <%=request.getAttribute("result")%>
    </div>
        <%}%>
            <div class="container">
                <button class="item" id="add_product" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'">
                    <span class="item-text"></span>
                </button>
                <button class="item" id="manage_product" value=" " onclick="location.href='HomeServletAdministrator?action=manage_product'">
                    <span class="item-text"></span>
                </button>
                <button class="item" id="add_category" value=" " onclick="location.href='HomeServletAdministrator?action=add_category'">
                    <span class="item-text"></span>
                </button>
                <button class="item" id="manage_category" value=" " onclick="location.href='HomeServletAdministrator?action=manage_category'">
                    <span class="item-text"></span>
                </button>
                <button class="item" id="orders" value=" " onclick="location.href='HomeServletAdministrator?action=orders'">
                    <span class="item-text"></span>
                </button>
                <button class="item" id="users" value=" " onclick="location.href='HomeServletAdministrator?action=users'">
                    <span class="item-text"></span>
                </button>
            </div>


<%--<%--%>
<%--    Utente utente = (Utente) session.getAttribute("loginAdmin");--%>
<%--%>--%>
<%--<div class="side-menu">--%>
<%--    <div class="brand-name">--%>
<%--        <h1>Lista Admin</h1>--%>
<%--    </div>--%>
<%--    <%--%>
<%--        ArrayList<Utente> admin = (ArrayList<Utente>) request.getAttribute("admin");--%>
<%--        for(Utente a : admin){--%>
<%--    %>--%>
<%--    <ul>--%>
<%--        <li><span><%= a.getName().toUpperCase() %> <%=a.getSurname().toUpperCase() %></span></li>--%>
<%--    </ul>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</div>--%>


<%--<div class="container">--%>
<%--    <div class="header">--%>
<%--        <div class="nav">--%>
<%--            <div class="admin-title">--%>
<%--                <h3> Forneria del cilento Administrator</h3>--%>
<%--            </div>--%>
<%--            <div class="user">--%>

<%--                <div class="menu">--%>
<%--                    <li class="has-children"><a class="action_btn"> Bentornato <%=utente.getName().toUpperCase(java.util.Locale.ROOT)%> <i class="fa fa-caret-down" aria-hidden="true"></i></a>--%>
<%--                        <ul class="sub-menu">--%>
<%--                            <li><a href="loginServlet?action=logout"> Logout </a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="content">--%>
<%--        <%if(request.getAttribute("result")!=null){%>--%>
<%--        <div class="alert" id="alert">--%>
<%--            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>--%>
<%--            <%=request.getAttribute("result")%>--%>
<%--        </div>--%>
<%--        <%}%>--%>
<%--        <div class="cards">--%>

<%--            <div class="card">--%>
<%--                <div class="box">--%>
<%--                    <button class="card" id="add_product" value=" " onclick="location.href='HomeServletAdministrator?action=add_product'"> <h3 align="center">AGGIUNGI PRODOTTI</h3></button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div class="box">--%>
<%--                    <button class="card" id="manage_product" value=" " onclick="location.href='HomeServletAdministrator?action=manage_product'"> <h3 align="center">GESTISCI PRODOTTI</h3></button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div class="box">--%>
<%--                    <button class="card" id="manage_category" value=" " onclick="location.href='HomeServletAdministrator?action=manage_category'"><h3 align="center">GESTISCI CATEGORIE</h3>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div class="box">--%>
<%--                    <button class="card" id="orders" value=" " onclick="location.href='HomeServletAdministrator?action=orders'"><h3 align="center">GESTISCI ORDINI</h3>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <div class="box">--%>
<%--                    <button class="card" id="users" value=" " onclick="location.href='HomeServletAdministrator?action=users'"><h3 align="center">GESTISCI UTENTI</h3>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="content-2">--%>
<%--            <div class="recent-orders">--%>

<%--                <div class="title">--%>
<%--                    <h2> Ordini Recenti </h2>--%>
<%--                    <a href="HomeServletAdministrator?action=orders" class="action_btn"> View All</a>--%>
<%--                </div>--%>

<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <th>Data</th>--%>
<%--                        <th>Email</th>--%>
<%--                        <th>Indirizzo</th>--%>
<%--                        <th>Totale</th>--%>
<%--                        <th>ID</th>--%>
<%--                    </tr>--%>
<%--                    <%--%>
<%--                        ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");--%>
<%--                        for(Ordine o : orders){--%>
<%--                            ArrayList<Prodotto> product = o.getProducts();--%>
<%--                    %>--%>

<%--                    <tr>--%>
<%--                        <td><%= o.getDate() %></td>--%>
<%--                        <td><%= o.getEmail_user() %></td>--%>
<%--                        <td>Via <%= o.getVia() %></td>--%>
<%--                        <td>€<%=o.getTotal()%> </td>--%>
<%--                        <td>#<%=o.getId()%></td>--%>

<%--                    </tr>--%>
<%--                    <%--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </table>--%>

<%--            </div>--%>

<%--            <div class="new-users">--%>
<%--                <div class="title">--%>
<%--                    <h2>Nuovi Utenti</h2>--%>
<%--                    <a href="HomeServletAdministrator?action=users" class="action_btn"> View All</a>--%>
<%--                </div>--%>
<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <th>Nome</th>--%>
<%--                        <th>Cognome</th>--%>
<%--                        <th>Email</th>--%>
<%--                    </tr>--%>
<%--                    <%--%>
<%--                        ArrayList<Utente> users = (ArrayList<Utente>) request.getAttribute("users");--%>
<%--                        for(Utente u : users){--%>
<%--                    %>--%>

<%--                    <tr>--%>
<%--                        <td><%=u.getName()%></td>--%>
<%--                        <td><%=u.getSurname()%></td>--%>
<%--                        <td><%=u.getEmail()%></td>--%>
<%--                    </tr>--%>
<%--                    <%--%>
<%--                        }--%>
<%--                    %>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

</body>
</html>


