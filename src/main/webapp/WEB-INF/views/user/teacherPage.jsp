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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Take A Talent</title>


<!-- mypage 자바스크립트 -->
<script>
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
	})
	
$('#myTab a[href="#mypage"]').tab('show') // Select tab by name
$('#myTab a:first').tab('show') // Select first tab
$('#myTab a:last').tab('show') // Select last tab
$('#myTab li:eq(2) a').tab('show') // Select third tab (0-indexed)

$(function () {
  $('#myTab a:last').tab('show')
})
	
</script>


</head>
<body>

   
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Take a Talent</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value='/anonymous/mainform'/>">Home</a></li>
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
				<sec:authorize access="isAnonymous()">
					<li>
						<a href="<c:url value='/anonymous/userjoin'/>">
						 <span class="glyphicon glyphicon-user"></span>
						 	Join
						</a>
					</li>
					<li>
						<a href="<c:url value='/userlogin'/>">
							<span class="glyphicon glyphicon-log-in"></span> 
								Login
						</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li>
						<a href="<c:url value='/logout'/>"> 
							<span class="glyphicon glyphicon-log-in"></span>
								Logout
						</a>
					</li>
				</sec:authorize>
			</ul>
		</div>


	</nav>
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
													<a href="#mypage" aria-controls="home" role="tab" data-toggle="tab">회원정보수정</a></li>
												<li><a href="#">내주소록 보기</a></li>
												
											</ul>
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
													<a href="#mypoint" aria-controls="home" role="tab" data-toggle="tab">충전하기</a></li>
												<li><a href="#">충전내역 보기</a></li>
												<li><a href="#">환전하기</a></li>
											</ul>
										</div>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-cloud"></span>
										My Favorit</a></li>

							<!-- Dropdown-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl3"> 
										<span class="glyphicon glyphicon-user"></span> 
										My Profile <span class="caret"></span></a> 
										
							<!-- Dropdown level 1 -->
									<div id="dropdown-lvl3" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li><a href="#">My Portfolio</a></li>
												<li><a href="#">Link</a></li>
												<li><a href="#">Link</a></li>

												<!-- Dropdown level 2 -->
												<li class="panel panel-default" id="dropdown"><a
													data-toggle="collapse" href="#dropdown-lvl2"> <span
														class="glyphicon glyphicon-off"></span>My Class <span
														class="caret"></span>
												</a>
													<div id="dropdown-lvl2" class="panel-collapse collapse">
														<div class="panel-body">
															<ul class="nav navbar-nav">
																<li><a href="#">class 1</a></li>
																<li><a href="#">class 2</a></li>
																<li><a href="#">class 3</a></li>
															</ul>
														</div>
													</div></li>
											</ul>
										</div>
									</div></li>

								<li><a href="#"><span
										class="glyphicon glyphicon-signal"></span></a></li>

							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>

				</div>
			</div>
		</div>
		<!-- 내정보수정 -->
		<div class="tab-content">
  			<div role="tabpanel" class="tab-pane fade in active" id="mypage">
				<jsp:include page="../include/memberUpdateForm.jsp" flush="true"></jsp:include>
			</div>
			
		<div role="tabpanel" class="tab-pane fade in active" id="mypoint">
			<jsp:include page="../include/myPoint.jsp" flush="true"></jsp:include>
		</div>
	
		</div>


</body>
</html>