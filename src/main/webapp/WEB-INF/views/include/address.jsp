<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
	<div class="col-sm-8">
		<!-- ajax요청 url, csrf 히든으로 처리후 js파일에서 쓸수 있게 value 지정 -->
		<input type="hidden" id="selectAddressListForTeacher" value="<c:url value='/ajax/selectAddressListForTeacher'/>">
		<input type="hidden" id="ajaxInsertAddressForTeacher" value="<c:url value='/ajax/insertAddressForTeacher'/>">
		<input type="hidden" id="ajaxupdateAddressForTeacher" value="<c:url value='/ajax/updateAddressForTeacher'/>">
		<input type="hidden" id="ajaxDeleteAddressForTeacher" value="<c:url value='/ajax/deleteAddressForTeacher'/>">
		<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
		<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="step_21">
			<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="#5F5F5F">My Address</font>
			</h2>
			<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 주소지를 선택하고,강의를 진행할 주소를 등록해주세요.</p>
			<hr>
			<div class="row" >
				<div class="col-sm-10" align="center">
					<table class="table">
						<thead>
							<tr>
								<th>주소분류</th>
								<th>우편번호</th>
								<th>상세주소</th>
								<th>삭제</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody id="addressTBody">
							
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				
				<div class="col-sm-4">
					&nbsp;&nbsp;&nbsp;&nbsp;<button align="right" type="button" class="btn btn-default btn-xs" id="plus">추가</button>
				</div>
			</div> 
			<form name="addressForm" id="addressForm" action="" method="post">
				<div class="add" id="address1">
					<input type="hidden" id="addressNo" class="addressNoInForm" name="addressNo">
					<hr>
					<br><br>
					<div class="row">
						<div class="form-group">
							<label class="control-label col-sm-3" for="adress">
								<p align="right">
									<strong>주소분류</strong>
								</p>
							</label>
							<div class="col-sm-4">
								<select class="form-control" id="addressClassificationNo" name="addressClassificationNo">
									<option value="1">자택</option>
									<option value="2">작업실</option>
									<option value="3">강의실</option>
									<option value="4">학교&학원</option>
									<option value="5">기타</option>
								</select>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group">
							<label class="control-label col-sm-3 " for="adress">
								<p align="right">
									<strong>우편번호</strong>
								</p>
							</label>
							<div class="col-sm-4">
								<input type="text" class="form-control addressMailNumber" id="sample6_postcode" placeholder="우편번호" name="addressMailNumber">
							</div>
							<div class="col-sm-2">
								<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-default mailNumberSearch">우편번호 검색</button>
							</div>
						</div>
					</div>
					<br>
		
					<div class="row">
						<div class="form-group">
							<label class="control-label col-sm-3" for="adress">
								<p align="right">
									<stong>주소</stong>
								</p>
							</label>
							<div class="col-sm-5">
								<input type="text" class="form-control memberAddress" id="sample6_address" placeholder="상세주소" name="memberAddress">
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="form-group">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-primary submitInsertAddress" id="plus2">
									추가하기
								</button>
								<button type="button" class="btn btn-primary submitUpdateAddress" id="plus3">
									수정하기
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<br>
		</div>
	</div>


</body>
</html>