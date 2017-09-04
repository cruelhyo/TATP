<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/mapage.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>이용방법</title>


<!-- mypage 자바스크립트 -->
<script>
$(document).ready(function(){
	$('.includePage').hide();
	$(function () {
	  	$('.navbar-toggle-sidebar').click(function () {
	  		$('.navbar-nav').toggleClass('slide-in');
	  		$('.side-body').toggleClass('body-slide-in');
	  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
	  	});
	
	  	$('#search-trigger').click(function () {
	  		$('.navbar-nav').removeClass('slide-in');
	  		$('.side-body').removeClass('body-slide-in');
	  		$('.search-input').focus();
	  	});
	  });
	  
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('hide')
		});
		
	$('#myTab a[href="#mypage"]').tab('show'); // Select tab by name
	$('#myTab a:first').tab('show'); // Select first tab
	$('#myTab a:last').tab('show'); // Select last tab
	$('#myTab li:eq(2) a').tab('show'); // Select third tab (0-indexed)
	
	$(function () {
	  $('#myTab a:last').tab('show')
	});
	
	//숨긴 includepage 해당 버튼 클릭시 보여주기
		$('#usePageserviceShow').click(function(){
			$('.includePage').hide();
			$('#usePageservice').show();
		});
		
		$('#openClassUseShow').click(function(){
			$('.includePage').hide();
			$('#openClassUse').show();
		});
	
		$('#classUseShow').click(function(){
			$('.includePage').hide();
			$('#classUse').show();
		});
		
		$('#myPointShow').click(function(){
			$('.includePage').hide();
			$('#myPoint').show();
		});
		
		$('#myChangePWShow').click(function(){
			$('.includePage').hide();
			$('#myChangePW').show();
		});
		
	
});


	
</script>

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
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>

<!-- mypage폼 -->
<hr>
	
			<!-- Brand and toggle get grouped for better mobile display -->
			
			<!-- /.navbar-collapse -->
		<!-- /.container-fluid -->
	<div class="container-fluid main-container">
		<div class="col-md-2 sidebar">
			<div class="row">
				<!-- uncomment code for absolute positioning tweek see top comment in css -->
				<div class="absolute-wrapper"></div>
				<!-- Menu -->
				<div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
						<!-- Main Menu -->
						<div class="side-menu-container">
							<ul class="nav navbar-nav">
								
								<li>
									<a href="#" id="usePageserviceShow">
										<span class="glyphicon glyphicon-user"></span>
										서비스소개
									</a>
								</li>
								<li>
									<a href="#" id="openClassUseShow">
										<span class="glyphicon glyphicon-cloud"></span>
										수업개설 이용방법
									</a>
								</li>
								<li>
									<a href="#" id="classUseShow">
										<span class="glyphicon glyphicon-signal"></span>
										수업듣기 이용방법
									</a>
								</li>
								<li>
									<a href="#" id="">
										<span class="glyphicon glyphicon-off"></span>
										이용요금
									</a>
								</li>
								<li>
									<a href="#" id="">
										<span class="glyphicon glyphicon-user"></span>
										자주묻는 질문
									</a>
								</li>

							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>

				</div>
			</div>
		</div>
		
		
	 
		<!-- 이용방법 -->
		<div class="tab-content">
			<!--서비스소개  -->
  			<div role="tabpanel" class="tab-pane fade in active includePage" id="usePageservice">
				<div class="col-sm-6">
					<div class="step_21">
	 					<img src="<c:url value='/resources/img/tatS.png'/>" alt=" "
						style="width: 100%" >
	 				</div>
				</div>
			</div>
			<!--수업오픈 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="openClassUse">
				<div class="col-sm-6">
					<div class="step_21">
	 					<img src="<c:url value='/resources/img/tatS2.png'/>" alt=" "
						style="width: 100%" >
	 				</div>
				</div>
			</div>
			<!--비밀번호 변경 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="classUse">
				<div class="col-sm-6">
					<div class="step_21">
	 					<img src="<c:url value='/resources/img/tatS3.png'/>" alt=" "
						style="width: 100%" >
	 				</div>
				</div>
			</div>
			
			<!-- 내 결제내역 보기 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPointHistory">
				<jsp:include page="../include/myPointHistory.jsp" flush="true"></jsp:include>
			</div>
			
		</div>
	</div>
	 
   
</body>
</html>