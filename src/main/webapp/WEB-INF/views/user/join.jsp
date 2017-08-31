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
		
		
		// ID입력창에 글자 입력될때마다 id유효성 검사
		$(".ID").keyup(function()
		{
			var check = /^[a-z0-9]{6,16}$/; 
			var in_id = $('#memberId').val();
			var temp = 0 ;
			if(!check.test(in_id))
			{
				//아이디가 유효하지 않을때 증복체크 버튼 disabled하기
				$("#idch1").css("color", "#FF0000");
				$("#idch2").css("color", "#FF0000");
				$('#idch1').text('사용이 불가능한 아이디입니다.');
				$('#idch2').text('(영문,숫자조합 6자이상)');
				$(".idCheck").attr('class','btn btn-primary idCheck disabled');
			}
			else
			{
				//아이디가 유효할때 아이디 증복체크 버튼 active하기
				$("#idch1").css("color", "#999900");
				$('#idch1').text('아이디 중복 검사가 필요합니다.');
				$('#idch2').text('');
				$(".idCheck").attr('class','btn btn-primary idCheck active');
			}
		 });
		
		
		// 아이디 중복검사 버튼 클릭 시
		$(".idCheck").click(function()
		{
			 /** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
			 */			 
			 $.ajax(
			{
				 type : 'POST',
				 url : "<c:url value='/ajax/idCheck'/>",
				 data :{
					 'memberId':$('#memberId').val(),
					 '${_csrf.parameterName}':'${_csrf.token}'  /* security url POST요청 승인하는 토큰 추가함  */
					 }, 
				success : function(idExist)
				{
					console.log(idExist);
					if(idExist)
					{	
						$("#idch1").css("color", "#FF0000");
						$('#idch1').text('이미 존재하는 아이디입니다.');
						$('#idch2').text('');
					}
					else
					{
						$("#idch1").css("color", "#009900");
						$('#idch1').text('사용 가능한 아이디입니다.');
						$('#idch2').text('');
					}
				}				 
			 });	
			
		});
		
		
		// 닉네임 입력창에 글자 입력될때마다 닉네임 유효성 검사
		$(".nickName").keyup(function()
		{
			var check = /^[a-z0-9~!@#$%^*()\-_=+]{5,16}$/; 
			 /* /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i; */
			var in_nickname = $('#NICKNAME').val();
			var temp = 0 ;
			if(!check.test(in_nickname))
			{
				//닉네임이 유효하지 않을때 증복체크 버튼 disabled하기
				$("#nkch1").css("color", "#FF0000");
				/* $("#nkch2").css("color", "#FF0000"); */
				$('#nkch1').text('사용이 불가능한 닉네임입니다.');
				$(".nicknameCheck").attr('class','btn btn-primary nicknameCheck disabled');
			}
			else
			{
				//닉네임이 유효할때 아이디 증복체크 버튼 active하기
				$("#nkch1").css("color", "#999900");
				$('#nkch1').text('닉네임 중복 검사가 필요합니다.');
				$(".nicknameCheck").attr('class','btn btn-primary nicknameCheck active');
			}
		 });
		
		
		
		// 닉네임 중복검사 버튼 클릭 시
		$(".NICKNAME").click(function()
		{
			 /** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
			 */			 
			 $.ajax(
			{
				 type : 'POST',
				 url : "<c:url value='/ajax/nicknameCheck'/>",
				 data :{
					 'membernickname':$('#memberNickname').val(),
					 '${_csrf.parameterName}':'${_csrf.token}'  /* security url POST요청 승인하는 토큰 추가함  */
					 }, 
				success : function(idExist)
				{
					console.log(idExist);
					if(idExist)
					{	
						$("#nkch1").css("color", "#FF0000");
						$('#nkch1').text('이미 존재하는 닉네임입니다.');
						$('#nkch2').text('');
					}
					else
					{
						$("#nkch1").css("color", "#009900");
						$('#nkch1').text('사용 가능한 닉네임입니다.');
						$('#nkch2').text('');
					}
				}				 
			 });	
			
		});
		
		// pw입력시 유효성 검사
		$('.PW').keyup(function()
		{
			var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i;
			var in_pw = $('#PW').val();
			if(!check.test(in_pw))
			{
				//비번이 유효하지 않을때
				$('#pwch1').css('color', '#FF0000');
				$('#pwch2').css('color', '#FF0000');
				$('#pwch1').text('비밀번호가 유효하지 않습니다.');
				$('#pwch2').text('(영문,숫자,특수문자조합 8자이상)');
			}
			else
			{
				//비번이 유효할때
				$('#pwch1').css("color", "#008000");
				$('#pwch1').text('비밀번호를 사용 가능합니다');
				$('#pwch2').text('');
			}
		});
					
			 		
			 
		$('.PW2').keyup(function()
		{
			var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i;
			var in_pw = $('#PW').val();
			var in_pw2 = $('#PW2').val();
			var temp = 0;
			if(!check.test(in_pw2))
			{
				temp = 0; //비번이 유효하지 않을때
			} 
			else 
			{
				temp = 1; //비번이 유효할때
			}
			
			if(temp == 1)
			{
				if(in_pw == in_pw2)
				{
            		$('#pwch3').css('color', '#008000');
            		$('#pwch3').text('비밀번호가 일치합니다');
            	}
				else
				{
            		$('#pwch3').css('color', '#FF0000');
            		$('#pwch3').text('비밀번호가 불일치합니다');
            		$('#pwch3').val('');
        			$('#pwch3').focus();
            	}
			}
			else
			{
				$('#pwch3').css('color', '#FF0000');
				$('#pwch3').text('비밀번호가 유효하지 않습니다');
			}
				
			// 비밀번호 1,2 일치여부 확인 
		});
			 
		
		
		
		 /* -------------------------------------------------------------------------------  */
		 
		 
			     /* 성별 radio 체크 클릭시 값을 받아오는 동작수행 */
	    $("input:radio[name=gender]").click(function(){
	    	
	    	 /* 성별 체크박스 값을 받아오기위한 설정 */
	    	var gen = $(":input:radio[name=gender]:checked").val();
			
	    	$('input:radio[name=gender]:input[value=' + gen +']').attr("checked", true);
			
			if(gen == "male"){
				console.log("male");
			}else{
				 console.log("female");
			}

	    	
	    }); 
	     
	     
	    /* 메일수신동의여부 체크 클릭시 값을 받아오는 동작수행 */
	    $("input:radio[name=mailagreement]").click(function(){
	    	
	    	 /* 메일수신동의여부 체크박스 값을 받아오기위한 설정 */
	    	var mailagree = $(":input:radio[name=mailagreement]:checked").val();
			
	    	$('input:radio[name=mailagreement]:input[value=' + mailagree +']').attr("checked", true);
			
			if(mailagree == "y"){
				console.log("yes");
			}else{
				 console.log("no");
			}

	    	
	    }); 
			
		 

		function nextTab(elem) {
			$(elem).next().find('a[data-toggle="tab"]').click();
		}
		function prevTab(elem) {
			$(elem).prev().find('a[data-toggle="tab"]').click();
		}
	});
</script>
<!-- 우편번호 찾기 api  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode()
    {
        new daum.Postcode(
        {     
            oncomplete: function(data)
            {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') 
                { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } 
                else 
                { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R')
                {
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== '')
                    {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== '')
                    {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }

    
    /* $(".mailNumberSearch").click(function(e) {

	console.log("mailNumberSearch");
	 우편번호 찾기 api 호출 ( 로직 추가할 공간)   ---구현중--- 

}); */
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
											<label class="control-label col-sm-3 " for="memberId">
												<p align="right">
													<strong>아이디</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control ID " id="memberId"
													placeholder="아이디 입력" name="memberId">
													<span id="idch1"></span><br>
													<span id="idch2"></span>												
												<input type="hidden" value="0" id="use_id" name="use_id">
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
											<label class="control-label col-sm-3 " for="PW">
												<p align="right">
													<stong>비밀번호</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="password" class="form-control PW" id="PW"
													placeholder="비밀번호 입력" name="memberPw">
												<input type="hidden" value="0" id="use_pw" name="use_pw">
												<span id="pwch1"></span><br>
												<span id="pwch2"></span>
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
												<input type="password" class="form-control PW2" id="PW2"
													placeholder="비밀번호 재입력" name="memberPw2">
												<input type="hidden" value="0" id="use_pw2" name="use_pw2">
												<span id="pwch3"></span>
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
												<label class="control-label col-sm-3 " for="NICKNAME">
													<p align="right">
														<strong>닉네임</strong>
													</p>
												</label>
												<div class="col-sm-3">
													<input type="text" class="form-control nickName " id="memberNickname"
														placeholder="닉네임 입력" name="memberNickname">
														<span id="nkch1"></span><br>
														<span id="nkch2"></span>												
													<input type="hidden" value="0" id="use_nickname" name="use_nickname">
												</div>
											<br>
									
									<div class="col-sm-2">
												<button type="button" class="btn btn-primary nicknameCheck">
													중복 검사</button>
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
												&nbsp;&nbsp; <input type="radio" name="gender" value="female">Female
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
												<select name="visa_status_day" id="visa_status_day"
													class="dropselectsec1">
													<option value="">일</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
												</select>
											</div>
											<div class="col-sm-2 wdth">
												<select name="visa_status_month" id="visa_status_month"
													class="dropselectsec1">
													<option value="">월</option>
													<option value="1">01</option>
													<option value="2">02</option>
													<option value="3">03</option>
													<option value="4">04</option>
													<option value="5">05</option>
													<option value="6">06</option>
													<option value="7">07</option>
													<option value="8">08</option>
													<option value="9">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<div class="col-sm-2 wdth">
												<select name="visa_status_year" id="visa_status_year"
													class="dropselectsec1">
													<option value="">년</option>
													<option value="80">1980</option>
													<option value="81">1981</option>
													<option value="82">1982</option>
													<option value="83">1983</option>
													<option value="84">1984</option>
													<option value="85">1985</option>
													<option value="86">1986</option>
													<option value="87">1987</option>
													<option value="88">1988</option>
													<option value="89">1989</option>
													<option value="90">1990</option>
													<option value="91">1991</option>
													<option value="92">1992</option>
													<option value="93">1993</option>
													<option value="94">1994</option>
													<option value="95">1995</option>
													<option value="96">1996</option>
													<option value="97">1997</option>
													<option value="98">1998</option>
													<option value="99">1999</option>
													<option value="00">2000</option>
													<option value="01">2001</option>
													<option value="02">2002</option>
													<option value="03">2003</option>
													<option value="04">2004</option>
													<option value="05">2005</option>
													<option value="06">2006</option>
													<option value="07">2007</option>
													<option value="08">2008</option>
													<option value="09">2009</option>
													<option value="10">2010</option>													
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
												<input type="text" class="form-control" id="sample6_postcode"
													placeholder="우편번호" name="member_address">
													
											</div>
											<div class="col-sm-2">
												<!-- <button type="button" class="btn btn-default mailNumberSearch">우편번호 검색</button> -->
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
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
												<input type="text" class="form-control" id="sample6_address"
													placeholder="상세주소" name="member_address_detail">
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
												<input type="radio" name="mailagreement" value="y">예 
												<input type="radio" name="mailagreement" value="n">아니오<br>
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