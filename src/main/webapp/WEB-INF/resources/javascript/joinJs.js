/**
 * 
 */

$(document).ready(function()
	{
	
				
		//Initialize tooltips
		$('.nav-tabs > li a[title]').tooltip();
		
		// idCheck버튼 비활성화 (초기화때 사용)
		$(".idCheck").prop('disabled', true);
		/*$(".idCheck").attr('class','btn btn-primary idCheck disabled');       merge 할때 삭제 */ 
		
		// nicknameCheck버튼 비활성화 (초기화때 사용)
		$(".nicknameCheck").prop('disabled', true);
		/*$(".nicknameCheck").attr('class','btn btn-primary nicknameCheck disabled');*/
		

		// 회원가입 정보입력후 다음단계 버튼 비활성화 
		/*$(".next-step").prop('disabled', true);*/
		/*$(".next-step").attr('class','btn btn-primary next-step disabled');*/
		
		
		
		//Wizard
		$('a[data-toggle="tab"]').on('show.bs.tab', function(e)
		{
			var $target = $(e.target);

			if ($target.parent().hasClass('disabled'))
			{
				return false;
			}
		});
		
		
		//join 이용약관 비 활성화시 페이지 이동 block
		$(".next-step-agree").click(function(e)
		{
			console.log(".next-step-agree");
			
			if($("input:checkbox[id=agreeCheck]").is(":checked"))
			{
				$('#checkPlz').text('');
				var $active = $('.wizard .nav-tabs li.active');
				$active.next().removeClass('disabled');
				nextTab($active);
			}
			else
			{
				$("#checkPlz").css("color", "#FF0000");
				$('#checkPlz').text('이용약관에 동의해주세요.');
			}

		});
		
		
		/*//join 입력사항 비입력시  페이지 이동 block
		$(".next-step").click(function(e)
		{
			console.log("회원가입 정보 미기재시 페이지 block ");
			 if ($("#memberId").val() != '') {
					var $active = $('.wizard .nav-tabs li.active');
					$active.next().removeClass('disabled');
					nextTab($active);
						alert('아이디를 입력해주세요');
				 
			 }else{
				 alert('아이디를 입력해주세요');
			 }*/
			 
			/*if(memberId != null)
			{
				$('#checkPlz').text('');
				var $active = $('.wizard .nav-tabs li.active');
				$active.next().removeClass('disabled');
				nextTab($active);
			}
			else
			{
				$("#checkPlz").css("color", "#FF0000");
				$('#checkPlz').text('이용약관에 동의해주세요.');
			}
			 
		});*/
		
		
		
		
		$(".next-step").click(function(e)
		{
			console.log(".next-step");
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
				$(".idCheck").prop('disabled', true);
				/*$(".idCheck").attr('class','btn btn-primary idCheck disabled');*/
			}
			else
			{
				//아이디가 유효할때 아이디 증복체크 버튼 active하기
				$("#idch1").css("color", "#999900");
				$('#idch1').text('아이디 중복 검사가 필요합니다.');
				$('#idch2').css('display','none');
				$(".idCheck").prop('disabled', false);
				/*$(".idCheck").attr('class','btn btn-primary idCheck active');*/
			}
		 });
		
		
		// 아이디 중복검사 버튼 클릭 시
		$(".idCheck").click(function()
		{
			 /** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
			 */			 
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
		
		// 닉네임 중복검사 버튼 클릭 시
		$(".nicknameCheck").click(function()
		{
			 /** <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			 * POST 요청에 대해서 항상 csrf 토큰이 필요하다
			 */			 
			var ajaxnickNameCheck = $('#ajaxnickNameCheck').val();
			var csrfToken = $('#csrfToken').val();
			var csrfHeader = $('#csrfHeader').val();
			$.ajax(
			{
				type : 'POST',
				url : ajaxnickNameCheck,
				data : $('#memberNickname').val(),
				beforeSend : function(xhr) 
				{
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				success : function(nicknameExist)
				{
					console.log(nicknameExist);
					if(nicknameExist)
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
		
		//회원가입 - form에서 입력한 전체 값을 넘김(가입완료버튼 클릭시) 
		$("#submitBtn").click(function()
			{
			var ajaxinsertMember = $('#ajaxinsertMember').val();
			var csrfToken = $('#csrfToken').val();
			var csrfHeader = $('#csrfHeader').val();
			
			
			//form을 넘기기 위해 json serializeObject 기능구현을 위한 부분 
			$.fn.serializeObject = function(){
			    var o = {};
			    var a = this.serializeArray();
			    $.each(a, function() {
			    	var name = $.trim(this.name),
			    		value = $.trim(this.value);
			    	
			        if (o[name]) {
			            if (!o[name].push) {
			                o[name] = [o[name]];
			            }
			            o[name].push(value || '');
			        } else {
			            o[name] = value || '';
			        }
			    });
			    return o;
			};
					
		
			var formData = JSON.stringify($("#insertfrom").serializeObject()) ;
				
				$.ajax(
						{
		 					type : "POST",
		 					url : ajaxinsertMember,
		 					cache : false,
		 					

		 					data :formData, /*{ formData: JSON.stringify($("form").serializeObject()) },*/
		 						   beforeSend : function(xhr) 
		 					{
		 						xhr.setRequestHeader("Accept", "application/json");
		 						xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
		 						xhr.setRequestHeader(csrfHeader, csrfToken);
		 						
		 					},
		 					dataType:'json',
		 					success : function()
		 					{
		 						console.log("insert ajax호출");
		 					}
					 					
							});
									
			
		}); 
		
		
		// 닉네임 입력창에 글자 입력될때마다 닉네임 유효성 검사
		$(".memberNickname").keyup(function()
		{
			var check = /^[a-z0-9~!@#$%^*()\-_=+]{5,16}$/; 
			 /* /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i; */
			var in_nickname = $('#memberNickname').val();
			var temp = 0 ;
			if(!check.test(in_nickname))
			{
				//닉네임이 유효하지 않을때 증복체크 버튼 disabled하기
				$("#nkch1").css("color", "#FF0000");
				/* $("#nkch2").css("color", "#FF0000"); */
				$('#nkch1').text('사용이 불가능한 닉네임입니다.');
				$(".nicknameCheck").prop('disabled', true);
				/*$(".nicknameCheck").attr('class','btn btn-primary nicknameCheck disabled');*/
			}
			else
			{
				//닉네임이 유효할때 아이디 증복체크 버튼 active하기
				$("#nkch1").css("color", "#999900");
				$('#nkch1').text('닉네임 중복 검사가 필요합니다.');
				$(".nicknameCheck").prop('disabled', false);
				/*$(".nicknameCheck").attr('class','btn btn-primary nicknameCheck active');*/
			}
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
	    $("input:radio[name=memberGender]").click(function(){
	    	
	    	 /* 성별 체크박스 값을 받아오기위한 설정 */
	    	var gen = $(":input:radio[name=memberGender]:checked").val();
			
	    	$('input:radio[name=memberGender]:input[value=' + gen +']').attr("checked", true);
			
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
				   
				   