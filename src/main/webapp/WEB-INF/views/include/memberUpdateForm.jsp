<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="col-sm-8">
		<div class="step_21">

			<h2 align="center">회원 정보 수정</h2>
			<hr>
			<c:if test="${param.updateSuccess == 1}">
				<p>수정이 성공적입니다</p>
			</c:if>
			<c:if test="${param.updateSuccess == 0}">
				<p>수정을 실패했습니다</p>
			</c:if>
			<form action="<c:url value='/teacher/teacherPage/updateMember'/>" id="updateForm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 " for="name">
							<p align="right">
								<strong>이름</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름 입력">
						</div>
					</div>
				</div>
				<br>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 " for="nickname">
							<p align="right">
								<strong>닉네임</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="닉네임 입력">
						</div>
					</div>
				</div>
				<br>
	
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3" for="gender">
							<p align="right">
								<strong>성별</strong>
							</p>
						</label>
						<div class="col-sm-8">
							<input type="radio" name="memberGender" id="memberGender" value="male" readonly="readonly">
							Male 
							&nbsp;&nbsp; 
							<input type="radio" name="memberGender" id="memberGender" value="female"readonly="readonly">
							Female
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3" for="birth">
							<p align="right">
								<strong>생년월일</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="memberBirthday" name="memberBirthday" placeholder="ex) 1994-11-08">
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3" for="phone">
							<p align="right">
								<strong>핸드폰</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="ex) 01012345678">
						</div>
					</div>
				</div>
				<br>
	
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3" for="email">
							<p align="right">
								<strong>이메일</strong>
							</p>
						</label>
						<div class="row">
							<div class="col-sm-7 ">
								<input type="text" class="dropselectsec1" id="memberEmail" name="memberEmail" placeholder="ex) abc123@naver.com">
							</div>
					</div>
					</div>
				</div>
				<br> <br>
				<hr>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-link" id="updateMemberBtn">수정완료</button>
				</div>
			</form>
					<br>
					<br>
		</div>
	</div>