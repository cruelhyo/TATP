<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8">
	<div class="step_21">
		<h2 align="center">  회원 개인 정보 </h2>
		<hr>
		<input type="hidden" id="ajaxSelectForUpdateMember" value="<c:url value='/ajax/teacherPage/selectForUpdateMember'/>">
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-3 " for="name">
					<p align="right">
						<strong>이름</strong>
					</p>
				</label>
				<div class="col-sm-5">
					<p class="form-control-static memberName" id="memberName"></p>
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
					<p class="form-control-static memberNickname" id="memberNickname"></p>
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
					<p class="form-control-static memberGender" id="memberGender"></p>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-3" for="birth">
					<p align="right">
						<strong>생년월일</strong>
					</p>
				</label>
				<div class="col-sm-5">
					<p class="form-control-static memberBirthday" id="memberBirthday"></p>
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
					<p class="form-control-static memberPhone" id="memberPhone"></p>
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
						<p class="form-control-static memberEmail" id="memberEmail"></p>
					</div>
			</div>
			</div>
		</div>
		<br>
		<br>
	</div>
</div>
	

	