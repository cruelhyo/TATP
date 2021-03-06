<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<div class="col-sm-8">	
	<input type="hidden" id="ajaxSelectTeacherEduCrList" value="<c:url value='/ajax/selectTeacherEducationAndCareerList'/>">
	<input type="hidden" id="ajaxInsertTeacherEducation" value="<c:url value='/ajax/insertTeacherEducation'/>">
	<input type="hidden" id="ajaxUpdateTeacherEducation" value="<c:url value='/ajax/updateTeacherEducation'/>">
	<input type="hidden" id="ajaxInsertTeacherCareer" value="<c:url value='/ajax/insertTeacherCareer'/>">
	<input type="hidden" id="ajaxUpdateTeacherCareer" value="<c:url value='/ajax/updateTeacherCareer'/>">
	<input type="hidden" id="ajaxDeleteTeacherEducation" value="<c:url value="/ajax/deleteTeacherEducation"/>">
	<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;
			<font color="#5F5F5F">학력사항 관리</font>
		</h2>
		<hr>
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
					<th></th>
				</tr>
			</thead>
			<tbody id="teacherEduTbody">
			</tbody>
		</table>
<!-- ---------------------------------------------- addTeacherEduModal시작부분 ---------------------------------------------- -->
		<!-- modal btn -->
		
		<div id="addTeacherEdu">
			<div class="control-label col-sm-12">
				<p align="right">
					<button type="button" class="btn btn-default"
						id="addTeacherEduBtn" value=0 data-toggle="modal"
						data-target="#addTeacherEduModal">추가하기</button>
				</p>
			</div>
		</div>
		<br>
		<br>
		<!-- modal효과-->
		<form id="addTeacherEduForm">
			<div class="modal fade" id="addTeacherEduModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Education</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="form-group">
										<label class="control-label col-sm-2 ">
											<p align="right">
												<strong>학교분류</strong>
											</p>
										</label>
										<div class="col-sm-3">
											<select id="teacherEducationClassificationNo"
												class="form-control" name="teacherEducationClassificationNo">
												<option value="">분류</option>
												<option value="1">고등학교</option>
												<option value="2">전문대</option>
												<option value="3">대학교</option>
												<option value="4">대학원</option>
												<option value="5">박사과정</option>
											</select>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2 ">
												<p align="right">
													<strong>상태</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<select id="teacherEducationStatusNo" class="form-control"
													name="teacherEducationStatusNo">
													<option value="">상태</option>
													<option value="1">재학</option>
													<option value="2">휴학</option>
													<option value="3">졸업</option>
													<option value="4">자퇴</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-sm-2 ">
											<p align="right">
												<strong>학교이름</strong>
											</p>
										</label>
										<div class="col-sm-3">
											<input type="text" class="form-control"
												id="teacherEducationSchoolName" placeholder="학교명"
												name="teacherEducationSchoolName">
										</div>
										<label class="control-label col-sm-2 ">
											<p align="right">
												<strong>전공</strong>
											</p>
										</label>
										<div class="col-sm-3">
											<input type="text" class="form-control"
												id="teacherEducationMajor" placeholder="전공"
												name="teacherEducationMajor">
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-sm-2 ">
											<p align="right">
												<strong>입학일</strong>
											</p>
										</label>
										<div class="col-sm-3">
											<input type="text" class="form-control"
												id="teacherEducationAdmission" placeholder="ex) 2000-03-01"
												name="teacherEducationAdmission">
										</div>
										<label class="control-label col-sm-2 ">
											<p align="right">
												<strong>졸업일</strong>
											</p>
										</label>
										<div class="col-sm-3">
											<input type="text" class="form-control"
												id="teacherEducationGraduation"
												placeholder="ex) 2004-02-28 졸업일만 기입"
												name="teacherEducationGraduation">
										</div>
									</div>
								</div>
							</div>
							<!-- modal 입력완료버튼 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-default submitBtn"
	          							data-dismiss="modal" id="insertTeacherEdu" value="0">
	          						입력완료
	          					</button>
							</div>
						</div>
				</div>
			</div>
		</form>
<!------------------------------------------------ modiEduListModal시작부분 ------------------------------------------------>
		<!-- 수정폼 Modal -->
		<form id="modiTeacherEduForm">
			<div class="modal fade" id="modiEduListModal" role="dialog">
				<div class="modal-dialog">
					<!--학력수정 Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Education</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" id="teacherEduNo" name="teacherEducationNo">
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right"><strong>학교분류</strong></p>
									</label>
									<div class="col-sm-3">
										<select id="teacherEducationClassificationNo"
											class="form-control" name="teacherEducationClassificationNo">
											<option value="">분류</option>
											<option value="1">고등학교</option>
											<option value="2">전문대</option>
											<option value="3">대학교</option>
											<option value="4">대학원</option>
											<option value="5">박사과정</option>
										</select>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2 ">
											<p align="right"><strong>상태</strong></p>
										</label>
										<div class="col-sm-3">
											<select id="teacherEducationStatusNo" class="form-control"
												name="teacherEducationStatusNo">
												<option value="">상태</option>
												<option value="1">재학</option>
												<option value="2">휴학</option>
												<option value="3">졸업</option>
												<option value="4">자퇴</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right"><strong>학교이름</strong></p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control"
											id="teacherEducationSchoolName" placeholder="학교명"
											name="teacherEducationSchoolName">
									</div>
									<label class="control-label col-sm-2 ">
										<p align="right"><strong>전공</strong></p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control"
											id="teacherEducationMajor" placeholder="전공"
											name="teacherEducationMajor">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right"><strong>입학일</strong></p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control"
											id="teacherEducationAdmission" placeholder="ex) 2000-03-01"
											name="teacherEducationAdmission">
									</div>
									<label class="control-label col-sm-2 ">
										<p align="right"><strong>졸업일</strong></p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control"
											id="teacherEducationGraduation"
											placeholder="ex) 2004-02-28 졸업일만 기입"
											name="teacherEducationGraduation">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-default submitBtn"
								data-dismiss="modal" id="updateTeacherEdu" value=0>수정완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
		
	