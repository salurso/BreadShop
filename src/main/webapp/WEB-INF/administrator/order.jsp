<%@ page import="model.Ordine" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %><%--
  Created by IntelliJ IDEA.
  User: Costantino
  Date: 05/06/2023
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/headerAdmin.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/manageorders.css?v=<%=new Random().nextInt()%>"/>

    <title>Ordini</title>
</head>
<body>

        <%@ include file="/WEB-INF/administrator/headerAdmin.jsp" %>
        <div>
                <div class="home_ord">
                    <h3> ORDINI </h3>
                </div>

                <h1 class="main-title"> Ecco il riepilogo di tutti gli ordini:  </h1>
                <div class="tabular--wrapper">
                    <div class="table-container">

                        <%
                        ArrayList<Ordine> orders = (ArrayList<Ordine>) request.getAttribute("orders");

                        for(Ordine o : orders){
                            ArrayList<Prodotto> product = o.getProducts();
                        %>

                        <h2>Ordini di: <%=o.getEmail_user()%></h2>
                        <table>
                            <thead>
                            <tr>
                                <th>Data: <%= o.getDate() %></th>
                                <th>Totale: €<%=o.getTotal()%> </th>
                                <th>Indirizzo: <%= o.getVia() %></th>
                                <th>ORDINE #<%=o.getId()%></th>
                            </tr>
                            </thead>
                            <br>
                            <%for(Prodotto p : product){ %>

                            <tbody>
                            <tr>
                                <td><img class="ord-img" src="upload/<%=p.getImage()%>"></td>
                                <td><%= p.getName() %></td>
                                <td><%= p.getDescription()%></td>
                                <td><%= p.getNameCategory()%></td>
                            </tr>
                            </tbody>
                            <%
                                }   %>
                        </table>
                    <%
                        }
                        %>
                    </div>
                </div>
            </div>
</body>
</html>
