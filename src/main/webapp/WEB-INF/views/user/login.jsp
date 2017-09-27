<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Take A Talent</title>


</head>
<body>
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	<c:if test="${param.error != null }">
		<h2>Username/Password not corrrect</h2>
	</c:if>
	<c:if test="${param.logout != null}">
		<p>You have been logged out successfully.</p>
	</c:if>
	<c:url var="loginUrl" value="/login" />
	<div class="container">
	
		<div class="st1">
		
		<h2>Member Login</h2>
		<span>회원(학생) id : id001   pw : 1q2w3e4r!</span><br>
		<span>회원(강사) id : id002   pw : 1q2w3e4r!</span>
		<hr>
		<form class="form-horizontal" action="${loginUrl}" method="post">
			<div style="margin: 0; padding: 0;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
				<div class="form-group row">
					<label class="control-label col-sm-2" for="id">ID:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="id"
						placeholder="Enter id" name="member_id">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default">Search ID&nbsp;&nbsp;</button>
					</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2 " for="pwd">Password:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter password" name="member_pw">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-default">Search PW</button>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="checkbox">
					<label class="control-label col-sm-2"> </label>
					<div class="col-sm-4">
						<label><input type="checkbox" name="remember">ID/PW 기억하기</label>
						</div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-inverse">Log in</button>
						</div>
				</div>
			</div>

		</form>
		</div>
	</div>
</body>
</html>