<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
    String x = (String) request.getAttribute("check");
    if(x.equals("emailAlreadyPresent")){
%>
<div class="error-message">Email già esistente: <a href="${pageContext.request.contextPath}/index.jsp">Login</a></div>
<%
    }else if(x.equals("invalidEmail")){
%>
<div class="error-message">Inserisci un indirizzo valido: <a href="${pageContext.request.contextPath}/registrationform.html">Sign-in</a></div>
<%
    }
%>
</body>
</html>
