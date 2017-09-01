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
	
	$('#myPageShow').click(function()
	{
		$('.includePage').hide();
		$('#myPage').show();
	});
	
	$('#myPointShow').click(function()
	{
		$('.includePage').hide();
		$('#myPoint').show();
	});
	
	$('#myChangePWShow').click(function()
	{
		$('.includePage').hide();
		$('#myChangePW').show();
	});
	
	//memberUpdateForm js
	
	/*$('#myPageShow').click(function(){
		console.log("select for update member");
		
		$.ajax({
			url : '<c:url value="/teacher/teacherPage/selectForUpdateMember"/>'
			
		});
	});*/
	
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