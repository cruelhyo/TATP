<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-sm-10">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;
			<font color="#5F5F5F">이력사항 관리</font>
		</h2>
	<hr>
		<div>
		<br>
		<h4>학력</h4>
			<table class="table">
				<thead>
					<tr>
						<th>분류</th>
						<th>상태</th>
						<th>학교명</th>
						<th>전공</th>
						<th>입학일</th>
						<th>졸업일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<select id="school"
									class="form-control">
								<option value="">분류</option>
								<option value="">고등학교</option>
								<option value="">전문대</option>
								<option value="">대학교</option>
								<option value="">대학원</option>
								<option value="">박사과정</option>
							</select>
							
						</td>
						<td>
							<select id=""
									class="form-control">
								<option value="">상태</option>
								<option value="">재학</option>
								<option value="">휴학</option>
								<option value="">졸업</option>
								<option value="">자퇴</option>
							</select>
						</td>
						<td><input type="text" class="form-control" id="schoolname">
						</td>
						<td><input type="text" class="form-control" id="majorname">
						</td>
						<td><input type="text" class="form-control" id="">
						</td>
						<td><input type="text" class="form-control" id="">
						</td>
						<td><button type="button" class="btn btn-depault" id="modi">등록</button>
						
					</tr>
				</tbody>
			</table>  
			<br>
			<h4>경력</h4>
			<table class="table">
				<thead>
					<tr>
						<th>회사명</th>
						<th>근무부서</th>
						<th>직위</th>
						<th>입사일</th>
						<th>퇴사일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" id="schoolname">
						</td>
						<td><input type="text" class="form-control" id="schoolname">
						</td>
						<td><input type="text" class="form-control" id="schoolname">
						</td>
						<td><input type="text" class="form-control" id="majorname">
						</td>
						<td><input type="text" class="form-control" id="">
						</td>
						<td><button type="button" class="btn btn-depault" id="modi">등록</button>
					</tr>
				</tbody>
			</table> 
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">완료</button>
			</div>
			<br> <br>
		</div>
	</div>
</div>