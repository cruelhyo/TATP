<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-10">
	<input type="hidden" id="ajaxSelectTeacherEduCrList" value="<c:url value='/ajax/selectTeacherEducationAndCareerList'/>">
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
				<tbody id="teacherEduTbody">
					
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
				<tbody id="teacherCareerTbody">
					<tr>
						<td>samsung
						</td>
						<td>기획전략
						</td>
						<td>팀장
						</td>
						<td>2011.4
						</td>
						<td>2016.6
						</td>
						<td><button type="button" class="btn btn-depault btn-sm" id="modi">수정</button>
						<button type="button" class="btn btn-depault btn-sm" id="del">삭제</button>
						</td>
					</tr>
				</tbody>
			</table> 
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">추가하기</button>
			</div>
			<br> <br>
		</div>
	</div>
</div>