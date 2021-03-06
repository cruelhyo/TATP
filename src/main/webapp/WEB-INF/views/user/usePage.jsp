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
<script type="text/javascript" src="<c:url value='/resources/javascript/usePageJs.js'/>"></script>
<title>이용방법</title>

<!--  
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
		
		$('#qnaShow').click(function(){
			$('.includePage').hide();
			$('#qna').show();
		});
		
		$('#myChangePWShow').click(function(){
			$('.includePage').hide();
			$('#myChangePW').show();
		});
		
	
});


	
</script>-->
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
	<!-- top nav include -->
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	<!-- side menu -->
	<hr>
	<div class="container-fluid main-container">
		<div class="col-md-2 sidebar">
			<div class="row">
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
									<a href="#" id="qnaShow">
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
	 					<img src="<c:url value='/resources/img/tatS.png'/>" style="width: 100%" >
	 				</div>
				</div>
			</div>
			<!--수업오픈 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="openClassUse">
				<div class="col-sm-6">
					<div class="step_21">
	 					<img src="<c:url value='/resources/img/tatS2.png'/>" style="width: 100%" >
	 				</div>
				</div>
			</div>
			<!--수업듣기 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="classUse">
				<div class="col-sm-6">
					<div class="step_21">
	 					<img src="<c:url value='/resources/img/tatS3.png'/>" style="width: 100%" >
	 				</div>
				</div>
			</div>
			
			<!-- 자주묻는 질문 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="qna">
				<jsp:include page="../include/qnaPage.jsp" flush="true"></jsp:include>
			</div>
		</div>
	 </div>
   
</body>
</html>