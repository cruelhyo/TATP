<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-10">
	<input type="hidden" id="ajaxInsertPointExchangeHistory" value="<c:url value='/ajax/insertPointExchangeHistory'/>">
	<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
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
									<td><input type="text" class="dropselects100 memberPoint memberExchange" id="memberPoint" name="memberPoint" placeholder="point" readonly="readonly"></td>
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
										<th>환전 포인트</th>
										<th>환전일</th>
									</tr>
								</thead>
								<tbody id="exchangeTBody">
								</tbody>
							</table>
							<br>
							<br>
							<br>
						</div>
					</div>
					<form class="ExchangePointForm" name="ExchangePointForm" id="ExchangePointForm" action="" method="post">
						<div class="ExchangePoint" id="ExchangePoint">
							<hr>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-3 " for="adress">
										<p align="right">
											<strong>현재 포인트</strong>
										</p>
									</label>
									<div class="col-sm-5">
										<input type="text" class="form-control memberExchange" id="memberPoint" placeholder="현재 포인트" name="memberPoint">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-3" for="adress">
										<p align="right">
											<stong>환전할 포인트</stong>
										</p>
									</label>
									<div class="col-sm-5">
										<input type="text" class="form-control memberExchange pointExchangePoint" id="pointExchangePoint" placeholder="환전할 포인트" name="pointExchangePoint">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<div class="col-sm-3"></div>
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary submitChangePoint" id="submitChangePoint">
											환전하기
										</button>										
									</div>
								</div>
							</div>
						</div>
						<br>
						<br>
					</form>
				</div>
				<br>
				<br>
			</div>
		</div>
	</div>
</div>
	