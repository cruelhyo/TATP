<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/mapage.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/join.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/classSearch.css'/>" type="text/css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>search Class</title>

<script>
	
</script>
</head>

<body>
	<!-- top 인클루드 -->
	<div>
		<jsp:include page="../include/top.jsp" flush="true"></jsp:include>
	</div>
	
	
	<!--search class form -->
	
<nav class="searchBox">
 <div class="container-fluid">
  
    <form class="navbar-form navbar-right" role="search">
        <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="Search..">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      </form>
 </div>
 
</nav>
<br>
<div class="container-fluid text-center">    
  <div class="row">
    <div class="col-sm-2">
    	<div class="well" style="border: none; radius: 0;">
    		<p align="left" style="">
				<font size="3" color="#80B2D2" face="나눔고딕">&nbsp;&nbsp;강좌 정렬</font></p>
    		<hr style=" border:  solid 1px white;">
      		<div class="row" align="left">
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;높은금액</label>&nbsp;&nbsp; 
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;낮은금액</label>
      		</div>
      		<br>
      		<div class="row" align="left">
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신규등록</label>&nbsp;&nbsp;
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마감임박</label>
      		</div>
     		 
     	</div>
    
    	<div class="well" style="border: none; radius: 0;">
    		<p align="left">
    			<font size="3" color="#80B2D2" face="나눔고딕">&nbsp;&nbsp;강좌 카테고리</font></p>
    		<hr style=" border:  solid 1px white;">
    		<div>
    			<ul align="left"><label data-toggle="collapse" data-target="#demo1"><input type="checkbox">음악</label>
      				<div id="demo1" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				악기
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				작곡/작사
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				보컬/국악/성악/실용
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				디제잉
                 			</label>
           				</li>
           			</div>
           			
				</ul>
				<ul align="left"><label data-toggle="collapse" data-target="#demo2"><input type="checkbox">미술/사진</label>
      				<div id="demo2" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				아동미술
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				성인미술
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				사진
                 			</label>
           				</li>
           			</div>
           			
				</ul>
				<ul align="left"><label data-toggle="collapse" data-target="#demo3"><input type="checkbox">공예,프라모델,3D프린팅</label>
      				<div id="demo3" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				DIY/수공예
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				프라모델/피규어/Doll
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				3D프린팅
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				드론/RC/H.W제작
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo4"><input type="checkbox">스포츠/댄스</label>
      				<div id="demo4" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				레져/실외
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				실내
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				헬스/다이어트
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				댄스스포츠/밸리댄스
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				발레/현대/한국
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				실용댄스
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo5"><input type="checkbox">요리/주류/바리스타</label>
      				<div id="demo5" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				한식/중식/일식/양식
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				제과/제빵
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				주류/바리스타
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				집밥/자취/기타
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo6"><input type="checkbox">문학/인문학/외국어</label>
      				<div id="demo6" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				작문
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				인문학
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				외국어
                 			</label>
           				</li>
           			</div>
           			
				</ul>
				<ul align="left"><label data-toggle="collapse" data-target="#demo7"><input type="checkbox">게임/방송기타</label>
      				<div id="demo7" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				게임개발/게임코칭
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				방송/컨텐츠 제작
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				SW개발/프로그래밍
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo8"><input type="checkbox">입시</label>
      				<div id="demo8" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				중고등 교과과목
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				입시 예체능
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo9"><input type="checkbox">자동차</label>
      				<div id="demo9" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				자동차튜닝/주변기기
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				정비
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				장롱면허연수
                 			</label>
           				</li>
           			</div>
           		</ul>
           		<ul align="left"><label data-toggle="collapse" data-target="#demo10"><input type="checkbox">기타</label>
      				<div id="demo10" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				마술
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				애완
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				비지니스/경영
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				보건/의료
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				상담/일상
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				기타
                 			</label>
           				</li>
           			</div>
				</ul>
			</div>
		</div>
	</div>
    
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>1</p>
      <hr>
      <h3>Test</h3>
      <p>2</p>
    </div>
   
  </div>
</div>
</body>
</html>