<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="col-sm-8">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="#5F5F5F">계좌관리</font></h2>
			<hr>
	
		
	<div class="container">
   		<div class="row">
				<div class="form-group">
					<label class= "col-sm-4">
						<p align="right">
							<strong>은행명</strong>
						</p>
					</label>
					
					<div class="col-sm-6 wdth">
						<select name="bankSelect" id="bankSelect"
						class="dropselects100">
							<option value="">은행선택</option>
							<option value="1">국민은행</option>
							<option value="2">KEB하나은행</option>
							<option value="3">NH농협은행</option>
							<option value="4">하나은행</option>
							<option value="5">한국씨티은행</option>
							<option value="6">우리은행</option>
							<option value="7">신한은행</option>
							<option value="8">카카오뱅크</option>
							<option value="9">케이뱅크</option>
							<option value="10">경남은행</option>
							<option value="11">광주은행</option>
							<option value="12">대구은행</option>
							<option value="13">부산은행</option>
							<option value="14">수협은행</option>
							<option value="15">새마을금고</option>
							<option value="16">우체국은행</option>
							<option value="17">전북은행</option>
							<option value="18">제주은행</option>
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
						<input type="text" class="form-control" id="accountName" name="accountName" >
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
						<input type="text" class="form-control" id="accountName" name="accountName" >
						<a>'-'를 제외하고 입력해주세요.</a>
					</div>
				</div>
			</div>
   	</div>
		<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">계좌 등록 완료</button>
			</div>
			<br> <br>
</div>
</div>
	

	