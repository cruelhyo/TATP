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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>팀 프로젝트 소개</title>
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
				<li><a href="<c:url value="/mainform"/>">프로젝트 보러가기</a></li>
				<li><a href="https://github.com/cruelhyo/TATP">github 보러가기</a></li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid md-3">
		<div class="row">
			<div class="col-sm-2  text-center"></div>
			<div class="col-sm-8">
				<h3>팀 프로젝트 소개</h3>
				<br>
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">프로젝트 명</div>
						<div class="panel-body">Take a Talent</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">프로젝트 목적</div>
						<div class="panel-body">재능 매칭 교육시스템</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">프로젝트 기대효과</div>
						<div class="panel-body">
							교육을 찾기 힘든 생소하거나 취미 등의 분야에 대해서 서비스 제공 <br>각종 재능과 취미에 대해 일자리
							창출 효과
						</div>
					</div>
				</div>

				<table class="table table-striped">
					<thead>
						<tr>
							<th><h3>개발 환경</h3></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>OS</td>
							<td>Windows 7</td>
						</tr>
						<tr>
							<td>WAS</td>
							<td>apache-tomcat-8.0</td>
						</tr>
						<tr>
							<td>DBMS</td>
							<td>MySQL 5.5.x </td>
						</tr>
						<tr>
							<td>사용언어</td>
							<td>Java(JDK1.8.0)</td>
						</tr>
						<tr>
							<td>FrameWork</td>
							<td>spring 4.3.10, spring-security 4.2.3 </td>
						</tr>
						<tr>
							<td>버전관리, 협업</td>
							<td>GitHub</td>
						</tr>
						<tr>
							<td>테스트환경</td>
							<td>Chrome</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
