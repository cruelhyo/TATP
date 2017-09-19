<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="col-sm-8">
	<div class="step_21">
		<h2 align="center">  회원 개인 정보 </h2>
			<hr>
	
		<form>
				<input type="hidden" id="ajaxSelectForUpdateMember" value="<c:url value='/ajax/teacherPage/selectForUpdateMember'/>">
				<input type="hidden" id="ajaxNicknameCheck" value="<c:url value='/ajax/nickNameCheckForUpdate'/>">
				<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
				<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 " for="name">
							<p align="right">
								<strong>이름</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<p class="form-control-static" id="memberName" name="memberName"></p>
						</div>
					</div>
				</div>
				<br>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3" for="nickname">
							<p align="right">
								<strong>닉네임</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<p class="form-control-static" id="memberNickname" name="memberNickname">닉네임</p>
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
							<p class="form-control-static" name="memberGender"id="memberGender" value="male" readonly="readonly">
							남자</p>
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
							<p class="form-control-static" id="memberBirthday" name="memberBirthday" readonly="readonly">생일</p>
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
							<p class="form-control-static" id="memberPhone" name="memberPhone" readonly="readonly">000</p>
							<span id="phch1"></span>
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
								<p class="form-control-static" id="memberEmail" name="memberEmail" readonly="readonly">1</p>
							</div>
					</div>
					</div>
				</div>
	
	<br>
	<br>
	</div>
</div>
	

	