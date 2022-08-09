<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextRoot}/js/timmy_js/updatedata.js"></script>
<script src="${contextRoot}/js/timmy_js/checkemail.js"></script>
</head>
<style>
	#emailerror {
		color: red;
	}
</style>
<body>
	<label class="form-label">Email:</label>
	<span id="emailerror"></span>
	<%-- <form method="post" action="${contextRoot}/timmy/checkEmail.controller"> --%>
		<div class="row" id="write" style="display:none">
			<div class="col-sm-5" style="padding-right:0">
				<input type="text" class="form-control" name="font" id="num">
			</div>
			<div class="input-group mb-2 col-sm-5" style="padding-right:0">
				<div class="input-group-prepend">
					<div class="input-group-text">@</div>
				</div>
				<input type="text" class="form-control" name="below" id="inlineFormInputGroup">
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="enter">
					<img src="${contextRoot}/img/userimg/enter.png" class="udateicon" width="18">
				</button>
			</div>
		</div>
		<%-- </form> --%>
			<div class="row" id="show">
				<div class="col-sm-10" style="padding-right:0">
					<input id="showEmail" class="form-control" name="email" value="${user.email }" disabled="disabled">
				</div>
				<div class="col-sm-2">
					<button id="pencil" class="btn btn-outline-secondary">
						<img src="${contextRoot}/img/userimg/pencil.png" class="udateicon" width="13">
					</button>
				</div>
			</div>
			<div>
				<label class="form-label">Nickname:</label> <input class="form-control userSetting"
					name="nickName" value="${user.nickName }">
			</div>
			<div>
				<label class="form-label">Birthday:</label> <input class="form-control userSetting"
					name="nickName" value="">
					<fmt:formatDate pattern='yyyy/MM/dd' value='${user.birthday}' />
			</div>
			<div>
				<label class="form-label">Phone:</label> <input class="form-control userSetting"
					name="phone" value="${user.phone }">
			</div>
			<div>
				<label class="form-label">Address:</label> <input class="form-control userSetting"
					name="address" value="${user.address }">
			</div>
			<div>
				<label class="form-label">Introduction:</label>
				<textarea class="form-control userSetting"
					name="selfIntroduction">${user.selfIntroduction }</textarea>
			</div>
</body>
<script>
$(document).ready(function () {


});
</script>
<script>
	$(document).ready(function () {
		var emailString = "${user.email}";
		var atpos = emailString.lastIndexOf("@");
		var num = emailString.substring(0, atpos);
		var mail = emailString.substring(atpos + 1);
		var contextRoot = "/demo";
		$("#num")[0].setAttribute("value", num);
		$("#inlineFormInputGroup")[0].setAttribute("value", mail)
		$("#pencil").click(function () {
			$("#show")[0].setAttribute("style", "display:none");
			$("#write")[0].setAttribute("style", "display:");
			$("#num").focus();
			$("#num")[0].value = "";
			$("#num")[0].value = num;
		});
		var font = $("#num");
		var fn = font[0].getAttribute("value");
		var below = $("#inlineFormInputGroup");
		var be = below[0].getAttribute("value");
		$('#write').blur(function(){
			$("#show")[0].setAttribute("style", "display:");
			$("#write")[0].setAttribute("style", "display:none");
			
		});
		$("#enter").click(function () {
			fn = font[0].value;
			be = below[0].value;
			var errors = document.getElementById("emailerror");
			errors.innerHTML = "";
			if (fn.length == 0 || be.length == 0) {
				errors.innerHTML = "column is empty";
				font[0].value = num;
				below[0].value = mail;
			}
			if (num == fn && mail == be) {
				$("#show")[0].setAttribute("style", "display:");
				$("#write")[0].setAttribute("style", "display:none");
			} else if (errors.innerHTML.length == 0 ) {
				var datao = {
					"value": fn,
					"header": be
				};
				$.ajax({
					url: contextRoot + "/timmy/updateEmailAjax",
					contentType: "application/json",
					dataType: 'text',
					method: 'post',
					data: JSON.stringify(datao),
					success: function (result) {
						console.log("ajax success:" + result);
						if (result == "email has been used") {
							errors.innerHTML = result;
						} else {
							emailString = result;
							atpos = emailString.lastIndexOf("@");
							num = emailString.substring(0, atpos);
							mail = emailString.substring(atpos + 1);
							$("#showEmail")[0].value = num + "@" + mail;
							$("#show")[0].setAttribute("style", "display:");
							$("#write")[0].setAttribute("style", "display:none");
						}
					},
					error: function (error) {
						console.log(error);
					}
				})
			}
		});
	});
</script>
</html>