<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"  href="<c:url value='/anonymous/mainform'/>">Take a Talent</a>
			</div>
			<ul class="nav navbar-nav">
			<!-- <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> menu <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li> -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 강좌찾기 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">무료강좌</a></li>
						<li><a href="<c:url value='/anonymous/classSearch'/>">유료강좌</a></li>
						
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> my page <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('ROLE_SYSTEM_ADMIN','ROLE_OPERATION_ADMIN')">
							<li><a href="<c:url value='/admin'/>">Admin Page</a></li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_REGULAR_MEM','ROLE_ASSOCIATE_MEM')">
							<li><a href="<c:url value='/member/studentPage'/>">Student Page</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_TEACHER')">
							<li><a href="<c:url value='/teacher/teacherPage'/>">Teacher Page</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li><a>로그인후 이용해 주세요</a></li>
						</sec:authorize>
						
					</ul></li>
				<li class="active"><a href="<c:url value='/anonymous/usePage'/>">이용방법</a></li>
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