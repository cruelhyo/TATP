<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
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
	color : #D8D8D8;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value='/mainform' />">Take a Talent</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> menu <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 강좌찾기 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> my page <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<c:if test="${param.error != null }">
		<h2>Username/Password not corrrect</h2>
	</c:if>
	<c:if test="${param.logout != null}">
		<p>You have been logged out successfully.</p>
	</c:if>
	<c:url var="loginUrl" value="/login" />
	<form action="${loginUrl}" method="post">
		<p style="margin: 0; padding: 0;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</p>
		<table>
			<tr>
				<td style="width: 200px;">
					<!-- <spring:message code="user.email" /> -->
				</td>
				<td style="width: 390px">
					<input type="text" name="member_id"	style="width: 99%;" />
				</td>
			</tr>
			<tr>
				<td>
					<!-- <spring:message code="user.password" /> -->
				</td>
				<td>
					<input type="password" name="member_pw" style="width: 99%;" />
				</td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	</form>

</body>
</html>