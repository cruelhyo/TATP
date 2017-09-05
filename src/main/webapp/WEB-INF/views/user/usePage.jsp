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
<script type="text/javascript" src="<c:url value='/resources/javascript/usePageJs.js'/>"></script>

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
									<a href="#" id="">
										<span class="glyphicon glyphicon-user"></span>
										서비스소개
									</a>
								</li>
								<li>
									<a href="#" id="">
										<span class="glyphicon glyphicon-cloud"></span>
										수업개설 이용방법
									</a>
								</li>
								<li>
									<a href="#" id="">
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
		<!-- 내정보수정 -->
		<div class="tab-content">
			<!--기본정보 수정  -->
  			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPage2">
				<jsp:include page="../include/memberUpdateFormForStudent.jsp" flush="true"></jsp:include>
			</div>
			<!--내포인트 충전 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPoint">
				<jsp:include page="../include/myPoint.jsp" flush="true"></jsp:include>
			</div>
			<!--비밀번호 변경 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myChangePW">
				<jsp:include page="../include/memberChangePassword.jsp" flush="true"></jsp:include>
			</div>
			
			<!-- 내 결제내역 보기 -->
			<div role="tabpanel" class="tab-pane fade in active includePage" id="myPointHistory">
				<jsp:include page="../include/myPointHistory.jsp" flush="true"></jsp:include>
			</div>
			
		</div>
	</div>
	 
   
</body>
</html>