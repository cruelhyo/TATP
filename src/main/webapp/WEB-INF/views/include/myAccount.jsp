<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8">
	<input type="hidden" id="ajaxSelectTeacherAccountNo" value="<c:url value='/ajax/selectTeacherAccountNo'/>">
	<div class="step_21">
		<h2 align="left" >
			&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="#5F5F5F">계좌관리</font>
		</h2>
		<hr>
		<!-- 계좌 등록 폼 -->
		<form action="<c:url value='/teacher/teacherPage/insertAccount'/>" id="insertAccount" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
		   		<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>은행명</strong>
							</p>
						</label>
						<div class="col-sm-6 wdth">
							<select name="bankNo" id="bankNo" class="dropselects100">
								<option value="">은행선택</option>
								<option value="1">국민은행</option>
								<option value="2">KEB하나은행</option>
								<option value="3">NH농협은행</option>
								<option value="4">한국씨티은행</option>
								<option value="5">우리은행</option>
								<option value="6">신한은행</option>
								<option value="7">카카오뱅크</option>
								<option value="8">케이뱅크</option>
								<option value="9">경남은행</option>
								<option value="10">광주은행</option>
								<option value="11">대구은행</option>
								<option value="12">부산은행</option>
								<option value="13">수협은행</option>
								<option value="14">새마을금고</option>
								<option value="15">우체국은행</option>
								<option value="16">전북은행</option>
								<option value="17">제주은행</option>
							</select>
						</div>
	  				</div>
				</div>   
				<br>
				<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>예금주</strong>
							</p>
						</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="accountHolderName" name="accountHolderName" >
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>계좌번호</strong>
							</p>
						</label>
						
						<div class="col-sm-4">
							<input type="text" class="form-control" id="accountNumber" name="accountNumber" >
							<a>'-'를 제외하고 입력해주세요.</a>
						</div>
					</div>
				</div>
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">계좌 등록 완료</button>
			</div>
		</form>
		
		<!-- 계좌 수정 폼 -->
		<form action="<c:url value='/teacher/teacherPage/updateAccount'/>" id="updateAccount" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
		   		<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>은행명</strong>
							</p>
						</label>
						<div class="col-sm-6 wdth">
							<select name="bankNo" class="bankNoUpdate dropselects100" id="bankNo">
								<option value="">은행선택</option>
								<option value="1">국민은행</option>
								<option value="2">KEB하나은행</option>
								<option value="3">NH농협은행</option>
								<option value="4">한국씨티은행</option>
								<option value="5">우리은행</option>
								<option value="6">신한은행</option>
								<option value="7">카카오뱅크</option>
								<option value="8">케이뱅크</option>
								<option value="9">경남은행</option>
								<option value="10">광주은행</option>
								<option value="11">대구은행</option>
								<option value="12">부산은행</option>
								<option value="13">수협은행</option>
								<option value="14">새마을금고</option>
								<option value="15">우체국은행</option>
								<option value="16">전북은행</option>
								<option value="17" >제주은행</option>
							</select>
						</div>
	  				</div>
				</div>   
				<br>
				<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>예금주</strong>
							</p>
						</label>
						<div class="col-sm-2">
							<input type="text" class="form-control accountHolderNameUpdate" id="accountHolderName" name="accountHolderName" >
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group">
						<label class= "col-sm-4">
							<p align="right">
								<strong>계좌번호</strong>
							</p>
						</label>
						
						<div class="col-sm-4">
							<input type="text" class="form-control accountNumberUpdate" id="accountNumber" name="accountNumber" >
							<a>'-'를 제외하고 입력해주세요.</a>
						</div>
					</div>
				</div>
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">계좌 수정 완료</button>
			</div>
		</form>
		<br> <br>
	</div>
</div>
	

	