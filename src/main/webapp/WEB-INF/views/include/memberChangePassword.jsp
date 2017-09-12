<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8">
	<input type="hidden" id="ajaxCheckMemberPassword" value="<c:url value='/ajax/checkMemberPassword'/>">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="#5F5F5F">비밀번호 수정</font></h2>
		<hr>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-3 " for="PW">
					<p align="right">
						<strong>현재 비밀번호</strong>
					</p>
				</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="nowPW" placeholder="현재 비밀번호를 입력해주세요" name="nowMemberPw">
					<span id="checkResult"></span>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary passwordCheck">
						비밀번호 체크
					</button>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-3 " for="PW">
					<p align="right">
						<strong>새 비밀번호</strong>
					</p>
				</label>
				<div class="col-sm-5">
					<input type="password" class="form-control changePW1" id="newPW" placeholder="새로운 비밀번호 입력해주세요" name="newMemberPassword">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<span id="pwcheck1"></span>
				<br>
				<span id="pwcheck2"></span>
			</div>
		</div>
		<br>
		<form id="updatePasswordForm" action="<c:url value='/teacher/teacherPage/updatePassword'/>" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-3 " for="PW">
						<p align="right">
							<strong>비밀번호 확인</strong>
						</p>
					</label>
					<div class="col-sm-5">
						<input type="password" class="form-control changePW2" id="memberPassword" placeholder="새로운 비밀번호를 재입력 해주세요" name="memberPassword">
						<span id="pwcheck3"></span>
					</div>
				</div>
			</div>
			<br>
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link submitChangePW">수정완료</button>
			</div>
		</form>
		<br><br>
	</div>
	<br><br>
</div>