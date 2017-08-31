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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	

<script>
	$(document).ready(function()
	{
		//Initialize tooltips
		$('.nav-tabs > li a[title]').tooltip();
		
		// idCheck버튼 비활성화
		$(".idCheck").attr('class','btn btn-primary idCheck disabled');
		
		//Wizard
		$('a[data-toggle="tab"]').on('show.bs.tab', function(e)
		{
			var $target = $(e.target);

			if ($target.parent().hasClass('disabled'))
			{
				return false;
			}
		});

		$(".next-step").click(function(e)
		{
			var $active = $('.wizard .nav-tabs li.active');
			$active.next().removeClass('disabled');
			nextTab($active);

		});
		
		$(".prev-step").click(function(e)
		{
			var $active = $('.wizard .nav-tabs li.active');
			prevTab($active);

		});
		
		/* <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> */
		
		
		$(".ID").keypress(function()
		{
			var check = /^[a-z0-9]{6,16}$/; 
			var in_id = $('#memberId').val();
			var temp = 0 ;
			if(!check.test(in_id))
			{
				//아이디가 유효하지 않을때
				$("#idch").css("color", "#FF0000");
				$('#idch').text('사용이 불가능한 아이디입니다.');
			}
			else
			{
				//아이디가 유효할때 아이디 증복체크 버튼 active하기
				$("#idch").css("color", "#999900");
				$('#idch').text('아이디 중복 검사가 필요합니다.');
				$(".idCheck").attr('class','btn btn-primary idCheck active');
			}
		 });
		
		$(".idCheck").click(function() {
			 console.log("idCheck");
			 /* id 중복검사 로직 추가할 공간  controller호출 로직  */
			 
			 $.ajax({
				 type : 'POST',
				 url : "<c:url value='/ajax/idCheck'/>",
				 data :{
					 'memberId':$('#memberId').val(),
					 '${_csrf.parameterName}':'${_csrf.token}'  /* security url block 해제하는 토큰 추가함  */
					 },
				success : function(idExist)
				{
					console.log(idExist);
					if(idExist)
					{
						$("#idch").css("color", "#FF0000");
						$('#idch').text('이미 존재하는 아이디입니다.');
					}
					else
					{
						$("#idch").css("color", "#009900");
						$('#idch').text('사용 가능한 아이디입니다.');
					}
				}				 
			 });	
			
		});
		
	
		
		
		/*--------------------------------------------------------------------------------------------------  */
		
		
			 $(".PW").keypress(function() {
				 var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
				 var in_pw = $('#PW').val();
					if(!check.test(in_pw)){
						//비번이 유효하지 않을때
						$("#pwch").css("color", "#FF0000");
						$('#pwch').text('비밀번호가 유효하지 않습니다');
					} else {
						//비번이 유효할때
						$("#pwch").css("color", "#008000");
						$('#pwch').text('비밀번호를 사용 가능합니다');
					}
			 });
					
			 		
			 
			 $('.PW2').keypress(function(){
					var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
					var in_pw = $('#PW').val();
					var in_pw2 = $('#PW2').val();
					var temp = 0;
					if(!check.test(in_pw2)){
						temp = 0; //비번이 유효하지 않을때
					} else {
						temp = 1; //비번이 유효할때
					}
					if(temp == 1){
						if(in_pw == in_pw2){
		            		$('#pwch2').css('color', '#008000');
		            		$('#pwch2').text('비밀번호가 일치합니다');
		            	}else{
		            		$('#pwch2').css('color', '#FF0000');
		            		$('#pwch2').text('비밀번호가 불일치합니다');
		            		$('#pwch2').val('');
		        			$('#pwch2').focus();
		            	}
					}else{
						$('#pwch2').css('color', '#FF0000');
						$('#pwch2').text('비밀번호가 유효하지 않습니다');
					}
					
					// 비밀번호 1,2 일치여부 확인 
					
			 });
			 
		
		
		
		 /* -------------------------------------------------------------------------------  */
		 
		 
		/* $(".mailNumberSearch").click(function(e) {

			console.log("mailNumberSearch");
			 우편번호 찾기 api 호출 ( 로직 추가할 공간)   ---구현중--- 

		}); */
			
		 

		function nextTab(elem) {
			$(elem).next().find('a[data-toggle="tab"]').click();
		}
		function prevTab(elem) {
			$(elem).prev().find('a[data-toggle="tab"]').click();
		}
	});
</script>


</head>
<body>
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
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
									<div class="step_21">
										<div role="tabpanel" class="tab-pane fade in activ" id="myAgree">
											<jsp:include page="../include/agree.jsp" flush="true"></jsp:include>
										</div>
										
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
											<label class="control-label col-sm-4 " for="memberId">
												<p align="right">
													<strong>아이디</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control ID " id="memberId"
													placeholder="아이디 입력" name="memberId">
													<span id="idch"><input type="hidden" value="0" id="use_id" name="use_id"></span>
											</div>
											
											<div class="col-sm-2">
												<button type="button" class="btn btn-primary idCheck">
													중복 검사</button>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="PW">
												<p align="right">
													<stong>비밀번호</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control PW" id="PW"
													placeholder="비밀번호 입력" name="memberPw">
											</div>
											<span id="pwch"><input type="hidden" value="0" id="use_pw" name="use_pw"></span>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="PW">
												<p align="right">
													<stong>비밀번호 확인</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control PW2" id="PW2"
													placeholder="비밀번호 재입력" name="memberPw2">
											</div>
											<span id="pwch2"><input type="hidden" value="0" id="use_pw2" name="use_pw2"></span>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="name">
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
											<label class="control-label col-sm-4" for="gender">
												<p align="right">
													<stong>성별</stong>
												</p>
											</label>
											<div class="col-sm-8">
												<input type="radio" name="gender" value="male"> Male
												&nbsp;&nbsp; <input type="radio" name="gender" value="female">Female
											</div>       
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="birth">
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
											<label class="control-label col-sm-4 " for="adress">
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
											<label class="control-label col-sm-4" for="adress">
												<p align="right">
													<stong>상세주소</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="ID"
													placeholder="상세주소" name="member_address_detail">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="phone">
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
											<label class="control-label col-sm-4" for="email">
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
											<label class="control-label col-sm-4" for="emailcheck">
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
								<br>
									<div class="row mar_ned col-sm-5"></div>
									<div align="left" ><h3>추가 입력 사항</h3></div>
									<hr>
										
										<div class="row">
										<div class="form-group ">
											<label class="control-label col-sm-4 " for="nickname">
												<p align="right">
													<strong>닉네임</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control ID " id="nickname"
													placeholder="닉네임 입력" name="nickname">
													
											</div>
											
											<div class="col-sm-2">
												<button type="button" class="btn btn-primary idCheck">
													중복 검사</button>
											</div>
										</div>
									</div>
									<br>
									
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="gender">
												<p align="right">
													<stong>관심사</stong>
												</p>
											</label>
											<div class="col-sm-8">
												<input type="radio" name="hobby" value="hobby"> 외국어&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 운동&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 독서&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 예술&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 기타&nbsp;&nbsp;
												<p>(선택사항입니다.)</p>
											</div>       
										</div>
									</div>

									<hr>
									<div class="row mar_ned"></div>
									<div class="row mar_ned"></div>







									

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
									<div class="step33">
										<br>
										<h5 align="center"> take a talent에 가입을 완료하시겠습니까?</h5>
										<br>
									</div>
									<br>
									<ul class="list-inline pull-right">
										<li>
											<button type="button" class="btn btn-primary next-step"><a href="<c:url value='/userlogin'/>">가입 완료</a>
											</button>
										</li>
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