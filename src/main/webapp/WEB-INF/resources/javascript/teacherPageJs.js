/**
 * 
 */

$(document).ready(function()
{
	
	$('.includePage').css('display', 'none');
	$('#modifiedMypage').css('display', '');
	selectForUpdateMember();
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
	
	//회원 정보 수정
	$('#myPageShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myPage').css('display', '');
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
	
	// 포인트 충전 내역
	$('#myPointHistoryShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myPointHistory').css('display', '');
		
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
	
	//내 주소록 보기
	$('#myAddressShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myAddress').css('display', '');
		selectAddressListForTeacher();
	});
	
	//포인트 충전하기
	$('#myPointShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myPoint').css('display', '');
		// 현재 포인트 가져오기 함수
		selectMemberPoint();
	});
	
	//비밀번호 변경
	$('#myChangePWShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myChangePW').css('display', '');
		// 변경버튼 disabled
		$('.submitChangePW').prop('disabled', true);
	});
	
	//환전하기
	$('#myExchangeShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#myExchange').css('display', '');
		// 현재 포인트 가져오기 함수
		selectMemberPoint();
	});
	
	//내 정보 전체보기
	$('#modifiedMypageShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#modifiedMypage').css('display', '');
		$('#memberNickname').text('test');
		selectForUpdateMember();
	});

	//포트폴리오 보기
	$('#portfolioShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#portfolio').css('display', '');
	});
	
	//이력서 등록
	$('#resumeShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#resume').css('display', '');
	});
	
	
	
	//강좌개설 보기
	$('#myClassShow').click(function(){
		$('.includePage').hide();
		$('#myClass').show();
	});
	
	//개설된 강좌 보기
	$('#classShowForStudentShow').click(function(){
		$('.includePage').hide();
		$('#classShowForStudent').show();
	});
	
	
	
	// 주소추가폼 숨기기
	$('.add').css('display', 'none');
	
	//---------------------- memberUpdateFormForTeacher js ----------------------------------------------------
	
	// 수정완료 버튼 비활성화 함수
	$('#updateMemberBtn').prop('disabled', true);
	
	$('#nkch1').text('닉네임 중복검사를 해주세요.');
	$('#nkch2').text('특수문자를 제외한 2-10자의 닉네임이 유효합니다.');
	$('#phch1').text(' - 를 제외하고 입력해주세요.');	
	
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
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(idExist)
			{
				console.log(idExist);
				if(idExist)
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
	
	//memberUpdateForm submit 함수
	$('#updateMemberBtn').click(function(){
		$('#updateForm').submit();
	});
	//-------------------- memberChangePassword js -----------------------------------------------
	
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
	
	//새 비밀번호 확인 일치여부 및 유효성 검사
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
	
	//-------------------- address js ------------------------------------------------------------
	
	
	// 주소리스트 받아오기
	function selectAddressListForTeacher()
	{	
		//url
		var selectAddressListForTeacher = $('#selectAddressListForTeacher').val();
		
		$.ajax({
			url : selectAddressListForTeacher,
			dataType : 'json',
			success : function(result)
			{
				// tbody 초기화
				$('#addressTBody').empty();
				//맵핑된 객체 가져오기
				resultList = result.addressList;
				//객체의 숫자 만큼 돌린다
				$.each(resultList, function(index, value)
				{
					$('#addressTBody').append(
							'<tr><td>' + value.addressClassificationName + 
							'</td><td>' + value.addressMailNumber +
							'</td><td>' + value.memberAddress +
							'</td><td><div><ul class="list-inline">' +
							'<li><button type="button" class="btn btn-primary btn-xs" id="del" value="'+ value.addressNo +'">삭제' +
							'</button></li></ul></div></td>' +
							'<td><div><ul class="list-inline"><li>' +
							'<button type="button" class="btn btn-default btn-xs" id="edit" value="'+ value.addressNo +'">수정' +
							'</button></li></ul></div></td></tr>' 
					);
				});
			}
		});
	}
	
	//주소 추가하기 클릭시
	$('.submitInsertAddress').click(function()
	{
		//url
		var ajaxInsertAddressForTeacher = $('#ajaxInsertAddressForTeacher').val();
		//csrf
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		
		//폼 값 맵핑
		$.fn.serializeObject = function()
		{
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
		
		//폼 object화
		var formData = $("#addressForm").serializeObject();
		console.log(formData);
		$.ajax(
		{
			type : 'POST',
			url : ajaxInsertAddressForTeacher,
			data : JSON.stringify(formData),
			dataType:'json',
			//Accept, Content-Type, csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(result)
			{
				
				console.log(result);
				
				if(result == 0)
				{
					alert('각 항목을 제대로 입력해주세요.');
				}
				
				// 주소리스트 셀렉트 함수를 날려 결과를 보여준다
				selectAddressListForTeacher();
			}
		});
		
	});
	
	//주소 수정하기 클릭시
	$('.submitUpdateAddress').click(function()
	{
		
		//url
		var ajaxupdateAddressForTeacher = $('#ajaxupdateAddressForTeacher').val();
		//csrf token
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		
		//폼에서 입력한 값들을 name을 기준으로 맵핑
		$.fn.serializeObject = function()
		{
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
		//폼에서 입력한 값들 object화
		var formData = $("#addressForm").serializeObject();
		console.log(formData);
		
		$.ajax({
			type : 'POST',
			url : ajaxupdateAddressForTeacher,
			//formData를 json규격에 맞춤
			data : JSON.stringify(formData),
			dataType : 'json',
			//header에 accept, context type그리고 csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			//성공하면 result값을 따져서 alert창을 띄운다
			success : function(result)
			{
				
				console.log(result);
				
				if(result == 0)
				{
					alert('각 항목을 제대로 입력해주세요.');
				}
				// 주소리스트 셀렉트 함수를 날려 결과를 보여준다
				selectAddressListForTeacher();
			}
		});
	});
	
	//주소 삭제버튼 클릭시
	$('div').on('click', '#del', function()
	{
		//url
		var ajaxDeleteAddressForTeacher = $('#ajaxDeleteAddressForTeacher').val();
		//csrf
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		//value에 담겨있는 addressNo를 가져온다
		var addressNo = $(this).val();
		
		$.ajax({
			type : 'POST',
			url : ajaxDeleteAddressForTeacher,
			data : addressNo,
			//header에 accept, context type그리고 csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(result)
			{
				console.log(result);
			}
		});
		// 주소리스트 셀렉트 함수를 날려 결과를 보여준다
		selectAddressListForTeacher();
	});
	
	// 주소추가폼 보이기
	$('div').on('click', '#plus', function(){
		//폼 숨기기
		$('.add').css('display', 'none');
		$('#address1').css('display', '');
		//포커싱
		$('#addressClassificationNo').focus();
		//추가하기 버튼 보이기
		$('.submitInsertAddress').css('display', '');
		//수정하기 버튼 숨기기
		$('.submitUpdateAddress').css('display', 'none');
		//폼 초기화
		$('#addressForm')[0].reset();
	});
	
	//주소수정폼 보이기
	$('div').on('click', '#edit', function(){
		//value에 있는 addressNo를 가져온다
		var addressNo = $(this).val();
		$('.addressNoInForm').val(addressNo);
		$('.add').css('display', 'none');
		$('#address1').css('display', '');
		//포커싱
		$('#addressClassificationNo').focus();
		//추가하기 버튼 숨기기
		$('.submitInsertAddress').css('display', 'none');
		//수정하기 버튼 보이기
		$('.submitUpdateAddress').css('display', '');
		//폼 초기화
		$('#addressForm')[0].reset();
	});
	
	//주소추가하기 버튼 누르면 폼 다시 사라짐
	$('#plus2').click(function(){
		$('.add').css('display', 'none');
	});
	$('#plus3').click(function(){
		$('.add').css('display', 'none');
	});

	//-------------------------------- myPoint js ---------------------------------------
	
	function selectMemberPoint()
	{
		//url
		var ajaxSelectMemberPoint = $('#ajaxSelectMemberPoint').val();
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
	
	//-------------------------------- pointExchange js ----------------------------------------
	
	
	//포인트 환전 내역 보기 js
	function selectPontExchangeList()
	{
		//url
		var ajaxSelectPointExchangeList = $('#ajaxSelectPointExchangeList').val();
		$.ajax(
		{
			url : ajaxSelectPointExchangeList,
			dataType : 'json',
			success : function(result)
			{
				// tbody 초기화
				$('#exchangeTBody').empty();
				// 맵핑된 객체 가져오기
				resultList = result.pointExchangeList;
				
				$.each(resultList, function(index, value)
				{
					$('#exchangeTBody').append(
							'<tr><td>●</td><td>' + value.pointExchangePoint +
							'</td><td>' + value.pointExchangeMoney +
							'</td><td>' + value.pointExchangeDate +
							'</td></tr>'
					);
				});
			}
		});
	}
	
	// 환전내역 숨김과 동시에 환전 폼도 숨겨줍니다
	$('.ExchangeHistory').css('display', 'none');
	$('.ExchangePointForm').css('display', 'none');
	
	// 환전 내역 보이면서 환전 폼 숨기기
	$('#ExchangeView').click(function(){
		selectPontExchangeList();
		$('#ExHistory').css('display', '');
		$('.ExchangePointForm').css('display', 'none');
	});
	
	//환전 폼 보이면서 환전 내역 숨기기
	$('#Exchange').click(function(){
		$('.ExchangePointForm').css('display', '');
		$('#ExHistory').css('display', 'none');
	});
	
	//포인트 환전하기 js
	$('.submitChangePoint').click(function()
	{
		var ajaxInsertPointExchangeHistory = $('#ajaxInsertPointExchangeHistory').val();
		//csrf
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		
		//폼에서 입력한 값들을 name을 기준으로 맵핑
		$.fn.serializeObject = function()
		{
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
		//폼에서 입력한 값들 object화
		var formData = $("#ExchangePointForm").serializeObject();
		console.log(formData);
		$.ajax(
		{
			type : 'POST',
			url : ajaxInsertPointExchangeHistory,
			data : JSON.stringify(formData),
			dataType : 'json',
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(result)
			{
				console.log(result);
				if(result == 0) {
					alert('환전에 실패하였습니다. 숫자만 입력하시거나 고객센터에 문의해주세요.')
					$('#pointExchangePoint').val('');
				}
				alert('환전이 완료되었습니다.')
				$('#pointExchangePoint').val('');
			}
		});
	});
	
	//-----------------------------myAccount js -----------------------------------------
	
	//계좌관리
	$('#myAccountShow').click(function(){
		$('.includePage').css('display', 'none');
		
		var ajaxSelectTeacherAccountNo = $('#ajaxSelectTeacherAccountNo').val();
		$.ajax(
		{
			url : ajaxSelectTeacherAccountNo,
			success : function(result)
			{
				if(result == null)
				{
					$('#updateAccount').css('display', 'none');
					$('#insertAccount').css('display', '');
				}
				$('.bankNoUpdate').val(result.bankNo);
				$('.accountHolderNameUpdate').val(result.accountHolderName);
				$('.accountNumberUpdate').val(result.accountNumber);
				$('#insertAccount').css('display', 'none');
				$('#updateAccount').css('display', '');
			}
		});
		
		$('#myAccount').css('display', '');
	});
	
	//---------------------- resumeView js -----------------------------------------------------------
	
	//학력, 경력 리스트 select하는 함수
	function selectTeacherEduCrList()
	{
		//url
		var ajaxSelectTeacherEduCrList = $('#ajaxSelectTeacherEduCrList').val();
		
		$.ajax(
		{
			url : ajaxSelectTeacherEduCrList,
			dataType : 'json',
			success : function(result)
			{
				console.log(result);
				//tbody 초기화
				$('#teacherEduTbody').empty();
				$('#teacherCareerTbody').empty();
				
				//맵핑된 객체 변수 지정
				educationList = result.teacherEduList;
				careerList = result.teacherCrList;
				
				$.each(educationList, function(index, value)
				{
					$('#teacherEduTbody').append(
							'<tr><td>' + value.teacherEducationClassificationName +
							'</td><td>' + value.teacherEducationStatusName +
							'</td><td>' + value.teacherEducationSchoolName +
							'</td><td>' + value.teacherEducationMajor + 
							'</td><td>' + value.teacherEducationAdmission +
							'</td><td>' + value.teacherEducationGraduation +
							'</td><td><button type="button" class="btn btn-default btn-sm"  data-toggle="modal" data-target="#modiEduListModal" id="modiEduList"' + 
							'value="'+ value.teacherEducationNo +'">수정</button>' +
							'</td><td><button type="button" class="btn btn-default btn-sm" id="delEduList"' +
							'value="'+ value.teacherEducationNo +'">삭제</button></td></tr>'
					);
					
				});
				
				$.each(careerList, function(index, value)
				{
					$('#teacherCareerTbody').append(
							'<tr><td>' + value.teacherCareerCompany +
							'</td><td>' + value.teacherCareerDepartment + 
							'</td><td>' + value.teacherCareerPosition +
							'</td><td>' + value.teacherCareerEmploymentDate +
							'</td><td>' + value.teacherCareerLeaveDate +
							'</td><td><button type="button" class="btn btn-default btn-sm"  data-toggle="modal" data-target="#modiTeacherCrModal" id="modiCrList"' +
							'value="'+ value.teacherCareerNo +'">수정</button>' +
							'</td><td><button type="button" class="btn btn-default btn-sm" id="delCrList"' +
							'value="'+ value.teacherCareerNo +'">삭제</button></td></tr>'
					);
				});
			}
		});
	};
	
	//경력 보기
	$('#resumeViewShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#resumeView').css('display', '');
		
		selectTeacherEduCrList();
	});
	//학력보기teacherEduMadal
	$('#teacherEduMadalShow').click(function(){
		$('.includePage').css('display', 'none');
		$('#teacherEduMadal').css('display', '');
		
		selectTeacherEduCrList();
	});
	
	$('div').on('click', '#modiEduList', function()
	{
		console.log('학력 수정');
		//수정 버튼에 지정한 teacherEducationNo를 가져와서 폼안에 있는 히튼박스의 val로 지정해준다
		var teacherEduNo = $(this).val();
		$('#teacherEduNo').val(teacherEduNo);
		console.log(teacherCrNo);
		
		$('#modiEduListModal').css('display','');
		
		//submit 버튼의 val값을 변경해준다
		$('.submitBtn').val(0);
		$('#updateTeacherEdu').val(1);
	});
	
	$('div').on('click', '#modiCrList', function()
	{
		console.log('경력 수정');
		//수정 버튼에 지정한 teacherEducationNo를 가져와서 폼안에 있는 히든박스의 val로 지정해준다
		var teacherCrNo = $(this).val();
		$('#teacherCrNo').val(teacherCrNo);
		console.log(teacherCrNo);
		
		$('#modiTeacherCrModal').css('display','');
		
		//submit 버튼의 val값을 변경해준다
		$('.submitBtn').val(0);
		$('#updateTeacherCr').val(1);
	});
	
	// 추가하기 버튼이나 수정 버튼을 클릭하면 submit 버튼의 val값을 바꿔서 ajax실행전 if문을 이용해 url을 구분해서 실행한다
	
	//학력추가하기 버튼 클릭시
	$('#addTeacherEduBtn').click(function()
	{
		$('.submitBtn').val(0);
		$('#insertTeacherEdu').val(1);
		$('#addTeacherEduForm')[0].reset();
	});
	
	//경력 추가하기 버튼 클릭시
	$('#addTeacherCrBtn').click(function()
	{
		$('.submitBtn').val(0);
		$('#insertTeacherCr').val(1);
		$('#addTeacherCrForm')[0].reset();
	});
	
	
	//폼 submit 클릭시 실행하는 함수
	$('.submitBtn').click(function()
	{
		//폼에서 입력한 값들을 name을 기준으로 맵핑
		$.fn.serializeObject = function()
		{
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
		
		var url = null
		var formData = null
		
		//버튼의 val 값을 비교하여 url과 formData를 지정한다
		if($('#insertTeacherEdu').val() == 1)
		{
			console.log('학력 정보 입력');
			//url
			url = $('#ajaxInsertTeacherEducation').val();
			//폼에서 입력한 값들 object화
			formData = $("#addTeacherEduForm").serializeObject();
			console.log(formData);
		}
		else if($('#insertTeacherCr').val() == 1)
		{
			console.log('경력 정보 입력');
			//url
			url = $('#ajaxInsertTeacherCareer').val();
			//폼에서 입력한 값들 object화
			formData = $("#addTeacherCrForm").serializeObject();
			console.log(formData);
		}
		else if($('#updateTeacherEdu').val() == 1)
		{
			console.log('학력 정보 수정');
			//url
			url = $('#ajaxUpdateTeacherEducation').val();
			//폼에서 입력한 값들 object화
			formData = $("#modiTeacherEduForm").serializeObject();
			console.log(formData);
		}
		else if($('#updateTeacherCr').val() == 1)
		{
			console.log('경력 정보 수정');
			//url
			url = $('#ajaxUpdateTeacherCareer').val();
			//폼에서 입력한 값들 object화
			formData = $("#modiTeacherCrForm").serializeObject();
			console.log(formData);
		}
		
		//csrf token
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		
		console.log(formData);

		$.ajax({
			type : 'POST',
			url : url,
			//formData를 json규격에 맞춤
			data : JSON.stringify(formData),
			dataType : 'json',
			//header에 accept, context type그리고 csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			//성공하면 result값을 따져서 alert창을 띄운다
			success : function(result)
			{
				
				console.log(result);
				
				if(result == 0)
				{
					alert('각 항목을 제대로 입력해주세요.');
				}
				$('#addTeacherEduForm').css('display', 'none');
				$('.submitBtn').val(0);
				// 학력, 경력 리스트 셀렉트 함수를 날려 결과를 보여준다
				selectTeacherEduCrList();
			}
		});
	});
	
	

	
	
	//학력 정보 삭제
	$('div').on('click', '#delEduList', function()
	{
		//url
		var ajaxDeleteTeacherEducation = $('#ajaxDeleteTeacherEducation').val();
		//csrf
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		//value에 담겨있는 addressNo를 가져온다
		var teacherEducationNo = $(this).val();
		
		$.ajax({
			type : 'POST',
			url : ajaxDeleteTeacherEducation,
			data : teacherEducationNo,
			//header에 accept, context type그리고 csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(result)
			{
				console.log(result);
			}
		});
		// 주소리스트 셀렉트 함수를 날려 결과를 보여준다
		selectTeacherEduCrList();
	});
	
	//경력 정보 삭제
	$('div').on('click', '#delCrList', function()
	{
		//url
		var ajaxDeleteTeacherCareer = $('#ajaxDeleteTeacherCareer').val();
		//csrf
		var csrfToken = $('#csrfToken').val();
		var csrfHeader = $('#csrfHeader').val();
		//value에 담겨있는 addressNo를 가져온다
		var teacherCareerNo = $(this).val();
		
		$.ajax({
			type : 'POST',
			url : ajaxDeleteTeacherCareer,
			data : teacherCareerNo,
			//header에 accept, context type그리고 csrf를 먼저 보낸다
			beforeSend : function(xhr) 
			{
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success : function(result)
			{
				console.log(result);
			}
		});
		// 주소리스트 셀렉트 함수를 날려 결과를 보여준다
		selectTeacherEduCrList();
	});
	
});