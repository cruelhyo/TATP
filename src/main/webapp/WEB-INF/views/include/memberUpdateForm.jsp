<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<body>
	<div class="col-sm-8">
		<div class="step_21">

			<h2 align="center">회원 정보 수정</h2>
			<hr>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-3 " for="name">
						<p align="right">
							<strong>이름</strong>
						</p>
					</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="name"
							placeholder="이름 입력">
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
						<input type="text" class="form-control" id="nickname"
							placeholder="닉네임 입력">
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
						<input type="radio" name="gender" value="male" readonly="readonly">
						Male 
						&nbsp;&nbsp; 
						<input type="radio" name="gender" value="female"readonly="readonly">
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
					<div class="col-sm-2 wdth">
						<select name="visa_status" id="visa_status" class="dropselectsec1">
							<option value="">일</option>
							<option value="2">1</option>
							<option value="1">2</option>
							<option value="4">3</option>
							<option value="5">4</option>
							<option value="6">5</option>
							<option value="3">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</div>
					<div class="col-sm-2 wdth">
						<select name="visa_status" id="visa_status" class="dropselectsec1">
							<option value="">월</option>
							<option value="2">01</option>
							<option value="1">02</option>
							<option value="4">03</option>
							<option value="5">04</option>
							<option value="6">05</option>
							<option value="3">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
						</select>
					</div>
					<div class="col-sm-2 wdth">
						<select name="visa_status" id="visa_status" class="dropselectsec1">
							<option value="">년</option>
							<option value="2">1990</option>
							<option value="1">1991</option>
							<option value="4">1992</option>
							<option value="5">1993</option>
							<option value="6">1994</option>
							<option value="3">1995</option>
							<option value="7">1996</option>
							<option value="8">1997</option>
							<option value="9">1998</option>
						</select>
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
						<input type="text" class="form-control" id="phone"
							placeholder="번호입력" name="">
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
							<input type="text" placeholder="메일주소 입력" class="dropselectsec1">
						</div>
				</div>
				</div>
			</div>
			<br> <br>
			<hr>
			<div class="col-sm-1">
						<button type="submit" class="btn btn-link">수정완료</button>
					</div>
					<br>
					<br>
		</div>
	</div>