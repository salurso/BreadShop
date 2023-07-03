<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="java.time.temporal.UnsupportedTemporalTypeException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/navbar.css?v=<%=new Random().nextInt()%>"/>
    <link rel="stylesheet" type="text/css" href="./css/product.css?v=<%=new Random().nextInt()%>"/>
<%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

    <script type="text/javascript">

        $(document).ready(function(){
            $('.list').click(function(){
                const value = $(this).attr('data-filter');
                if(value == 'All'){
                    $('.product-container').show('1000');
                }
                else{
                    $('.product-container').not('.'+value).hide('1000');
                    $('.product-container').filter('.'+value).show('1000');
                }
            })
            $('.list').click(function (){
                $(this).addClass('active').siblings().removeClass('active');
            })
        })

    </script>

    <%
        ArrayList<Prodotto> products = (ArrayList<Prodotto>) request.getAttribute("product");
        ArrayList<String> categories = (ArrayList<String>) request.getAttribute("categories");
    %>
    <title>Prodotti</title>


</head>
<body>
    <%@ include file="/WEB-INF/navbar/navbar.jsp" %>
    <section class="home_ord" id="home_prod">
        <div class="container_ord" data-aos="fade-up" data-aos-duration="3000"
             data-aos-anchor-placement="top-bottom">
            <h3> Prodotti del Cilento </h3>
        </div>
    </section>

    <section>
        <ul>
            <li class="list active" data-filter="All">All</li>
            <li class="list" data-filter="fresco">fresco</li>
            <li class="list" data-filter="secco">secco</li>
        </ul>
    </section>

    <div class="container">
    <%
    for(String category : categories){
    %>
        <h3 class="title" align="center"><%=category%></h3>
        <div class="product-container <%=category%>">

        <%
        for(Prodotto p : products)
            if(p.getNameCategory().equals(category)){
        %>

            <div class="card">
            <%if(session.getAttribute("login")==null){%>
                <form action="AddCartSession" method="post">
                        <%}else{%>
                <form action="AddCartServlet" method="post">
                        <%}%>
                <div class="imgbox">
                    <img src="upload/<%=p.getImage()%>" alt="Card 1">
                </div>
                <div class="content">
                    <h2><%=p.getName()%></h2>
                    <div class="price"><%=p.getPrice()%>€</div>
                    <input type="hidden" name="id" value="<%=p.getId()%>"/>
                    <input type="hidden" name="quantity" min=1  value="1"/>
                    <%if(session.getAttribute("login")!=null){%>
                    <input type="hidden" name="email" value="<%=utente.getEmail()%>"/>
                    <%}%>
                    <p>
                        <div class="buttons">
                            <input class="add-to-cart" type="submit" value="Add to cart"/>
                            <a href="ProductServlet?id=<%=p.getId()%>" class="view-more" >View More</a>
                        </div>
                    </p>
                </div>
                </form>
            </div>
        <%
            }
        %>
        </div>
        <br>
    <%
    }
    %>
    </div>


</body>
</html>