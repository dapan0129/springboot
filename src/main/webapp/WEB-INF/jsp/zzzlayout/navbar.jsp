<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${contextRoot}/zzztest">募捐</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/about">目捐首頁</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/message/add">關於</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/message/viewMessages">基金會</a>
      </li>
      
      
     
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/upfoundation">訂單查詢</a>
      </li>
      
      
     
    </ul>
  </div>
</nav>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>