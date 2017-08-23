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
<title>Take A Talent</title>
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
				<a class="navbar-brand" href="<c:url value='/mainform'/>">Take
					a Talent</a>
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
						<sec:authorize
							access="hasAnyRole('ROLE_SYSTEM_ADMIN','ROLE_OPERATION_ADMIN')">
							<li><a href="<c:url value='/admin'/>">Admin Page</a></li>
						</sec:authorize>
						<sec:authorize
							access="hasAnyRole('ROLE_REGULAR_MEM','ROLE_ASSOCIATE_MEM')">
							<li><a href="<c:url value='/studentPage'/>">Student
									Page</a></li>
						</sec:authorize>
						<%-- <sec:authorize access="hasRole('ROLE_TEACHER')">
							<li><a href="<c:url value='/teacherPage' />">Teacher Page</a></li>
						</sec:authorize> --%>
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAnonymous()">
					<li><a href="#"> <span class="glyphicon glyphicon-user"></span>
							Join
					</a></li>
					<li><a href="<c:url value='/userlogin'/>"> <span
							class="glyphicon glyphicon-log-in"></span> Login
					</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="<c:url value='/logout'/>"> <span
							class="glyphicon glyphicon-log-in"></span> Logout
					</a></li>
				</sec:authorize>

			</ul>
		</div>

	</nav>
	<div class="jumbotron">
		<div class="container text-center">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="<c:url value="resources/img/test.jpg"/>" alt=" "
							style="width: 100%">
						<div class="carousel-caption">
							<h3>test1</h3>
							<p>Wellcome Take a Talent!</p>
						</div>
					</div>

					<div class="item">
						<img src="<c:url value="resources/img/test4.jpg"/>" alt=""
							style="width: 100%">
						<div class="carousel-caption">
							<h3>test2</h3>
							<p></p>
						</div>
					</div>

					<div class="item">
						<img src="<c:url value="resources/img/test3.jpg"/>" alt=""
							style="width: 100%">
						<div class="carousel-caption">
							<h3>test3</h3>
							<p></p>
						</div>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<div class="container-fluid bg-3 text-center">
		<h3>등록된 강의</h3>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
		</div>
	</div>
	<br>

	<div class="container-fluid bg-3 text-center">
		<div class="row">
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>Some text..</p>
				<img src="https://placehold.it/150x80?text=IMAGE"
					class="img-responsive" style="width: 100%" alt="Image">
			</div>
		</div>
	</div>
	<br>
	<br>

	<footer class="container-fluid text-center">

		<p class="footer-text1">Tel(02) 0000-0000 / 사업자등록번호: XXX-XX-XXXX /
			대표이사: 이종효</p>
		<p class="footer-text1">서울특별시 강남구 테헤란로00 길 00빌딩 0층 (주) 티에이티</p>
	</footer>

</body>
</html>
