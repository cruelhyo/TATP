<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Take A Talent</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Take a Talent</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
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

			<li><a href="<c:url value='/anonymous/userjoin'/>"> <span class="glyphicon glyphicon-user"></span>
					Join
			</a></li>
			<li><a href="<c:url value='/userlogin'/>"> <span
					class="glyphicon glyphicon-log-in"></span> Login
			</a></li>
			<li>
		</ul>
	</div>


	</nav>
	<!-- 회원가입폼 -->

	<div class="container">
		<h2>Member Join form</h2>
		<br>
		
		<form class="form-horizontal" action="/action_page.php">
			<div class="form-group">

				<label class="control-label col-sm-2" for="adress">ID:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="ID" placeholder="ID 입력"
						name="member_id">
				</div>
				<button type="submit" class="btn btn-default">ID 중복확인</button>

		

				<div class="col-sm-offset-2 col-sm-10"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pw"
						placeholder="password 입력" name="member_pw">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password
					check:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pw"
						placeholder="password 확인" name="member_pwd">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Name:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="Name 입력" name="member_name">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">BirthDay:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pw"
						placeholder="Birthday 입력" name="user_birth">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Gender:</label>
				<div class="col-sm-10">
					<input type="radio" name="gender" value="male"> Male <input
						type="radio" name="gender" value="female"> Female<br>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="Phone_Number">Phone
					Number:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="Phone_Number"
						placeholder="Phone Number 입력" name="user_Phone">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="adress">Adress:</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="adress"
						placeholder="Enter Adress" name="member_Adress">
				</div>
				<button type="submit" class="btn btn-default">우편번호찾기</button>
				<div class="col-sm-offset-2 col-sm-10"></div>
				
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"> </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="adress1"
						placeholder="상세주소 입력" name="adress">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Email:</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="Email 입력" name="member_email">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">정보수신메일 동의:</label>
				<div class="col-sm-10">
					<h5>본 site에서 제공하는 정보메일을 받아 보시겠습니까?</h5>
					<div class="col-sm-10">
						<input type="radio" name="yn" value="yes"> 예 <input
							type="radio" name="yn" value="no"> 아니오<br>
					</div>
				</div>
			</div>
			<br>
			<div class="col-sm-6">  </div> <button type="submit" class="btn btn-default">가입하기</button>
				
		</form>
		
</body>
</html>