<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8">
	<input type="hidden" id="ajaxSelectPointHistoryList" value="<c:url value='/ajax/selectPointHistoryList'/>">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="#5F5F5F">내 충전내역 보기</font></h2>
			<p align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				한달 전의 데이터까지 볼 수 있습니다.
			</p>
		<hr>
		<div class="row">
			<div class="col-sm-10">
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>결제금액</th>
							<th>충전된 포인트</th>
							<th>결제일</th>
						</tr>
					</thead>
					<tbody id="pointTBody">
						<tr>
							<td></td>
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
</div>
	