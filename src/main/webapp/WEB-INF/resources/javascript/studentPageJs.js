/**
 * 
 */

$(document).ready(function(){
	$('.includePage').hide();
	$('#modifiedMypage').show();
	selectForUpdateMember();
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
	
	//회원정보수정
	$('#myPageShow').click(function(){
		$('.includePage').hide();
		$('#myPage2').show();
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
	});
	//포인트 충전내역보기
	$('#myPointHistoryShow').click(function(){
		$('.includePage').hide();
		$('#myPointHistory').show();
		
		//url
		var ajaxSelectPointHistoryList = $('#ajaxSelectPointHistoryList').val();
		
		$.ajax(
		{
			url : ajaxSelectPointHistoryList,
			dataType : 'json',
			success : function(result)
			{
				console.log(result);
				//tbody 초기화
				$('#pointTBody').empty();
				//맵핑된 객체 가져오기
				resultList = result.pointList;
				//객체의 숫자 만큼 돌린다
				$.each(resultList, function(index, value)
				{
					$('#pointTBody').append(
							'<tr><td></td><td>' + value.pointChargeMoney +
							'</td><td>' + value.pointChargePoint +
							'</td><td>' + value.pointChargeDate +
							'</td></tr>'
					);
				});
			}
		});
	});
	
	//포인트 충전하기
	$('#myPointShow').click(function(){
		$('.includePage').hide();
		$('#myPoint').show();
		//현재포인트 가져오는 함수 호출
		selectMemberPoint();
	});
	
	//비밀번호 바꾸기
	$('#myChangePWShow').click(function(){
		$('.includePage').hide();
		$('#myChangePW').show();
	});
	//내 기본 정보 보기
	$('#modifiedMypageShow').click(function(){
		$('.includePage').hide();
		$('#modifiedMypage').show();
		selectForUpdateMember();
	});
	//강사신청 보기
	$('#applyFormShow').click(function(){
		$('.includePage').hide();
		$('#applyForm').show();
	});
	
//------------------------------ memberUpdateFormForStuden js ------------------------------------------------
	
	// 수정완료 버튼 비활성화 함수
	$('#updateMemberBtn').prop('disabled', true);
	
	$('#nkch1').text('닉네임 중복검사를 해주세요.');
	$('#nkch2').text('특수문자를 제외한 2-10자의 닉네임이 유효합니다.');
	$('#phch1').text(' - 를 제외하고 입력해주세요.');
	
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
	
//------------------------ memberChangePassword js ------------------------------------
	
	//입력해야할 것을 입력하면 submit 버튼 활성화 함수
	function checksubmit() 
	{
		var pwcheck1 = $('#pwcheck1').val();
		var pwcheck3 = $('#pwcheck3').val();
		var checkResult = $('#checkResult').val();
		if(pwcheck1 == 0 || pwcheck3 == 0 || checkResult == 0)
		{
			$('.submitChangePW').prop('disabled', true);
		}
		else
		{
			$('.submitChangePW').prop('disabled', false);
		}
	}
	
	// pw입력시 유효성 검사
	$('.changePW1').keyup(function()
	{
		var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i;
		var in_pw = $('.changePW1').val();
		if(!check.test(in_pw))
		{
			//비번이 유효하지 않을때
			$('#pwcheck1').css('color', '#FF0000');
			$('#pwcheck2').css('color', '#FF0000');
			$('#pwcheck1').text('비밀번호가 유효하지 않습니다.');
			$('#pwcheck2').text('영문,숫자,특수문자조합 8자이상 20이내입니다');
			$('#pwcheck1').val(0);
			$(".next-step").prop('disabled', true);
			checksubmit();
		}
		else
		{
			//비번이 유효할때
			$('#pwcheck1').css('color', '#008000');
			$('#pwcheck1').text('비밀번호를 사용 가능합니다');
			$('#pwcheck1').val(1);
			$('#pwcheck2').css('display', 'none');
			checksubmit();
		}
	});
	
	// 새 비밀번호 확인 일치여부 및 유효성 검사
	$('.changePW2').keyup(function()
	{
		var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/i;
		var in_pw = $('.changePW1').val();
		var in_pw2 = $('.changePW2').val();
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
        		$('#pwcheck3').css('color', '#008000');
        		$('#pwcheck3').text('비밀번호가 일치합니다');
        		$('#pwcheck3').val(1);
        		checksubmit();
        	}
			else
			{
        		$('#pwcheck3').css('color', '#FF0000');
        		$('#pwcheck3').text('비밀번호가 불일치합니다');
        		$('#pwcheck3').val(0);
    			$('#pwcheck3').focus();
    			checksubmit();
        	}
		}
		else
		{
			$('#pwcheck3').css('color', '#FF0000');
			$('#pwcheck3').text('비밀번호가 유효하지 않습니다');
			$('#pwcheck3').val(0);
			checksubmit();
			
		}
	});
	
	// 현재 비밀번호 일치여부
	$('.passwordCheck').click(function()
	{
		var ajaxCheckMemberPassword = $('#ajaxCheckMemberPassword').val();
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		$.ajax(
		{
			type : 'POST',
			url : ajaxCheckMemberPassword,
			data : $('#nowPW').val(),
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(checkResult)
			{
				console.log(checkResult);
				if(checkResult)
				{
					$('#checkResult').text('비밀번호 검사를 통과하셨습니다');
					$('#checkResult').val(1);
					checksubmit();
				}
				else
				{
					$('#checkResult').text('비밀번호가 정확하지 않습니다');
					$('#checkResult').val(0);
					checksubmit();
				}
				
				
			}
		});
	});

//------------------------------------- myPoint js ---------------------------------------
	
	
	function selectMemberPoint()
	{
		//url
		var ajaxSelectMemberPoint = $('#ajaxSelectMemberPoint').val();
		//현재 포인트 가져오는 함수
		$.ajax(
		{
			url : ajaxSelectMemberPoint,
			success : function(result)
			{
				console.log(result);
				$('#memberPoint').val(result);
				$('.memberExchange').val(result);
			}
		});
	}
	
//--------------------------- modifiedMypage js --------------------------------------------
	
	function selectForUpdateMember()
	{
		console.log("select for update member");
		var ajaxSelectForUpdateMember = $('#ajaxSelectForUpdateMember').val();
		$.ajax(
		{
			url : ajaxSelectForUpdateMember,
			
			success : function(result)
			{
				console.log(result);
				$('.memberName').text(result.memberName);
				$('.memberNickname').text(result.memberNickname);
				$('.memberGender').text(result.memberGender);
				if(result.memberGender == 'male')
				{
					$('.memberGender').text('남성');
				}
				else
				{
					$('.memberGender').text('여성');
				}
				$('.memberBirthday').text(result.memberBirthday);
				$('.memberPhone').text(result.memberPhone);
				$('.memberEmail').text(result.memberEmail);
			}
			
		});
	}
});