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

<title>Take A Talent</title>

<!-- mypage 자바스크립트 -->
<script type="text/javascript" src="<c:url value='/resources/javascript/teacherPageJs.js'/>"></script>


</head>
<body>
	<input type="hidden" id="ajaxSelectForUpdateMember" value="<c:url value='/ajax/teacherPage/selectForUpdateMember'/>">
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
								
								<!-- Dropdown1-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl4">
										<span class="glyphicon glyphicon-user"></span>
										My Page
										<span class="caret"></span>
									</a> 
									<!-- Dropdown level 4 -->
									<div id="dropdown-lvl4" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li role="presentation" class="active">
													<a href="" aria-controls="home" role="tab" data-toggle="tab" id="myPageShow">회원정보수정</a>
												</li>
												<li><a href="#" id="myChangePWShow">내 비밀번호 변경하기</a></li>
												<li><a href="#" id ="myAddressShow">내주소록 보기</a></li>
												
											</ul>
										</div>
									</div>
								</li>
								<!-- Dropdown1-->
								<li class="panel panel-default" id="dropdown">
									<a data-toggle="collapse" href="#dropdown-lvl1">
										<span class="glyphicon glyphicon-user"></span>
										My Point
										<span class="caret"></span>
									</a> 
								
									<!-- Dropdown level 1 -->
									<div id="dropdown-lvl1" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li role="presentation" class="active">
													<a href="#mypoint" aria-controls="home" role="tab" data-toggle="tab" id="myPointShow">충전하기</a></li>
												<li><a href="#myPointHistory" id="myPointHistoryShow">충전내역 보기</a></li>
												<li><a href="#myExchange" id="myExchangeShow">환전하기</a></li>
												<li><a href="#myAccount" id="myAccountShow">계좌관리</a></li>
											</ul>
										</div>
									</div>
								</li>
								<li>
									<a href="#">
										<span class="glyphicon glyphicon-cloud"></span>
										My Favorit
									</a>
								</li>
								
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
												<li><a href="#">이력사항 관리</a></li>
												<li><a href="#">Link</a></li>	
											</ul>
										</div>
									</div>
								</li>
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
														<li><a href="#">class 1</a></li>
														<li><a href="#">class 2</a></li>
														<li><a href="#">class 3</a></li>
													</ul>
												</div>
											</div>
								</li>

								<li><a href="#modifiedMypage" id="modifiedMypageShow"><span
										class="glyphicon glyphicon-signal"></span>내 정보 전체보기</a></li>

							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>

				</div>
			</div>
		</div>
		
		
		
		<!-- 내정보수정 -->
		<div class="tab-content">
			<!--기본정보 수정  -->
  			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPage">
				<jsp:include page="../include/memberUpdateForm.jsp" flush="true"></jsp:include>
			</div>
			<!--내포인트 충전 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPoint">
				<jsp:include page="../include/myPoint.jsp" flush="true"></jsp:include>
			</div>
			<!--비밀번호 변경 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myChangePW">
				<jsp:include page="../include/memberChangePassword.jsp" flush="true"></jsp:include>
			</div>
			<!-- 주소추가 삭제 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myAddress">
				<jsp:include page="../include/address.jsp" flush="true"></jsp:include>
			</div>
			<!-- 내 결제내역 보기 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPointHistory">
				<jsp:include page="../include/myPointHistory.jsp" flush="true"></jsp:include>
			</div>
			<!-- 내 환전포인트 보기 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myExchange">
				<jsp:include page="../include/pointExchange.jsp" flush="true"></jsp:include>
			</div>
			<!-- 계좌관리 보기-->
			<div role="tabpanel" class="tab-pane face in active includePage" id="myAccount">
				<jsp:include page="../include/myAccount.jsp" flush="true"></jsp:include>
			</div>
			<!-- 내정보 전체 보기-->
			<div role="tabpanel" class="tab-pane face in active includePage" id="modifiedMypage">
				<jsp:include page="../include/modifiedMypage.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>


</body>
</html>