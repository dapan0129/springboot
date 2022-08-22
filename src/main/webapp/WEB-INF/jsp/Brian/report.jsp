<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢舉頁面</title>
<!-- DataTables  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<table id="table_id" class="display">  
	    <thead>
	      <tr>
	        <th>Email</th>
	        <th>Posts</th>
	      </tr>
	    </thead> 
	    <tbody>
		<c:forEach var="users" items="${usersreport}" varStatus="vs">	
	      <tr>
	        <td>${users.email}</td>
	        <td>
	        	<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				  Launch demo modal
				</button>
			</td>	
				
	      </tr>
	</c:forEach>
	</tbody>
	</table>
	<script>
		$(document).ready( function () {
    		$('#table_id').DataTable(); 
		} );
	</script>
</body>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></script>
	<script src="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></script>
</html>