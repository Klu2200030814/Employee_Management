<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css?v=1.0" rel="stylesheet"> <!-- Added version query parameter -->
    <link href="css/style.css" rel="stylesheet"> <!-- Ensure your CSS path is correct -->
    <style>
      
    </style>
</head>
<body>
<div class="container">
      <%@ include file="navigation.jsp" %>
</div>

<c:if test="${param.error == 'noId'}">
    <div class="alert alert-danger mt-4" role="alert">
        Please enter an Employee ID.
    </div>
</c:if>

<c:if test="${param.error == 'noEmployeeFound'}">
    <div class="alert alert-danger mt-4" role="alert">
        No employee found with the given ID.
    </div>
</c:if>

<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains"); // Enforce HTTPS
    response.setHeader("X-Content-Type-Options", "nosniff"); // Prevent MIME type sniffing
    response.setHeader("X-Frame-Options", "DENY"); // Prevent framing
    response.setHeader("Content-Security-Policy", "default-src 'self'; style-src 'self' https://maxcdn.bootstrapcdn.com"); // Update CSP
%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
