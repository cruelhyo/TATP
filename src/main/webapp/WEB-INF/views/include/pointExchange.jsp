<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="col-sm-10">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="#5F5F5F">포인트 환전</font>
		</h2>
			<hr>
	
		
	<div class="container">
   		<div class="row">
				
			
			<label class="col-sm-3">
				<p align="left">
					<strong>환전 가능포인트</strong>
				</p>
			</label>
		
   		<div class="col-sm-10" id="Exchangeable" name="Exchangeable" >
   			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>환전 가능 포인트</th>
						<th>환전 신청 하기</th>
						<th>환전 내역 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><input type="text" class="dropselects100" id="point" placeholder="point" readonly="readonly"></td>
						<td><button type="button" class="btn btn-primary btn-sm" id="Exchange">환전하기</button>
						</td>
						<td><button type="button" class="btn btn-depault btn-sm" id="ExchangeView">환전내역보기</button>
						</td>
					</tr>
				</tbody>
			</table>   
		<br>
		<br>
   	
   		<div class="ExchangeHistory" id="ExHistory">
			<label class="col-sm-3">
				<p align="left">
					<strong>환전 내역</strong>
				</p>
			</label>
		
   		<div class="col-sm-10">
   			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>환전금액</th>
						<th>환전일</th>
						<th>환전상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>3</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
					
		<br>
		<br>
		<br>
		</div>
		</div>
	</div>
	<br>
	<br>
</div>
</div>
	
</div>
</div>
	