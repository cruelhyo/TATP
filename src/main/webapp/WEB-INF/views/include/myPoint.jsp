<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<haed>
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>"
	type="text/css">
</haed>
<body>
	<div class="col-sm-8">
		<div class="step_21">

			<h2 align="center">My Point</h2>
			<hr>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-3 " for="point">
						<p align="right" readonly="true">
							<strong>사용 가능 포인트</strong>
						</p>
					</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="point"
							readonly="readonly" placeholder="" name="myPoint">
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
						<input type="radio" name="gender" value="male"> 5,000원
					</div>
					<div class="col-sm-8">
						<input type="radio" name="gender" value="male">10,000원
					</div>
					<label class="control-label col-sm-3 " for="PW">
						<p align="right">
							<strong>&nbsp;</strong>
						</p>
					</label>
					<div class="col-sm-8">
						<input type="radio" name="gender" value="male">30,000원
					</div>
					<div class="col-sm-8">
						<input type="radio" name="gender" value="male">50,000원
					</div>
					<label class="control-label col-sm-3 " for="PW">
						<p align="right">
							<strong>&nbsp;</strong>
						</p>
					</label>
					<div class="col-sm-8">
						<input type="radio" name="gender" value="male">직접입력
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="mypoiny"
							name="myPoint">
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-3 " for="PW">
						<p align="right">
							<strong>결제수단</strong>
						</p>
					</label>
					<div class="col-sm-8">
						<input type="radio" name="payment" value="payment">신용카드 &nbsp;&nbsp; 
						<input type="radio"name="payment" value="payment">실시간 계좌이체&nbsp;&nbsp; 
						<input type="radio"name="payment" value="payment">무통장 입금&nbsp;&nbsp;
						<input type="radio"name="payment" value="payment">핸드폰 소액결제&nbsp;&nbsp;  
					</div>
				</div>
			</div>
			<br>

			
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">충전 하기</button>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>
