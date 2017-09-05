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
		
		function selectForUpdateMemberForStudent()
		{
			console.log("select for update member");
			var ajaxSelectForUpdateMemberForStudent = $('#ajaxSelectForUpdateMemberForStudent').val();
			
			$.ajax(
			{
				url : ajaxSelectForUpdateMemberForStudent,
				
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
					$('#memberMailNumber').val(result.memberMailNumber);
					$('#memberAddress').val(result.memberAddress);
				}
			});
		}
		selectForUpdateMemberForStudent();
		
});