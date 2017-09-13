<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-sm-8">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;
			<font color="#5F5F5F">강좌 개설하기</font>
		</h2>
	<hr>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>수업 제목</strong></p>
				</label>
				<div class="col-sm-4">	
					<input type="text" class="form-control" id="schoolname" placeholder="">
				</div>
				<label class="control-label col-sm-1 " >
					<p align="right"><strong>수강인원</strong></p>
				</label>
				<div class="col-sm-3">	
					<input type="text" class="form-control" id="majorname" placeholder="">
				</div>
			</div>
		</div>
	
	<br>
	<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>카테고리</strong></p>
				</label>
				<div class="col-sm-3">
					<select  class="dropselects100">
						<option value="">대분류선택</option>
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
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>세부카테고리</strong></p>
				</label>
				<div class="col-sm-1">
					<select  class="dropselects100">
						<option value="">중분류선택</option>
						<option value="">악기</option>
						<option value="">작곡/작사</option>
						<option value="">보컬/국악/성악/실용</option>
						<option value="">디제잉</option>
						<option value="">아동미술</option>
						<option value="">성인미술</option>
						<option value="">사진</option>
						<option value="">DIY/수공예</option>
						<option value="">프라모델/피규어/Doll</option>
						<option value="">3D프린팅</option>
						<option value="">드론/RC/H.W제작</option>
						<option value="">레져/실외</option>
						<option value="">실내</option>
						<option value="">헬스/다이어트</option>
						<option value="">댄스스포츠/벨리댄스</option>
						<option value="">발레/현대/한국</option>
						<option value="">실용댄스</option>
						<option value="">한식/중식/일식/양식</option>
						<option value="">제과/제빵</option>
						<option value="">주류/바리스타</option>
						<option value="">집밥/자취/기타</option>
						<option value="">작문</option>
						<option value="">인문학</option>
						<option value="">외국어</option>
						<option value="">게임개발/게임코칭</option>
						<option value="">방송/컨텐츠제작</option>
						<option value="">sw개발/프로그래밍</option>
						<option value="">중고등 교과가목</option>
						<option value="">입시 예체능</option>
						<option value="">자동차튜닝/주변기기</option>
						<option value="">정비</option>
						<option value="">장롱면허연수</option>
						<option value="">마술</option>
						<option value="">애완</option>
						<option value="">비지니스/경영</option>
						<option value="">보건/의료</option>
						<option value="">상담/일상</option>
						<option value="">기타</option>
					</select>
				</div>
			</div>
		</div>
		
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>수업종류</strong></p>
				</label>
				<div class="col-sm-3" id="">	
					<select  class="dropselects100">
						<option value="">종류선택</option>
						<option value="">원데이</option>
						<option value="">패키지</option>
						<option value="">기간제</option>
					</select>
				</div>
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>금액</strong></p>
				</label>
				<div class="col-sm-3">	
					<input type="text" class="form-control" id="cost" placeholder="">
				</div>
			
			</div>
		</div>
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>수업 개요</strong></p>
				</label>
				<div class="col-sm-8">
						<textarea class="form-control" id=""ClassForText"  cols="80" data-validation="required"
						placeholder="수업에 대한 설명을 써주세요" name="ClassForText" required="" rows="10">
						</textarea>
					</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>시작일</strong></p>
				</label>
				<div class="col-sm-3">	
					<input type="text" class="form-control" id="startDate" placeholder="">
				</div>
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>종료일</strong></p>
				</label>
				<div class="col-sm-3">	
					<input type="text" class="form-control" id="endDate" placeholder="">
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>시간표</strong></p>
				</label>
				<div class="col-sm-4">	
					<input type="text" class="form-control" id="timeTable" placeholder="">
				</div>
				<div>
					<button type="button" id="curriculumFileSearch" class="btn btn-primary">파일추가
					</button>
				</div>	
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<label class="control-label col-sm-2 " >
					<p align="right"><strong>커리큘럼</strong></p>
				</label>
				<div class="col-sm-4">	
					<input type="text" class="form-control" id="curriculum" placeholder="">
				</div>
				<div>
					<button type="button" id="curriculumFileSearch" class="btn btn-primary">파일추가
					</button>
				</div>
			</div>
		</div>
		
		
	<div>
	<br>
		
	<hr>
	<div class="col-sm-1">
		<button type="submit" class="btn btn-link">개설 완료</button>
	</div>
	<br> <br>
		</div>
	</div>
</div>