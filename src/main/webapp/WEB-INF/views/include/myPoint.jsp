<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style> 
input.underline {border:0;border-bottom:1 solid #FF0000;}
</style>


	<div class="col-sm-8">
		<div class="step_21">
			<input type="hidden" id="ajaxSelectMemberPoint" value="<c:url value='/ajax/selectMemberPoint'/>">
			<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="#5F5F5F">My Point 충전하기</font></h2>
			<hr>
			<form action="<c:url value='/user/insertPoint'/>" id="insertPoint" method="post">			
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 " for="point">
							<p align="right" readonly="true">
								<strong>사용 가능 포인트</strong>
							</p>
						</label>
						<div class="col-sm-5">
							<input type="text" class="form-control memberPoint" id="memberPoint" readonly="readonly" placeholder="" name="memberPoint" >
						</div>
	
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 " for="PW">
							<p align="right">
								<strong>포인트 충전</strong>
							</p>
						</label>
	
						<div class="col-sm-8">
							<input type="radio" name="pointChargeMoney" value="5000" id="pointChargeMoney"> 5,000원
						</div>
						<div class="col-sm-8">
							<input type="radio" name="pointChargeMoney" value="10000" id="pointChargeMoney">10,000원
						</div>
						<label class="control-label col-sm-3 " for="PW">
							<p align="right">
								<strong>&nbsp;</strong>
							</p>
						</label>
						<div class="col-sm-8">
							<input type="radio" name="pointChargeMoney" value="30000" id="pointChargeMoney">30,000원
						</div>
						<div class="col-sm-8">
							<input type="radio" name="pointChargeMoney" value="50000" id="pointChargeMoney">50,000원
						</div>
						<label class="control-label col-sm-3 " for="PW">
							<p align="right">
								<strong>&nbsp;</strong>
							</p>
						</label>
						
					</div>
				</div>
				<br>
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-3 ">
							<p align="right">
								<strong>결제수단</strong>
							</p>
						</label>
						<div class="col-sm-8">
							<input type="radio" id="pointChargeShape" name="pointChargeShape" value="신용카드">신용카드 &nbsp;&nbsp; 
							<input type="radio" id="pointChargeShape" name="pointChargeShape" value="실시간계좌이체">실시간 계좌이체&nbsp;&nbsp; 
							<input type="radio" id="pointChargeShape" name="pointChargeShape" value="무통장입금">무통장 입금&nbsp;&nbsp;
							<input type="radio" id="pointChargeShape" name="pointChargeShape" value="핸드폰소액결제">핸드폰 소액결제&nbsp;&nbsp;  
						</div>
					</div>
				</div>
				<br>
				<hr>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-link">충전 하기</button>
				</div>
			</form>
			<br> <br>
		</div>
	</div>
