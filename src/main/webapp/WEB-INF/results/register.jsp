<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<%
  String x=" ";
  if(request.getAttribute("check")!=null){
    x="Email già presente!";
  }
%>


<%--    <script>--%>
<%--        function validateRegistration() {--%>
<%--          var email = document.getElementById('email').value;--%>
<%--          var emailRgxPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;--%>
<%--          if ((emailRgxPattern.test(email) == false)) {--%>
<%--            alert("Formato email non valido!");--%>
<%--            return false;--%>
<%--          }--%>
<%--        }--%>
<%--    </script>--%>

</body>
</html>
