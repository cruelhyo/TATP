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
<link rel="stylesheet" href="<c:url value='/resources/css/mapage.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/classSearch.css'/>" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript" charset="UTF-8" src="./jquery.pagenavigator.js"></script>



<style>
ul.PageSec{
   list-style:none;
   }

</style>

<title>search Class</title>
</head>
<body>

	<!-- top 인클루드 -->
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>


	<!--search class form -->
	<nav class="searchBox">
		<div class="container-fluid">

			<form class="navbar-form navbar-right" role="search">
				<div class="form-group input-group">
					<input type="text" class="form-control" placeholder="Search..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</form>
		</div>
	</nav>
	<br>
	
	<div class="container-fluid text-center">
		<div class="row">
		
		<!-- side bar 인클루드 -->
			<div>
				<jsp:include page="../include/classSearchSide.jsp" flush="true"></jsp:include>
			</div>
			
		<!-- 강의 list보기 -->
			<div>
				<jsp:include page="../include/classList.jsp" flush="true"></jsp:include>
			</div>
			
		</div>
	</div>
</body>
</html>