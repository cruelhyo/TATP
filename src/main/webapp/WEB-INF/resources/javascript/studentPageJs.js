/**
 * 
 */

$(document).ready(function(){
	$('.includePage').hide();
	$(function () {
	  	$('.navbar-toggle-sidebar').click(function () {
	  		$('.navbar-nav').toggleClass('slide-in');
	  		$('.side-body').toggleClass('body-slide-in');
	  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
	  	});
	
	  	$('#search-trigger').click(function () {
	  		$('.navbar-nav').removeClass('slide-in');
	  		$('.side-body').removeClass('body-slide-in');
	  		$('.search-input').focus();
	  	});
	  });
	  
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('hide')
		});
		
	$('#myTab a[href="#mypage"]').tab('show'); // Select tab by name
	$('#myTab a:first').tab('show'); // Select first tab
	$('#myTab a:last').tab('show'); // Select last tab
	$('#myTab li:eq(2) a').tab('show'); // Select third tab (0-indexed)
	
	$(function () {
	  $('#myTab a:last').tab('show')
	});
	
	//숨긴 includepage 해당 버튼 클릭시 보여주기
	$('#myPageShow').click(function(){
		$('.includePage').hide();
		$('#myPage2').show();
	});
	
	$('#myPointHistoryShow').click(function(){
		$('.includePage').hide();
		$('#myPointHistory').show();
	});

	$('#myAddressShow').click(function(){
		$('.includePage').hide();
		$('#myAddress').show();
	});
	
	$('#myPointShow').click(function(){
		$('.includePage').hide();
		$('#myPoint').show();
	});
	
	$('#myChangePWShow').click(function(){
		$('.includePage').hide();
		$('#myChangePW').show();
	});
	
	$('#modifiedMypageShow').click(function(){
		$('.includePage').hide();
		$('#modifiedMypage').show();
	});
	
	//memberUpdateFormForStuden js
	
	// 수정완료 버튼 비활성화 함수
	$('#updateMemberBtn').prop('disabled', true);
	
	$('#nkch1').text('닉네임 중복검사를 해주세요.');
	$('#nkch2').text('특수문자를 제외한 2-10자의 닉네임이 유효합니다.');
	$('#phch1').text(' - 를 제외하고 입력해주세요.');
	
	/* 
	 * 회원 정보 수정을 클릭시 나오는 인크루드 패이지 안에 있는 태그에 
	 * 회원 정보를 DB에서 가져와 뿌리는 함수
	 */
	function selectForUpdateMemberForStudent()
	{
		console.log("select for update member");
		// jsp에 히든으로 되어있는 input에 value값(jstl을 사용한 url)을 가져온다
		var ajaxSelectForUpdateMemberForStudent = $('#ajaxSelectForUpdateMemberForStudent').val();
		
		$.ajax(
		{
			url : ajaxSelectForUpdateMemberForStudent,
			
			// 성공하면 가져온 객체값들을 화면에 뿌려준다
			success : function(result)
			{
				console.log(result);
				$('#memberName').val(result.memberName);
				$('#memberNickname').val(result.memberNickname);
				if(result.memberGender == 'male')
				{
					$('.male').prop("checked", true);
				}
				else
				{
					$('.female').prop("checked", true);
				}
				$('#memberBirthday').val(result.memberBirthday);
				$('#memberPhone').val(result.memberPhone);
				$('#memberEmail').val(result.memberEmail);
				$('.memberMailNumber').val(result.memberMailNumber);
				$('.memberAddress').val(result.memberAddress);
			}
		});
	}
	selectForUpdateMemberForStudent();
	
	// 닉네임 입력창에 글자 입력될때마다 닉네임 유효성 검사
	$(".nickName").keyup(function()
	{
		var check = /^[a-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,10}$/; 
		var in_nickname = $('.NICKNAME').val();
		if(!check.test(in_nickname))
		{
			//닉네임이 유효하지 않을때 증복체크 버튼 disabled하기
			$("#nkch1").css("color", "#FF0000");
			$('#nkch1').text('사용이 불가능한 닉네임입니다.');
			$("#nickNameCheck").prop('disabled', true);
		}
		else
		{
			//닉네임이 유효할때 아이디 증복체크 버튼 active하기
			$("#nkch1").css("color", "#999900");
			$('#nkch1').text('닉네임 중복 검사가 필요합니다.');
			$('#nkch2').css('display','none');
			$("#nickNameCheck").prop('disabled', false);
		}
	 });
	
	// 닉네임 중복검사 버튼 클릭 시
	$(".nickNameCheck").click(function()
	{
		 /** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
		 */			 
		var ajaxNicknameCheck = $('#ajaxNicknameCheck').val();
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		$.ajax(
		{
			type : 'POST',
			url : ajaxNicknameCheck,
			data : $('#memberNickname').val(),
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(nickExist)
			{
				console.log(nickExist);
				if(nickExist)
				{	
					$("#nkch1").css("color", "#FF0000");
					$('#nkch1').text('이미 존재하는 닉네임입니다.');
				}
				else
				{
					$("#nkch1").css("color", "#009900");
					$('#nkch1').text('사용 가능한 닉네임입니다.');
					$('#updateMemberBtn').prop('disabled', false);
				}
			}				 
		});	
	});
	
	//전화번호 유효성검사 함수
	$(".phone").keyup(function()
	{
		var check = /^[0-9]{11,11}$/; 
		var in_phone = $('.phone').val();
		if(!check.test(in_phone))
		{
			$("#phch1").css("color", "#FF0000");
			$('#phch1').text('번호를 제대로 입력해 주세요');
			$('#updateMemberBtn').prop('disabled', true);
		}
		else
		{
			$('#phch1').css('display','none');
			$('#updateMemberBtn').prop('disabled', false);
		}
	 });
	
		
});