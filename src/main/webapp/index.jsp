<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="style.css">
  <title>Benvenuti</title>
</head>
<body>
<br>
<br>
<%--<c:if test="${param.error == 1}">--%>
<%--  <p style="color:red"> Il nome utente non è presente all'interno del database, Prova di nuovo o registrati.</p>--%>
<%--</c:if>--%>
<form action="login">
<input type="submit"> Login </input>
</form>
</body>
</html>

