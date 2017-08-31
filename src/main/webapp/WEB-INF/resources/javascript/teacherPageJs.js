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
	$('#updateMemberBtn').click(function()
	{
		var updateMemberForm = $('#updateForm').serialize();
		$.ajax({
			type : 'POST',
			url : '<c:url value="/ajax/updateMember"/>',
			data : updateMemberForm,
			dataType : json,
			success : function(updateMemberResult)
			{
				console.log(updateMemberResult);
			}
		});
	});
	
	
});