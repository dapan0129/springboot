<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Photo</title>
</head>
<body>
<div class="container">
<h1>列出所有圖片</h1>

<table id="mytable">

<%-- <c:forEach var="onePhoto"  items="${goodPhotoList}"> --%>
	<tr>
	   <td>test01.jpg</td>
	   <td><img src="${contextRoot}/img/Test01.jpg"></td>
	</tr>   
<%-- </c:forEach> --%>
</table>

</div>
</body>
</html>