<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Take A Talent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #151515;
	padding: 25px;
}

p.footer-text1 {
	color: #D8D8D8;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Take a Talent</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> menu <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Page 1-1</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> 강좌찾기 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Page 1-1</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> my page <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Page 1-1</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">

			<li><a href="#"> <span class="glyphicon glyphicon-user"></span>
					Join
			</a></li>
			<li><a href="/talent/userlogin"> <span
					class="glyphicon glyphicon-log-in"></span> Login
			</a></li>
			<li>
		</ul>
	</div>


	</nav>
	<div>
		<c:if test="${param.error != null }">
			<h2>Username/Password not corrrect</h2>
		</c:if>
		<c:if test="${param.logout != null}">
			<p>You have been logged out successfully.</p>
		</c:if>
		<c:url var="loginUrl" value="/login" />
		<div class="container">
			<h2>Member Login</h2>
			<form action="${loginUrl}" method="post">
				<div style="margin: 0; padding: 0;">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</div>
				<div class="form-group">
					<label for="id">ID:</label> <input type="text" class="form-control"
						id="email" placeholder="Enter id" name="member_id">
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" id="pwd" placeholder="Enter password"
						name="member_pw">
				</div>
				<div class="checkbox">
					<label><input type="checkbox" name="remember">
						Remember me</label>
				</div>
				<button type="submit" class="btn btn-default">Log in</button>
			</form>
		</div>
</body>
</html>