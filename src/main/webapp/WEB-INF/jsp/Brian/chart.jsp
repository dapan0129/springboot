<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../timmy/layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>圖</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

<link rel="stylesheet" href="${contextRoot}/css/report_index.css">
<link rel="stylesheet" href="${contextRoot}/css/report_navs.css">
<link rel="stylesheet" href="${contextRoot}/css/member_chart.css">

</head>
<body>
	<div class="wrap">
		<div class="left">
			<div class="container">
				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<!-- 						<nav class="nav flex-column nav-pills nav-gap-y-1"> -->
								<div>1</div>
								<div>2</div>
								<div>3</div>
								<div>4</div>
								<!-- 						</nav> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="right">
			<div class="col-lg-12">
				<div class="panel"
					style="border-radius: 10px; padding-top: 1%; padding-bottom: 0.5%">
					<div class="panel-heading">
					<canvas id="petTypeChart" width="400" height="400"></canvas>
					<canvas id="genderTypeChart" width="400" height="400"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--******************************************************************************************************* 1 -->
	

	<script>
// 	男女
		var Femalesum = "${genderFemale}";
		var Malesum = "${genderMale}";
		

		var ctx = document.getElementById("petTypeChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				 labels: ["Female", "Male"],
				datasets : [ {
					data : [ Femalesum, Malesum ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
		});
//--------------------------------------------------------------------------------------------------------------------
		// 	貓狗
		var catsum = "${petTypeCat}";
		var dogsum = "${petTypeDog}";
		console.log('catsum:' + catsum);

		var ctx = document.getElementById("genderTypeChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				 labels: ["cat", "dog"],
				datasets : [ {
					data : [ catsum, dogsum ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
		});
	</script>
</body>
</html>