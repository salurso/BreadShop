<%@ page import="model.Prodotto" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%

        Prodotto p = (Prodotto) request.getAttribute("prodotto");
        String base64Image = getBase64Image(p.getImage());
    %>
    <title><%=p.getName()%></title>
</head>
<body>
    <div class="product">
<%--        <img class="card-img" src="images/paneBianco.png" alt="Card image" width="600" height="400">--%>
<%--    <img class="card-img" src="<%=p.getImage()%>" alt="Card image" width="600" height="400">--%>
    <img class="card-img" src="data:image/png;base64, <%= base64Image %>" alt="Card image" width="600" height="400">
    <div class="info-product">
            <h4><%=p.getName()%></h4>
            <label>id: </label><input id="id" type="text" value="<%=p.getId()%>">
            <label>nome: </label><input id="name" type="text" value="<%=p.getName()%>">
            <label>prezzo: </label><input id="price" type="text" value="<%=p.getPrice()%>">
            <label>descrizione: </label><input id="description" type="text" value="<%=p.getDescription()%>">
        </div>
    </div>
</body>
</html>
<%!
    private String getBase64Image(InputStream image) {
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = image.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            return Base64.getEncoder().encodeToString(imageBytes);
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
%>