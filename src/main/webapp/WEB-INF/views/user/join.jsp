<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Take A Talent</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		//Initialize tooltips
		$('.nav-tabs > li a[title]').tooltip();

		//Wizard
		$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {

			var $target = $(e.target);

			if ($target.parent().hasClass('disabled')) {
				return false;
			}
		});

		$(".next-step").click(function(e) {

			var $active = $('.wizard .nav-tabs li.active');
			$active.next().removeClass('disabled');
			nextTab($active);

		});
		$(".prev-step").click(function(e) {

			var $active = $('.wizard .nav-tabs li.active');
			prevTab($active);

		});
	});

	function nextTab(elem) {
		$(elem).next().find('a[data-toggle="tab"]').click();
	}
	function prevTab(elem) {
		$(elem).prev().find('a[data-toggle="tab"]').click();
	}
</script>


</head>
<body>
	<!--top-->
	<div >
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>


	</nav>
	<!-- 회원가입폼 -->

	<div class="container">
		<div class="row">
			<section>
			<div class="wizard">
				<div class="wizard-inner">
					<div class="connecting-line"></div>
					<ul class="nav nav-tabs" role="tablist">

						<li role="presentation" class="active"><a href="#step1"
							data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-folder-open"></i>
							</span>
						</a></li>

						<li role="presentation" class="disabled"><a href="#step2"
							data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-pencil"></i>
							</span>
						</a></li>
						<li role="presentation" class="disabled"><a href="#step3"
							data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
								<span class="round-tab"> <i
									class="glyphicon glyphicon-picture"></i>
							</span>
						</a></li>

						<li role="presentation" class="disabled"><a href="#complete"
							data-toggle="tab" aria-controls="complete" role="tab"
							title="Complete"> <span class="round-tab"> <i
									class="glyphicon glyphicon-ok"></i>
							</span>
						</a></li>
					</ul>
				</div>

				<form role="form">
					<div class="tab-content">
						<div class="tab-pane active" role="tabpanel" id="step1">
							<div class="step1">
								<div class="step_11">
									<div class="row"></div>
								</div>
								<div class="step-12"></div>
							</div>
							<ul class="list-inline pull-right">
								<li><button type="button" class="btn btn-default prev-step">Previous</button></li>
								<li><button type="button" class="btn btn-primary next-step">다음단계</button></li>
							</ul>
						</div>
						<div class="tab-pane" role="tabpanel" id="step2">
							<div class="step2">
								<div class="step_21">

									<h2 align="center">Member Join form</h2>
									<hr>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3 " for="ID">
												<p align="right">
													<strong>아이디</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control" id="ID"
													placeholder="아이디 입력" name="member_id">
											</div>
											<div class="col-sm-2">
												<button type="button" class="btn btn-default">
													중복 검사</button>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3 " for="PW">
												<p align="right">
													<stong>비밀번호</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="PW"
													placeholder="비밀번호 입력" name="member_pw">
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3 " for="PW">
												<p align="right">
													<stong>비밀번호 확인</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="PW"
													placeholder="비밀번호 재입력" name="member_pw">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3 " for="name">
												<p align="right">
													<stong>이름</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="name"
													placeholder="이름 입력">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="gender">
												<p align="right">
													<stong>성별</stong>
												</p>
											</label>
											<div class="col-sm-8">
												<input type="radio" name="gender" value="male"> Male
												&nbsp;&nbsp; <input type="radio" name="gender"
													value="female">Female
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="birth">
												<p align="right">
													<stong>생년월일</stong>
												</p>
											</label>
											<div class="col-sm-2 wdth">
												<select name="visa_status" id="visa_status"
													class="dropselectsec1">
													<option value="">일</option>
													<option value="2">1</option>
													<option value="1">2</option>
													<option value="4">3</option>
													<option value="5">4</option>
													<option value="6">5</option>
													<option value="3">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
												</select>
											</div>
											<div class="col-sm-2 wdth">
												<select name="visa_status" id="visa_status"
													class="dropselectsec1">
													<option value="">월</option>
													<option value="2">01</option>
													<option value="1">02</option>
													<option value="4">03</option>
													<option value="5">04</option>
													<option value="6">05</option>
													<option value="3">06</option>
													<option value="7">07</option>
													<option value="8">08</option>
													<option value="9">09</option>
												</select>
											</div>
											<div class="col-sm-2 wdth">
												<select name="visa_status" id="visa_status"
													class="dropselectsec1">
													<option value="">년</option>
													<option value="2">1990</option>
													<option value="1">1991</option>
													<option value="4">1992</option>
													<option value="5">1993</option>
													<option value="6">1994</option>
													<option value="3">1995</option>
													<option value="7">1996</option>
													<option value="8">1997</option>
													<option value="9">1998</option>
												</select>
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3 " for="adress">
												<p align="right">
													<strong>주소</strong>
												</p>
											</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="adress"
													placeholder="우편번호" name="">
											</div>
											<div class="col-sm-2">
												<button type="submit" class="btn btn-default">동 검색</button>
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="adress">
												<p align="right">
													<stong>상세주소</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="ID"
													placeholder="상세주소" name="member_id">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="phone">
												<p align="right">
													<stong>핸드폰</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="phone"
													placeholder="번호입력" name="">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="email">
												<p align="right">
													<stong>이메일</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" name="specialization" id="specialization"
													placeholder="메일주소 입력" class="dropselectsec1">
												<stong>&nbsp;@</stong>
												<select name="year_of_passedout" id="year_of_passedout"
													class="birthdrop">
													<option value="">직접입력</option>
													<option value="1">직접입력</option>
													<option value="2">직접입력</option>
												</select>
											</div>
										</div>
									</div>
								<br>
										
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-3" for="emailcheck">
												<p align="right">
													<stong>정보 수신 메일 동의</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<stong>다음 사이트에서 제공하는 메일을 받아보시겠습니까?</stong>
												&nbsp; 
												<input type="radio" name="yes" value="y">예 
												<input type="radio" name="no" value="n">아니오<br>
											</div>
										</div>
									</div>
								<br>
								<hr>
								</div>
							</div>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-primary next-step">다음 단계</button></li>
								</ul>
							</div>
							<div class="tab-pane" role="tabpanel" id="step3">
								<div class="step33">
									<div class="row mar_ned"></div>
									<p align="left">추가 입력 사항</p>

									<hr>
									<div class="row mar_ned"></div>
									<div class="row mar_ned"></div>







									<hr>

								</div>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">이전 단계</button></li>

									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">계속하기</button></li>
								</ul>
							</div>
							<div class="tab-pane" role="tabpanel" id="complete">
								<div class="step44">
									<h5>complete</h5>

									<ul class="list-inline pull-right">
										<li><button type="button"
												class="btn btn-primary next-step">가입 완료</button></li>
									</ul>


								</div>
							</div>
							<div class="clearfix"></div>
						</div>
				</form>
			</div>
			</section>
		</div>
	</div>
</body>
</html>