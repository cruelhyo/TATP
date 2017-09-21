<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8">
	<input type="hidden" id="ajaxSelectTeacherEduCrList" value="<c:url value='/ajax/selectTeacherEducationAndCareerList'/>">
	<input type="hidden" id="ajaxInsertTeacherEducation" value="<c:url value='/ajax/insertTeacherEducation'/>">
	<input type="hidden" id="ajaxUpdateTeacherEducation" value="<c:url value='/ajax/updateTeacherEducation'/>">
	<input type="hidden" id="ajaxDeleteTeacherEducation" value="<c:url value="/ajax/deleteTeacherEducation"/>">
	<input type="hidden" id="ajaxInsertTeacherCareer" value="<c:url value='/ajax/insertTeacherCareer'/>">
	<input type="hidden" id="ajaxUpdateTeacherCareer" value="<c:url value='/ajax/updateTeacherCareer'/>">
	<input type="hidden" id="ajaxDeleteTeacherCareer" value="<c:url value="/ajax/deleteTeacherCareer"/>">
	<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;
			<font color="#5F5F5F">경력사항 관리</font>
		</h2>
		<hr>
		<br>
		
		
		<br><br>
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
					<th></th>
				</tr>
			</thead>
			<tbody id="teacherCareerTbody">
			</tbody>
		</table> 
<!------------------------------------------------ addTeacherCrModal시작부분 ------------------------------------------------>			
		<!-- modal btn -->
		<div id="addTeacherCr">  
			<div class="control-label col-sm-12">
				<p align="right">
					<button type="button" class="btn btn-default" id="addTeacherCrBtn" 
					value=0 data-toggle="modal" data-target="#addTeacherCrModal">추가하기</button>
				</p>
			</div>
		</div>
		<br>
		<br>
		<form id="addTeacherCrForm">
			<!-- 경력추가 Modal시작부분-->
  			<div class="modal fade" id="addTeacherCrModal" role="dialog">
    			<div class="modal-dialog">
     				 <!-- Modal content-->
     				<div class="modal-content">
       					<div class="modal-header">
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
         				 	<h4 class="modal-title">Career</h4>
        				</div>
        				<div class="modal-body">
	          				<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right"><strong>회사명</strong></p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="teacherCareerCompany" 
											placeholder="회사명" name="teacherCareerCompany">
									</div>
									<label class="control-label col-sm-2 " >
										<p align="right"><strong>근무부서</strong></p>
									</label>
									<div class="col-sm-3">			
										<input type="text" class="form-control" id="teacherCareerDepartment" 
											placeholder="근무부서" name="teacherCareerDepartment">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right"><strong>직위</strong></p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerPosition" 
											placeholder="직위" name="teacherCareerPosition">
									</div>
									<label class="control-label col-sm-2 " >
										<p align="right"><strong>입사일</strong></p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerEmploymentDate"
											placeholder="ex) 2000-03-01" name="teacherCareerEmploymentDate">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right"><strong>퇴사일</strong></p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerLeaveDate" 
											placeholder="퇴사일" name="teacherCareerLeaveDate">
									</div>
								</div>
							</div>
       					</div>
	       				<!-- modal 입력완료버튼 -->
	        			<div class="modal-footer">
	          				<button type="button" class="btn btn-default submitBtn submitTeacherCr" 
	          				data-dismiss="modal" id="insertTeacherCr" value=0>입력완료</button>
        				</div>
      				</div>
      			</div>
    		</div>
    	</form>
<!------------------------------------------------modiTeacherCrModal시작부분 ------------------------------------------------>	   	
    	<!-- 경력수정 Modal시작부분-->
    	
	  		<div class="modal fade" id="modiTeacherCrModal" role="dialog">
	    		<div class="modal-dialog">
	     			<!-- Modal content-->
	     			<form id="modiTeacherCrForm">
	     			<div class="modal-content">
	       				<div class="modal-header">
	          				<button type="button" class="close" data-dismiss="modal">&times;</button>
	         				<h4 class="modal-title">Career</h4>
	        			</div>
	        			<div class="modal-body">
	        				<input type="hidden" id="teacherCrNo" name="teacherCareerNo">
	          				<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right">
											<strong>회사명</strong>
										</p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="teacherCareerCompany" 
											placeholder="회사명" name="teacherCareerCompany">
									</div>
									<label class="control-label col-sm-2 " >
										<p align="right">
											<strong>근무부서</strong>
										</p>
									</label>
									<div class="col-sm-3">			
										<input type="text" class="form-control" id="teacherCareerDepartment" 
											placeholder="근무부서" name="teacherCareerDepartment">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right">
											<strong>직위</strong>
										</p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerPosition" 
											placeholder="직위" name="teacherCareerPosition">
									</div>
									<label class="control-label col-sm-2 " >
										<p align="right">
											<strong>입사일</strong>
										</p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerEmploymentDate"
											placeholder="ex) 2000-03-01" name="teacherCareerEmploymentDate">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 " >
										<p align="right">
											<strong>퇴사일</strong>
										</p>
									</label>
									<div class="col-sm-3">	
										<input type="text" class="form-control" id="teacherCareerLeaveDate" 
											placeholder="퇴사일" name="teacherCareerLeaveDate">
									</div>
								</div>
							</div>
	       				</div>
	       				<!-- modal 입력완료버튼 -->
	        			<div class="modal-footer">
	          				<button type="button" class="btn btn-default submitBtn submitTeacherCr" 
	          				data-dismiss="modal" id="updateTeacherCr" value=0>수정완료</button>
	        			</div>
	      			</div>
	      			</form>
	      		</div>
	    	</div>
	    
	</div>
</div>
