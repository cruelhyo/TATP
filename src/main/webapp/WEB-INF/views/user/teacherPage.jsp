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
<link rel="stylesheet"  href="<c:url value='/resources/css/mapage.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Take A Talent</title>

<!-- mypage 자바스크립트 -->
<script>


$(document).ready(function() {
	
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
		  e.preventDefault();
		  $(this).tab('hide');
		});
		
	$('#myTab a[href="#mypage"]').tab('show') ;// Select tab by name
	$('#myTab a:first').tab('show'); // Select first tab
	$('#myTab a:last').tab('show');// Select last tab
	$('#myTab li:eq(2) a').tab('show');// Select third tab (0-indexed)
	
	$('.includePage').hide();
	
	$(function () {
	  $('#myTab a:last').tab('show');
	});
	
	$('#myPageShow').click(function(){
		$('.includePage').hide();
		$('#myPage').show();
	});
	$('#myPointShow').click(function(){
		$('.includePage').hide();
		$('#myPoint').show();
	});
	$('#myAddressShow').click(function(){
		$('.includePage').hide();
		$('#myAddress').show();
	});
});
	
</script>

</head>
<body>
<!--top-->
	<div >
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	<hr>
	
<!-- mypage폼 -->

			
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
								
							<!-- Dropdown1-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl4">
										<span class="glyphicon glyphicon-user"></span>
										My Page<span class="caret"></span></a> 
							<!-- Dropdown level 4 -->
							<div id="dropdown-lvl4" class="panel-collapse collapse">
								<div class="panel-body">
									<ul class="nav navbar-nav">
										<li role="presentation" class="active">
											<a id="myPageShow">
												회원정보수정
											</a>
										</li>
										<li>
											<a id="myAddressShow">
												내주소록 보기
											</a>
										</li>												
									</ul>
								</div>
							</div>
							<!-- Dropdown1-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl1">
										<span class="glyphicon glyphicon-user"></span>
										My Point<span class="caret"></span></a> 
							
							<!-- Dropdown level 1 -->
							<div id="dropdown-lvl1" class="panel-collapse collapse">
								<div class="panel-body">
									<ul class="nav navbar-nav">
										<li role="presentation" class="active">
											<a id="myPointShow">
												충전하기
											</a>
										</li>
										<li><a id="">충전내역 보기</a></li>
										<li><a id="">환전하기</a></li>
									</ul>
								</div>
							</div>
								<li>
									<a id="">
										<span class="glyphicon glyphicon-cloud"></span>
										My Favorit
									</a>
								</li>

							<!-- Dropdown-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl3"> 
										<span class="glyphicon glyphicon-user"></span> 
										My Profile <span class="caret"></span>
									</a> 
										
							<!-- Dropdown level 1 -->
									<div id="dropdown-lvl3" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li><a id="">My Portfolio</a></li>
												<li><a id="">Link</a></li>
												<li><a id="">Link</a></li>

												<!-- Dropdown level 2 -->
												<li class="panel panel-default" id="dropdown">
													<a data-toggle="collapse" href="#dropdown-lvl2"> 
														<span class="glyphicon glyphicon-off"></span>
															My Class 
														<span class="caret"></span>
													</a>
													<div id="dropdown-lvl2" class="panel-collapse collapse">
														<div class="panel-body">
															<ul class="nav navbar-nav">
																<li><a id="">class 1</a></li>
																<li><a id="">class 2</a></li>
																<li><a id="">class 3</a></li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<li>
									<a id="">
										<span class="glyphicon glyphicon-signal"></span>
									</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!-- 내정보수정 -->
		<div class="tab-content">
  			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPage">
				<jsp:include page="../include/memberUpdateForm.jsp" flush="true"></jsp:include>
			</div>
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPoint">
				<jsp:include page="../include/myPoint.jsp" flush="true"></jsp:include>
			</div>
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myAddress">
				<jsp:include page="../include/myAddress.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>	
</body>
</html>