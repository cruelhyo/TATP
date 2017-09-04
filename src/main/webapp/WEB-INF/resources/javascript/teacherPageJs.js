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
	
	$('#portfolioShow').click(function(){
		$('.includePage').hide();
		$('#portfolio').show();
	});
	
	$('#myAccountShow').click(function(){
		$('.includePage').hide();
		$('#myAccount').show();
	});
	
	//portfoio
	  
	     
	$('.gallery-item').magnificPopup({
		type: 'image',
			gallery:{
				enabled:true
					}
	});
	        
	// MixItUp 2
		$('#container').mixItUp();
	    
	
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
	
	//memberUpdateForm js
	
	$('#myPageShow').click(function()
	{
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
	});
	
	//url ?뒤에 있는 파라미터 값을 가져오는 함수
	function getQuerystring(paramName)
	{ 
		var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기 
		
		for(var i = 0; _tempArray.length; i++) 
		{ 
			var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
			
			// _keyValuePair[0] : 파라미터 명			
			if(_keyValuePair[0] == paramName)
			{
				return _keyValuePair[1]; // _keyValuePair[1] : 파라미터 값
			}
		}
	}
	
	//getQuerystring 함수를 이용해 파라미터 값을 가져온다
	var updateSuccess = getQuerystring('updateSuccess');
	// 파라미터 값이 0 혹은 1이면
	if(updateSuccess == 1 || updateSuccess == 0)
	{
		//아래의 함수를 실행한다
		$('.includePage').hide();
		$('#myPage').show();
	}
	
});