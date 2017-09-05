/**
 * 
 */

$(document).ready(function()
{
	
	$('.includePage').hide();
	$(function () 
	{
	  	$('.navbar-toggle-sidebar').click(function () 
	  	{
	  		$('.navbar-nav').toggleClass('slide-in');
	  		$('.side-body').toggleClass('body-slide-in');
	  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
	  	});
	
	  	$('#search-trigger').click(function () 
	  	{
	  		$('.navbar-nav').removeClass('slide-in');
	  		$('.side-body').removeClass('body-slide-in');
	  		$('.search-input').focus();
	  	});
	  });
	  
	$('#myTab a').click(function (e) 
	{
		  e.preventDefault()
		  $(this).tab('hide')
	});
		
	$('#myTab a[href="#mypage"]').tab('show'); // Select tab by name
	$('#myTab a:first').tab('show'); // Select first tab
	$('#myTab a:last').tab('show'); // Select last tab
	$('#myTab li:eq(2) a').tab('show'); // Select third tab (0-indexed)
	
	$(function () 
	{
	  $('#myTab a:last').tab('show')
	});
	
	//숨긴 includepage 해당 버튼 클릭시 보여주기
	$('#myPageShow').click(function(){
		$('.includePage').hide();
		$('#myPage').show();
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
	
	$('#myExchangeShow').click(function(){
		$('.includePage').hide();
		$('#myExchange').show();
	});
	
	$('#myAccountShow').click(function(){
		$('.includePage').hide();
		$('#myAccount').show();
	});
	
	$('#modifiedMypageShow').click(function(){
		$('.includePage').hide();
		$('#modifiedMypage').show();
	});
	
	
	// 주소추가폼 숨기기
	$('.add').hide();
	$('#plus').click(function(){
		$('.add').hide();
		$('#address1').show();
	});
	//주소추가하기 버튼 누르면 폼 다시 사라짐
	$('#plus2').click(function(){
		$('.add').hide();
	});

	// 환전내역 숨기기
	$('.ExchangeHistory').hide();
	$('#ExchangeView').click(function(){
		$('.ExchangeHistory').hide();
		$('#ExHistory').show();
	});
	
	//memberUpdateFormForTeacher js
	
	function selectForUpdateMember(){
		console.log("select for update member");
		var ajaxSelectForUpdateMember = $('#ajaxSelectForUpdateMember').val();
		$.ajax(
		{
			url : ajaxSelectForUpdateMember,
			
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
			}
			
		});
	}
	selectForUpdateMember();
	
	// 닉네임 입력창에 글자 입력될때마다 닉네임 유효성 검사
	$(".nickName").keyup(function()
	{
		var check = /^[a-z0-9]{2,10}$/; 
		 /* /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i; */
		var in_nickname = $('.NICKNAME').val();
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
	
});