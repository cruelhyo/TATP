<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Take A Talent</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<c:url value='/resources/javascript/joinJs.js'/>"></script>
<!-- 우편번호 찾기 api  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/resources/javascript/findAddressJs.js'/>"></script>

</head>
<body>
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	<!-- 회원가입폼 -->
	<input type="hidden" id="ajaxIdCheck" value="<c:url value='/ajax/idCheck'/>">
	<input type="hidden" id="ajaxnickNameCheck" value="<c:url value='/ajax/nickNameCheck'/>">
	<input type="hidden" id="ajaxinsertMember" value="<c:url value='/ajax/insertMember'/>">
	<div class="container">
		<div class="row">
			<section>
			<div class="wizard">
				<div class="wizard-inner">
					<div class="connecting-line"></div>
					<ul class="nav nav-tabs" role="tablist">

						<li role="presentation" class="active">
							<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
								<span class="round-tab"> 
									<i class="glyphicon glyphicon-folder-open"></i>
								</span>
							</a>
						</li>

						<li role="presentation" class="disabled">
							<a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
								<span class="round-tab"> 
									<i class="glyphicon glyphicon-pencil"></i>
								</span>
							</a>
						</li>
						<li role="presentation" class="disabled">
							<a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
								<span class="round-tab"> 
									<i class="glyphicon glyphicon-picture"></i>
								</span>
							</a>
						</li>
						<li role="presentation" class="disabled">
							<a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
								<span class="round-tab"> 
									<i class="glyphicon glyphicon-ok"></i>
								</span>
							</a>
						</li>
					</ul>
				</div>
				
	<form role="form" name="insertfrom" id="insertfrom" action="" method="post" >
					<div class="tab-content">
						<div class="tab-pane active" role="tabpanel" id="step1">
							<div class="step1">
								<div class="step_11">
									<div class="row"></div>
								</div>
									<div class="step_21">
										<div role="tabpanel" class="tab-pane fade in activ" id="myAgree">
											<jsp:include page="../include/agree.jsp" flush="true"></jsp:include>
										</div>
									</div>
								<div class="step-12"></div>
							</div>
							<ul class="list-inline pull-right">
								<li><button type="button" class="btn btn-primary next-step-agree">다음단계</button></li>
							</ul>
						</div>
						<div class="tab-pane" role="tabpanel" id="step2">
							<div class="step2">
								<div class="step_21">

									<h2 align="center">Member Join form</h2>
									<hr>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="memberId">
												<p align="right">
													<strong>아이디</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control ID " id="memberId" placeholder="아이디 입력" name="memberId">
													<span id="idch1"></span>
													<br>
													<span id="idch2"></span>												
												<input type="hidden" value="0" id="use_id" name="use_id">
												<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
												<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
											</div>
											
											<div class="col-sm-2">
												<button type="button" class="btn btn-primary idCheck">
													중복 검사
												</button>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="PW">
												<p align="right">
													<stong>비밀번호</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="password" class="form-control PW" id="PW" placeholder="비밀번호 입력" name="memberPassword">
												<input type="hidden" value="0" id="use_pw" name="use_pw">
												<span id="pwch1"></span>
												<br>
												<span id="pwch2"></span>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="PW">
												<p align="right">
													<stong>비밀번호 확인</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="password" class="form-control PW2" id="PW2" placeholder="비밀번호 재입력" name="memberPasswordre">
												<input type="hidden" value="0" id="use_pw2" name="use_pw2">
												<span id="pwch3"></span>
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="name">
												<p align="right">
													<stong>이름</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름 입력">
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="gender">
												<p align="right">
													<stong>성별</stong>
												</p>
											</label>
											<div class="col-sm-8">
												<input type="radio" id="memberGender" name="memberGender" value="male"> Male
												&nbsp;&nbsp; 
												<input type="radio" id="memberGender" name="memberGender" value="female"> feMale
											</div>       
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="birth">
												<p align="right">
													<stong>생년월일</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="memberBirthday" name="memberBirthday" placeholder="ex) 1994-11-08">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="adress">
												<p align="right">
													<strong>주소</strong>
												</p>
											</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" name="memberAddress">
											</div>
											<div class="col-sm-2">
												<!-- <button type="button" class="btn btn-default mailNumberSearch">우편번호 검색</button> -->
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="adress">
												<p align="right">
													<stong>상세주소</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="sample6_address" placeholder="상세주소" name="memberAddressDetail">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="phone">
												<p align="right">
													<stong>핸드폰</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="memberPhone" placeholder="ex) 01012345678" name="memberPhone">
											</div>
										</div>
									</div>
									<br>

									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="email">
												<p align="right">
													<stong>이메일</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="ex) abc123@naver.com">
											</div>
										</div>
									</div>
								<br>
										
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="emailcheck">
												<p align="right">
													<stong>정보 수신 메일 동의</stong>
												</p>
											</label>
											<div class="col-sm-5">
												<stong>다음 사이트에서 제공하는 메일을 받아보시겠습니까?</stong>
												&nbsp; 
												<input type="radio" id="mailagreement" name="mailagreement" value="y">예 
												<input type="radio" id="mailagreement" name="mailagreement" value="n">아니오<br>
											</div>
										</div>
									</div>
								<br>
								<hr>
								</div>
							</div>
								<ul class="list-inline pull-right">
									<li><button type="button" class="btn btn-default prev-step">이전 단계</button></li>
									<li><button type="button" class="btn btn-primary next-step" >다음 단계</button></li>
								</ul>
								
								
							</div>
							<div class="tab-pane" role="tabpanel" id="step3">
								<div class="step33">
								<br>
									<div class="row mar_ned col-sm-5"></div>
									<div align="left" ><h3>추가 입력 사항</h3></div>
									<hr>
										
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4 " for="nickname">
												<p align="right">
													<strong>닉네임</strong>
												</p>
											</label>
											<div class="col-sm-3">
												<input type="text" class="form-control memberNickname " id="memberNickname" placeholder="닉네임 입력" name="memberNickname">
												<span id="nkch1"></span>
												<br>
												<span id="nkch2"></span>
												<input type="hidden" value="0" id="use_nickname" name="use_nickname">
												<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
												<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>			
											</div>
											
											<div class="col-sm-2">
												<button type="button" class="btn btn-primary nicknameCheck">
													중복 검사</button>
											</div>
										</div>
									</div>
									<br>
									
									<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-4" for="gender">
												<p align="right">
													<stong>관심사</stong>
												</p>
											</label>
											<div class="col-sm-8">
												<input type="radio" name="hobby" value="hobby"> 외국어&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 운동&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 독서&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 예술&nbsp;&nbsp;
												<input type="radio" name="hobby" value="hobby"> 기타&nbsp;&nbsp;
												<p>(선택사항입니다.)</p>
											</div>       
										</div>
									</div>

									<hr>
									<h5 align="center"> take a talent에 가입을 완료하시겠습니까?</h5>
									<div class="row mar_ned"></div>
									<div class="row mar_ned"></div>
								</div>
								<ul class="list-inline pull-right">
									
									<li><button type="button"
											class="btn btn-default prev-step">이전 단계</button></li>

									<li>
									<button type="button" id ="submitBtn"class="btn btn-primary btn-info-full next-step">계속하기</button>
									<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
									<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
									</li>
								
								</ul>
							</div>
							<div class="tab-pane" role="tabpanel" id="complete">
								<div class="step44">
									<div class="step33">
										<br>
										<h5 align="center"> take a talent에 가입이 완료 되었습니다.</h5>
										<br>
										
									</div>
									<br>
									<ul class="list-inline pull-right">
										<li>
											<button type="button" class="btn btn-link">
												<a href="<c:url value='/userlogin'/>">로그인</a>
											</button>
										</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
				</form>
			</div>
			</section>
		</div>
	</div>
</body>
</html>