/**
 * 
 */

/*$(document).ready(function()
	{*/


	 function fileSubmit() {
		 var fileupurl = $('#fileupurl').val();
    	 var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val(); 
    	var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : "/fileUpload",
            data : formData,
             beforeSend : function(xhr) 
			{
            	
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(csrfHeader, csrfToken);
				alert("ajax호출");
			},  
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
	
				
	
	
		
		/*// 아이디 중복검사 버튼 클릭 시
		$(".idCheck").click(function()
		{
			
			 *//** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
			 *//*			 
			var ajaxIdCheck = $('#ajaxIdCheck').val();
			var csrfToken = $('#csrfToken').val();
			var csrfHeader = $('#csrfHeader').val();
			
			
			$.ajax(
			{
				type : 'POST',
				url : ajaxIdCheck,
				data : $('#memberId').val(),
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
						$("#idch1").css("color", "#FF0000");
						$('#idch1').text('이미 존재하는 아이디입니다.');
						$('#idch2').text('');
						$(".next-step").prop('disabled', true);
						
					}
					else
					{
						$("#idch1").css("color", "#009900");
						$('#idch1').text('사용 가능한 아이디입니다.');
						$('#idch2').text('');
						$(".next-step").prop('disabled', false);
					}
				}				 
			 }); 
			
		});*/
		
		
	/*});*/
				   
				   