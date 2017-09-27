<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<div class="col-sm-8">
	<div class="step_21">
		<div class="control-label col-sm-3">
				<p align="right">
				<h4 align="left" >
					강사 신청
				</h4>
		</div>
		<br><br><br>
		<div class="control-label col-sm-2">
				<p align="right">
					<h4>Education</h4>
				</div>
				<br>
				<hr>
			
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-2 " >
							<p align="right">
								<strong>학교분류</strong>
							</p>
						</label>
						<div class="col-sm-3">
							<select id="school" class="form-control">
								<option value="">분류</option>
								<option value="">고등학교</option>
								<option value="">전문대</option>
								<option value="">대학교</option>
								<option value="">대학원</option>
								<option value="">박사과정</option>
							</select>
						</div>
						<div class="form-group">
						<label class="control-label col-sm-2 " >
							<p align="right">
								<strong>상태</strong>
							</p>
						</label>
						<div class="col-sm-3">			
							<select id="" class="form-control">
								<option value="">상태</option>
								<option value="">재학</option>
								<option value="">휴학</option>
								<option value="">졸업</option>
								<option value="">자퇴</option>
							</select>
						</div>
					</div>
					</div>
					
				</div>
				<br>
				
				<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-2 " >
							<p align="right">
								<strong>학교이름</strong>
							</p>
						</label>
						<div class="col-sm-3">	
							<input type="text" class="form-control" id="schoolname" placeholder="학교명">
						</div>
						<label class="control-label col-sm-2 " >
									<p align="right">
										<strong>전공</strong>
									</p>
								</label>
								<div class="col-sm-3">	
									<input type="text" class="form-control" id="majorname" placeholder="전공">
								</div>
					</div>
				</div>
				<br>
				
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2 " >
									<p align="right">
										<strong>입학일</strong>
									</p>
								</label>
								<div class="col-sm-3">	
									<input type="text" class="form-control" id=""placeholder="입학일">
								</div>
								<label class="control-label col-sm-2 " >
									<p align="right">
										<strong>졸업일</strong>
									</p>
								</label>
								<div class="col-sm-3">	
									<input type="text" class="form-control" id="" placeholder="졸업일">
								</div>
							</div>
						</div>
						<br>
						
						<br><br><br>
			<div class="control-label col-sm-2">
				<p align="right">
					<h4>Career</h4>
				</div>
				<br>
				<hr>
			<div class="row">
					<div class="form-group">
						<label class="control-label col-sm-2 " >
							<p align="right">
								<strong>회사명</strong>
							</p>
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="schoolname" placeholder="회사명">
						</div>
						<label class="control-label col-sm-2 " >
							<p align="right">
								<strong>근무부서</strong>
							</p>
						</label>
						<div class="col-sm-3">			
							<input type="text" class="form-control" id="schoolname" placeholder="근무부서">
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
									<input type="text" class="form-control" id="majorname" placeholder="직위">
								</div>
								<label class="control-label col-sm-2 " >
									<p align="right">
										<strong>입사일</strong>
									</p>
								</label>
								<div class="col-sm-3">	
									<input type="text" class="form-control" id=""placeholder="입사일">
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
									<input type="text" class="form-control" id="" placeholder="퇴사일">
								</div>
							</div>
						</div>
						<br><br><br>
			
			<div class="control-label col-sm-2">
				<p align="right">
					<h4>Portfolio</h4>
				
			</div>
			<br>
			<hr>
			<br>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-2 " >
						<p align="right">
							<strong>제목</strong>
						</p>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="portfolioName"
						placeholder="해당포트폴리오의 제목을 입력해주세요" name="portfolioName">
					</div>
				</div>
			</div>
			<br>
			
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-2 " >
						<p align="right">
							<strong>설명</strong>
						</p>
					</label>
					<div class="col-sm-7">
						<textarea class="form-control" id="portfolioText"  cols="80" data-validation="required"
						placeholder="포트폴리오에 해당하는 설명을 입력하세요" name="portfolioText" required="" rows="10">
						</textarea>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-2 " >
						<p align="right">
							<strong>이미지</strong>
						</p>
					</label>
					<div class="col-sm-5">
						<span class="form-control" id="portFolioImg">
						이미지를 등록해주세요
						</span>
					</div>
					<div>	
						<button type="button" id="portFolioImgSearch" class="btn btn-primary portFolioImgSearch">이미지추가
						</button>
					</div>	
					<br>
					<label class="control-label col-sm-2 " >
						<p align="right">
							<strong>파일</strong>
						</p>
					</label>
					<div class="col-sm-5">
						<span class="form-control" id="portFolioImg">
						파일을 등록해주세요
						</span>
					</div>
					<div>
						<button type="button" id="portFolioFileSearch" class="btn btn-primary portFolioFileSearch">&nbsp;&nbsp;파일추가&nbsp;
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label class="control-label col-sm-2 " >
						<p align="right">
							<strong>카테고리</strong>
						</p>
					</label>
					<div class="col-sm-6 wdth">
						<select  class="dropselects100">
							<option value="">카테고리 선택</option>
							<option value="">음악</option>
							<option value="">미술/사진</option>
							<option value="">공예,프라모델,3D프린팅</option>
							<option value="">스포츠/댄스</option>
							<option value="">요리/주류/바리스타</option>
							<option value="">문학/인문학/외국어</option>
							<option value="">게임/방송기타</option>
							<option value="">입시</option>
							<option value="">자동차</option>
							<option value="">기타</option>
						</select>
					</div>
				</div>
			</div>
			
			
			<hr>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-link">신청하기</button>
			</div>
			<br> <br>
		</div>
	
</div>