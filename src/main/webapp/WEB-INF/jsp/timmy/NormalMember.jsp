<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:svg="http://www.w3.org/2000/svg">

<head>
<meta charset="UTF-8">
<title>PET.COM</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/timmy_js/uploadimg.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<%-- <link rel="stylesheet" href="${contextRoot}/css/user_setting.css"> --%>

</head>
<style>
#preview_progressbarTW_img {
	width: 200px;
	height: 150px;
	display: block;
	margin: 20px auto 20px auto;
	border-radius: 40%;
}

table {
	text-align: center;
	font-size: 100%;
}

td {
	width: 50%;
}

#ulnav {
	padding: 0;
	list-style: none;
	margin-bottom: 50px;
	display: flex;
	justify-content: center;
}

#ulnav li {
	margin: auto;
}

#navSetting {
	margin: auto 20%;
}

.iconImg {
	width: 15%;
}

ul li button {
	border: 0;
}

.container {
	margin-bottom: 5%;
}
.right{
	width: 80%;
	margin: 0 auto 3% auto;
	
}
.container{
	padding-bottom: 10%;
}
.prePetPhotoImg{
	width: 100px;
}
#hello{
	margin: 0 5px 0 20% ;
}
</style>

<body>
	
	<jsp:include page="layout/navbar.jsp" />
	<!-- 	-------------------------------------------- -->
	<c:if test="${!empty guest}">
		<c:set var="userOrigin" value="${user}" />
		<c:set var="user" value="${guest}" />
	</c:if>
	<div class="wrap">
		<div class="left">
			<div class="container">
				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<span id="id" style="display: none;">${user.userId}</span>
								<img src="${contextRoot}/${user.photoPath}"
									id="preview_progressbarTW_img"> <input type="file"
									name="testfile" id="testfile" style="display: none;">
								<h3 id="hello" style="fload:center;display:inline" >${user.nickName}</h3>
<!-- 								check this page is UserSetting page or not -->
								<c:if test="${!empty guest}">  
<!-- 									check this page is user-self page or not -->
									<c:set var="isFollowing" value="0" />
									<c:if test="${guest != userOrigin}">
										<c:forEach items="${userOrigin.follows}" var="checkUser">
											<c:if test="${checkUser.fans.getUserId() == guest.getUserId() }">
												<c:set var="isFollowing" value="1" />
											</c:if>
										</c:forEach>
										<c:if test="${isFollowing == 0 }">
											<a href="${contextRoot}/timmy/addFollows?guestId=${guest.userId}">
												<button class="btn btn-outline-secondary icon smallIcon" >
													<img src="${contextRoot}/img/userimg/add-user.png" class="udateicon" width="30">
												</button>
											</a>
										</c:if>
										<c:if test="${isFollowing == 1 }">
											<a href="${contextRoot}/timmy/removeFollows?guestId=${guest.userId}">
												<button class="btn btn-outline-secondary icon smallIcon" >
													<img src="${contextRoot}/img/userimg/add-friend.png" class="udateicon" width="30">
												</button>
											</a>
										</c:if>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<br>


				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<div id="settingManagerDiv" style="display:">
									<table class="table table-borderless">
										<tbody>
											<tr>
												<td><h5>Following</h5></td>
												<td><h5>Followed</h5></td>
											</tr>
										</tbody>
										<tfoot >
											<tr>
												<td>
													<h3>
														<a href="/timmy/followersManager.controller?id=${user.userId}" style="color:black">${fn:length(user.follows)}</a>
													</h3>
												</td>
												<td>
													<h3 >
														<a href="/timmy/fansManager.controller?id=${user.userId}" style="color:black">${fn:length(user.fans)}</a>
													</h3>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<br>

				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<div class="card-header"><h5>About</h5></div>
									<table class="table">
											<tr><td>Email:</td><td id="preShowEmail">${user.email}</td></tr>
											<tr><td>Birthday:</td><td id="preShowBirthday"><fmt:formatDate pattern='YYYY-MM-dd' value='${user.birthday}' /></td></tr>
											<tr><td>Phone:</td><td id="preShowPhone">${user.phone}</td></tr>
									</table>
							</div>
						</div>
						<br/>
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<div class="card-header"><h5>Introduction</h5></div>
									<table class="table">
											<tr><td style="text-align:left" id="preShowIntroduction">${user.selfIntroduction}</td></tr>
									</table>
							</div>
						</div>
					</div>
				</div>

				<br>

				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card" style="border-radius: 10px">
							<div class="card-body">
								<div class="card-header"><h5>My Pets</h5></div>
									<c:forEach items="${user.pets }" var="p" varStatus="vs">
					<!-- 					<div class="col"> -->
					<!-- 						<div class="card"> -->
	                                <table class="table">
		                                <tbody>
		                                	<tr>
		                                		<td class="col-md-5">
													<c:if test='${fn:contains(p.petPhotoPath, ".")}'>
														<img src="${contextRoot}${p.petPhotoPath}" class="prePetPhotoImg" id="petImgPreview{vs.index}">
													</c:if>
													<c:if test='${!fn:contains(p.petPhotoPath, ".")}'>
														<img src="${contextRoot}/img/petimg/pawprint.png" class="prePetPhotoImg" id="petImgPreview{vs.index}">
													</c:if>
												</td >
												<td class="col-md-5">
													<h6>${p.petName}</h6>
												</td>
		                                	</tr>
	                                	</tbody>
	                                </table>
                                </c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	-------------------------------------------- -->
		<div class="right">
			<div class="col-lg-12">
				<div class="panel" style="border-radius: 10px; padding-top: 1%; padding-bottom: 0.5%">
					<div class="panel-heading">
						<span id="tab-1" class="panel-title">Posts</span>
						<c:if test="${empty guest || guest == userOrigin}">
							<span id="tab-2" class="panel-title">About</span>
						</c:if>
						<span id="tab-3" class="panel-title">Pets</span>
						<span id="tab-4" class="panel-title">Following</span>
<!-- 						<h3 class="panel-title">Posts</h3> -->
						<div id="tab">
							<ul>
								<li><a href="#tab-1">Posts</a></li>
								<c:if test="${empty guest || guest == userOrigin}">
									<li><a href="#tab-2">About</a></li>
								</c:if>
								<li><a href="#tab-3">Pets</a></li>
								<li><a href="#tab-4">Following</a></li>
							</ul>
							<div class="tab-content-1 tab-content-border">
								<div class="panel-content panel-activity" style="padding-top:0">
									<div id="postManagerDiv" style="">
										<jsp:include page="PostSetting.jsp" />
									</div>
								</div>
							</div>
							<c:if test="${empty guest || guest == userOrigin}">
								<div class="tab-content-2 tab-content-border">
									<div class="panel-content panel-activity" style="padding-top:20px">
									<div id="settingManagerDiv" style="display:">
										<jsp:include page="UserSetting.jsp" />
									</div>
									</div>
								</div>
							</c:if>
							<div class="tab-content-3 tab-content-border">
								<div class="panel-content panel-activity" style="padding-top:0">
									<div id="petManagerDiv" style="display:">
										<jsp:include page="PetSetting.jsp" />
									</div>
								</div>
							</div>
							<div class="tab-content-4 tab-content-border">
								<div class="panel-content panel-activity" style="padding-top:3%">
									<table id="followTable" class="table table-borderless">
										<thead>
											<tr>
												<th>Photo</th>
												<th>NickName</th>
												<th>Email</th>
												<th>Follow</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${user.follows}" var="fan">
												<tr>
													<td class="col-md-3"><img src="${contextRoot}${fan.fans.photoPath}" width="100px"></td>
													<td class="col-md-2">${fan.fans.nickName }</td>
													<td class="col-md-5">${fan.fans.email }</td>
													<td class="col-md-2">
														<button class="btn btn-outline-secondary icon smallIcon" id="follow${fan.fans.userId}">
															<img src="${contextRoot}/img/userimg/add-friend.png" class="udateicon" width="30">
														</button>
													</td>
												</tr>
												<script>
														$(document).ready( function () {
															var contextRoot = "/demo";
														    $('#followTable').DataTable(); 
														    $("#follow${fan.fans.userId}").click(function(e){
														    	let checkBox = confirm("Sure to remove the following?");
														    	if (checkBox == true){
														    		$.ajax({
														    			url: contextRoot + "/timmy/deleteFollowingById" ,
																		method: "POST",
																		data: "${fan.fans.userId}",
																		success: function(result){
																			console.log(result);
																		},
																		error: function(result){
																			console.log(result);
																		},
														    		})
														    	}
														    });
														} );	
												</script>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		var contextRoot = "/demo";
		var pmd = $("#postManagerDiv")[0];
		var smd = $("#settingManagerDiv")[0];
		var emd = $("#petManagerDiv")[0];
		$("#postManager").click(function() {
			if (pmd.getAttribute("style") == "display: none") {
				pmd.setAttribute("style", "");
				smd.setAttribute("style", "display: none");
				emd.setAttribute("style", "display: none");
			}
		});
		$("#settingManager").click(function() {
			if (smd.getAttribute("style") == "display: none") {
				smd.setAttribute("style", "");
				pmd.setAttribute("style", "display: none");
				emd.setAttribute("style", "display: none");
			}
		});
		$("#petManager").click(function() {
			if (emd.getAttribute("style") == "display: none") {
				emd.setAttribute("style", "");
				smd.setAttribute("style", "display: none");
				pmd.setAttribute("style", "display: none");
			}
		});

	})
</script>
<style>
#tab {
    width: 100%;
	background: #F0F0F0;
    border: none;
    border-radius: 20px;
    padding-left: 0.5%;
    padding-right: 0.5%;
    padding-bottom: 0.5%;
}

/* 頁籤ul */
#tab > ul {
    /* overflow: hidden; */
    margin: 0;
    padding: 10px 20px 0 20px;
}

#tab > ul > li {
    list-style-type: none;
}

/* 頁籤上的文字 */
#tab > ul > li > a { 
    text-decoration: none;
    font-size: 15px;
    color: #333;
    float: left;
    padding: 10px;
    margin-left: 5px;
}

/*頁籤div內容*/
#tab > div {
    clear: both;
    padding: 0 15px;
    height: 0;
    overflow: hidden;
    visibility: hidden;
}
.tab-content-border{
	border-radius: 20px;
}
/*第一筆的底色*/
span:target ~ #tab > ul li:first-child a {
  	background: #F0F0F0;
}

span:target ~ #tab > div:first-of-type {
    visibility: hidden;
    height: 0;
    padding: 0 15px;
}

/*頁籤變換&第一筆*/
span ~ #tab > ul li:first-child a,
#tab-1:target ~ #tab > ul li a[href$="#tab-1"],
#tab-2:target ~ #tab > ul li a[href$="#tab-2"],
#tab-3:target ~ #tab > ul li a[href$="#tab-3"],
#tab-5:target ~ #tab > ul li a[href$="#tab-5"],
#tab-4:target ~ #tab > ul li a[href$="#tab-4"] {
    background: #fff;
    border-radius: 5px 5px 0 0;
}

span ~ #tab > ul li:first-child a::before,
#tab-1:target ~ #tab > ul li a[href$="#tab-1"]::before,
#tab-2:target ~ #tab > ul li a[href$="#tab-2"]::before,
#tab-3:target ~ #tab > ul li a[href$="#tab-3"]::before,
#tab-5:target ~ #tab > ul li a[href$="#tab-5"]::before,
#tab-4:target ~ #tab > ul li a[href$="#tab-4"]::before {
    background-color: white;
    height: 100%;
}

/*頁籤內容顯示&第一筆*/
span ~ #tab > div:first-of-type,
#tab-1:target ~ #tab > div.tab-content-1,
#tab-2:target ~ #tab > div.tab-content-2,
#tab-3:target ~ #tab > div.tab-content-3,
#tab-5:target ~ #tab > div.tab-content-5,
#tab-4:target ~ #tab > div.tab-content-4 {
    visibility: visible;
    height:auto;
    background: #fff;
}

span {
    display: none;
}
#followTable{
	border-color: #dee2e6;
}
#followTable thead th{
	border-bottom: 1px solid #dee2e6;
}
</style>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</html>