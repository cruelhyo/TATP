<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-sm-8">
	<div class="step_21">
		<h2 align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="#5F5F5F">My Class</font>
		</h2>
	<hr>
		<div class="row">
					<div class="form-group">
						<dl class="dl-horizontal">
							<dt>수업제목</dt>
							<dd>개나 소나 하는 드로잉</dd>
							<br>
							<dt>수강인원</dt>
							<dd>최대 5명</dd>
							<br>
							<dt>카테고리</dt>
							<dd>미술 / 드로잉</dd>
							<br>
							<dt>수업종류</dt>
							<dd>원데이</dd>
							<br>
							<dt>수업금액</dt>
							<dd>50,000원</dd>
							<br>
							<dt>수업일자</dt>
							<dd>시작시간/종료시간</dd>
							<br>
							<dt>수업개요</dt>
							<dd><span class="col-sm-10 step_21">
							<br>
							본래 뜻은 '연필이나 펜, 붓같은 그리개 등을 어떤 대상 위[1]에서 끌어서[2]선 
							등을 그리다'에 가깝다. 본래의 '끈다'는 뜻이 '그림을 그리다'의 뜻으로 파생된 것이라고 볼 수 있다. 
							펜이나 연필로 스케치하거나 그 수준을 넘어서서, 명암이나 색칠까지 하는 기법을 통틀어 지칭하는 것을 말한다.
							주로 정물화나 사물이나 인체를 그릴 때 많이 사용하는 기법으로서 미술학원 등에서 스케치북 위에 연필이나 펜으로 그리는 것을 말한다. 
							자세한 것은 소묘, 스케치 등을 참조. 스케치는 단순히 선이나 빠르게 간략히 그린 기법이고, 소묘는 선을 그리고 그 이후에 명암을 
							덧그리거나, 더 나아가서 간단한 채색까지 덧그리는 기법을 말한다.
							과거에는 캔버스에 물감으로 그림을 그리기 전 구상, 즉 에스키스 정도의 단계였다. 하지만 점점 드로잉 그 자체가 작업으로 인정 받아 
							작품이 되는 경우가 많다. 
							드로잉 작품들만을 전시하는 전시도 늘어나고 있는 추세.
							<br>
							<br>
							</span></dd>
							<br>
							<dt>시간표보기</dt>
							<dd><botton type="button" class="btn btn-primary btn-xs">시간표보기</botton></dd>
							<br>
							<dt>커리큘럼보기</dt>
							<dd><botton type="button" class="btn btn-primary btn-xs">커리큘럼보기</botton></dd>
							<br>
							<dt>관련 포트폴리오</dt>
							<dd><section>
							<div class="form-group">
								<div class="portfolio-thumbnail-represent-container col-sm-3" style="margin-top:40px;">
								<div class="portfolio-thumbnail" data-category-id="2" data-id="5168" data-subcategory-id="211" 
								data-type="represent" style="margin-top: 0;">
								<a href="">
								<img class="portfolio-thumbnail-image" style="width: 142px;" src="https://static.pexels.com/photos/402023/pexels-photo-402023.jpeg">
								</a>
								<div class="portfolio-thumbnail-caption-top">
								<a class="portfolio-thumbnail-caption-top-title" href="" style="width: 142px;">7. BMW Global</a>
								</div>
								</div>
								</div>
								<div class="portfolio-thumbnail-represent-container col-sm-3" style="margin-top:40px;">
								<div class="portfolio-thumbnail" data-category-id="2" data-id="5168" data-subcategory-id="211" 
								data-type="represent" style="margin-top: 0;">
								<a href="">
								<img class="portfolio-thumbnail-image"  style="width: 142px;"src="https://static.pexels.com/photos/402023/pexels-photo-402023.jpeg">
								</a>
								<div class="portfolio-thumbnail-caption-top">
								<a class="portfolio-thumbnail-caption-top-title" href="" style="width: 142px;">7. BMW Global</a>
								</div>
								</div>
								</div>
								<div class="portfolio-thumbnail-represent-container col-sm-3" style="margin-top:40px;">
								<div class="portfolio-thumbnail" data-category-id="2" data-id="5168" data-subcategory-id="211" 
								data-type="represent" style="margin-top: 0;">
								<a href="">
								<img class="portfolio-thumbnail-image" style="width: 142px;" src="https://static.pexels.com/photos/402023/pexels-photo-402023.jpeg">
								</a>
								<div class="portfolio-thumbnail-caption-top">
								<a class="portfolio-thumbnail-caption-top-title" href="" style="width: 142px;">7. BMW Global</a>
								</div>
								</div>
								</div>
							</div>
							</section></dd>
						</dl>
					</div>
				</div>
				<br>
				<br>
				<hr>
<!-- ----------------------------------------------강좌 수정 모달 시작부분 ---------------------------------------------- -->
			<!-- modal btn -->
			<form id= classModiForm>
			<div id="classModi">
				<div class="control-label col-sm-12">
					<p align="right">
						<button type="submit" class="btn btn-default"
							id="classModiBtn" value=0 data-toggle="modal"
							data-target="#classModiModal">수정하기</button>
					</p>
				</div>
			</div>
			<hr>
			<!-- modal효과-->
			<div class="modal fade" id="classModiModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modified</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>수업 제목</strong>
										</p>
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="schoolname"
											placeholder="">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>수강인원</strong>
										</p>
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="majorname"
											placeholder="">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>카테고리</strong>
										</p>
									</label>
									<div class="col-sm-3">
										<select class="dropselects100">
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
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>세부카테고리</strong>
										</p>
									</label>
									<div class="col-sm-1">
										<select class="dropselects100">
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
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>수업종류</strong>
										</p>
									</label>
									<div class="col-sm-3" id="">
										<select class="dropselects100">
											<option value="">종류선택</option>
											<option value="">원데이</option>
											<option value="">패키지</option>
											<option value="">기간제</option>
										</select>
									</div>
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>금액</strong>
										</p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="cost"
											placeholder="">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>수업 개요</strong>
										</p>
									</label>
									<div class="col-sm-8">
										<textarea class="form-control" id="" ClassForText"  cols="80"
											data-validation="required" placeholder="수업에 대한 설명을 써주세요"
											name="ClassForText" required="" rows="10">
										</textarea>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>시작일</strong>
										</p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="startDate"
											placeholder="">
									</div>
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>종료일</strong>
										</p>
									</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="endDate"
											placeholder="">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>시간표</strong>
										</p>
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="timeTable"
											placeholder="">
									</div>
									<div>
										<button type="button" id="curriculumFileSearch"
											class="btn btn-primary">파일추가</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group">
									<label class="control-label col-sm-2 ">
										<p align="right">
											<strong>커리큘럼</strong>
										</p>
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="curriculum"
											placeholder="">
									</div>
									<div>
										<button type="button" id="curriculumFileSearch"
											class="btn btn-primary">파일추가</button>
									</div>
								</div>
							</div>
						</div>
						<!-- modal 입력완료버튼 -->
						<div class="modal-footer">
							<button type="button"
								class="btn btn-default submitInsertTeacherEdu"
          				data-dismiss="modal" id="insertTeacherEdu"
								value="<c:url value='/ajax/insertTeacherEducation'/>">수정완료</button>
						</div>
					</div>
				</div>
			</div>
</form>
				<br>
				<br>
				<br>
				
	</div>
</div>
