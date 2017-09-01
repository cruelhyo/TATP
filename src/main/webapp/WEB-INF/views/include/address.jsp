<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
	<div class="col-sm-8">
		<div class="step_21">
		
			<h2 align="center">My Address</h2><p align="center">기본 주소지를 선택하고,강의를 진행할 주소를 등록해주세요.</p>
			<hr>
			<div class="container">
				
				
					<div class="col-sm-10">
						<table class="table">
							<thead>
								<tr>
									<th>주소분류</th>
									<th>우편번호</th>
									<th>상세주소</th>
									<th>사용상태</th>
									<th>삭제</th>
									<th>추가</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<div >
											<input type="radio" name="yes" value="yes"> 기본주소
										</div>
									</td>
									<td>
										<div>
											<ul class="list-inline">
												<li><button type="button" class="btn btn-primary btn-xs">삭제</button></li>
											</ul>
										</div>
									</td>
									<td>
										<div>
											<ul class="list-inline">
												<li><button type="button" class="btn btn-default btn-xs"  id="plus">추가</button></li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<div >
											<input type="radio" name="yes" value="yes"> 기본주소
										</div>
									</td>
									<td>
										<div>
											<ul class="list-inline">
												<li><button type="button" class="btn btn-primary btn-xs">삭제</button></li>
											</ul>
										</div>
									</td>
									<td>
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<div >
											<input type="radio" name="yes" value="yes"> 기본주소
										</div>
									</td>
									<td>
										<div>
											<ul class="list-inline">
												<li><button type="button" class="btn btn-primary btn-xs">삭제</button></li>
											</ul>
										</div>
									</td>
									<td>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				
			<div class="add" id="address1">
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-1 " for="adress">
							<p align="right">
								<strong>주소</strong>
							</p>
						</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="adress"
						placeholder="우편번호" name="member_address">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default mailNumberSearch">우편번호 검색</button>
					</div>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-1" for="adress">
						<p align="right">
							<stong>상세주소</stong>
						</p>
					</label>
				<div class="col-sm-5">
			<input type="text" class="form-control" id="ID"
				placeholder="상세주소" name="member_address_detail">
				</div>
				<div class="col-sm-2">
						<button type="button" class="btn btn-primary mailNumberSearch" id="plus2">추가하기</button>
					</div>
			</div>
		</div>
		
	</div>
		<br>
								
	
				
			<!-- 구분선 -->		
			<hr>
			<!-- 수정완료버튼 -->
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">수정완료
				</button>
			</div>
			<br>
			<br>
		</div>
	</div>


</body>
</html>