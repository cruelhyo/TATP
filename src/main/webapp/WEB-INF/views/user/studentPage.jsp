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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>User MyPage</title>

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
				<a class="navbar-brand" href="<c:url value='/mainform'/>">Take A Talent </a>
			</div>
	<ul class="nav navbar-nav">
				<li class="active"><a href="#">Dear <strong>${user}</strong>, Welcome to Student Page.</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 회원정보  <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">회원정보 조회</a></li>
						<li><a href="#">회원정보 수정</a></li>
					</ul></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">강좌 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">수강중인 강좌</a></li> <!--이동한 페이지에서 강좌별 상세보기 기능 추가   -->
						<li><a href="#">수강신청 현황</a></li>
						<li><a href="#">수강완료한 강좌</a></li>
					</ul></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">내 QnA 바로가기 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">내 QnA 바로가기</a></li>
						<li><a href="#">QnA 등록</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">logout <span class="caret"></span></a>
					<ul class="dropdown-menu">
						 <a href="<c:url value='/logout'/>">Logout</a>
					</ul></li>
			<%-- 	<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> my page <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<sec:authorize
							access="hasAnyRole('ROLE_SYSTEM_ADMIN','ROLE_OPERATION_ADMIN')">
							<li><a href="<c:url value='/admin'/>">Admin Page</a></li>
						</sec:authorize>
						<sec:authorize
							access="hasAnyRole('ROLE_REGULAR_MEM','ROLE_ASSOCIATE_MEM')">
							<li><a href="<c:url value='/studentPage'/>">Student
									Page</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_TEACHER')">
							<li><a href="<c:url value='/teacherPage' />">Teacher Page</a></li>
						</sec:authorize>
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
					</ul></li> --%>
			</ul>

	 
   
</body>
</html>