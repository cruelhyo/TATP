<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

.step_21a {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 10px;
	margin-left: 50px;
	
}

</style>
</head>
<body>
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	
	<div class="jumbotron" style="padding: 0px;" >
		<div class="container-full text-center ">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active" >
						<img src="<c:url value='/resources/img/tatP2.png'/>" alt=""
							style="width: 100%">
						<div class="carousel-caption">
							
						</div>
					</div>

					<div class="item">
						<img src="<c:url value='/resources/img/tatp3.png'/>" alt=""
							style="width: 100%">
						<div class="carousel-caption">
							
							<p></p>
						</div>
					</div>

					<div class="item">
						<img src="<c:url value='/resources/img/tatP0.png'/>" alt=""
							style="width: 100%">
						<div class="carousel-caption">
							
							
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
			<div class="col-sm-2 step_21a">
				<p>Oil Oneday Class/cost- 50Point</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 5명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>클래식 기타 4주완성/cost- 50Point/1day</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수강인원 3명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>인문학 읽기/cost- 20Point</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 6명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>Flower Oneday Class/cost- 50Point</p>
				<p>수업일/2017년 10월 23일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 7명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>프라모델 커스텀/cost- 30Point</p>
				<p>수업일/ 2017년 10월 25일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 5명</p> 
			</div>
		</div>
	</div>
	<br>

	<div class="container-fluid bg-3 text-center">
		<div class="row">
			<div class="col-sm-2 step_21a">
				<p>Oil Oneday Class/cost- 50Point</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 5명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>클래식 기타 4주완성/cost- 50Point/1day</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수강인원 3명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>인문학 읽기/cost- 20Point</p>
				<p>수업일/2017년 10월 21일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 6명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>Flower Oneday Class/cost- 50Point</p>
				<p>수업일/2017년 10월 23일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 7명</p> 
			</div>
			<div class="col-sm-2 step_21a">
				<p>프라모델 커스텀/cost- 30Point</p>
				<p>수업일/ 2017년 10월 25일</p>
				<p>수업시간/Pm 3:00-5:00</p>
				<p>수강인원 5명</p> 
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
