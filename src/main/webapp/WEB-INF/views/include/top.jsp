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
	
	$(function () {
	  $('#myTab a:last').tab('show');
	});
	
	$('#myPage').hide();
	$('#myPoint').hide();
	
	var allHide = function(){
		$('#myPage').hide();
		$('#myPoint').hide();
	};
	
	$('#myInfo').click(function(){
		allHide();
		$('#myPage').show();
	});
	$('#myPointCharge').click(function(){
		allHide();
		$('#myPoint').show();
	});
});
	
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

</body>
</html>