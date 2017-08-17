<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팀 멤버 소개</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="/"/>">Take A Talent</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="<c:url value="/"/>">팀 프로젝트 소개</a></li>
			<li><a href="<c:url value="/teammember"/>">팀멤버</a></li>
			<li><a href="<c:url value="/form"/>">프로젝트 보러가기</a></li>
			<li><a href="https://github.com/cruelhyo/TATP">github 보러가기</a></li>
		</ul>
	</div>
	</nav>

	<div class="container-fluid md-3">
		<div class="row">
			<div class="col-sm-2  text-center"></div>
			<div class="col-sm-8">
				<h3>팀 멤버 소개</h3><br>
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">이종효</div>
						<div class="panel-body">프로젝트 기획 및 총괄</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">한재희</div>
						<div class="panel-body">웹기획/디자인/퍼블리싱</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">김상훈</div>
						<div class="panel-body">고객응대 시스템/거래시스템관리</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">최기람</div>
						<div class="panel-body">회원관리/강좌관리 시스템</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>