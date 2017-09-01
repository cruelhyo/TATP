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
    		<p align="left">강좌 정렬</p>
    		<hr style=" border:  solid 1px white;">
      		<div class="row" align="left">
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;높은금액</label>&nbsp;&nbsp; 
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;낮은금액</label>
      		</div>
      		<br>
      		<div class="row" align="left">
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;신규등록</label>&nbsp;&nbsp;
      			<label>&nbsp;&nbsp;&nbsp;&nbsp;마감임박</label>
      		</div>
     		 
     	</div>
    
    	<div class="well" style="border: none; radius: 0;">
    		<p align="left">강좌 카테고리</p>
    		<hr style=" border:  solid 1px white;">
    		<div>
    			<ul align="left"><label data-toggle="collapse" data-target="#demo1"><input type="checkbox">예술</label>
      				<div id="demo1" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				미술
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				음악
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				영화
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				스포츠
                 			</label>
           				</li>
           			</div>
           			
				</ul>
				<ul align="left"><label data-toggle="collapse" data-target="#demo2"><input type="checkbox">공예</label>
      				<div id="demo2" class="collapse" align="left">
      					<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				가죽
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				종이
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				영화
                 			</label>
           				</li>
           				<li class="treeUl">
      						<label>
               					<input type="checkbox">
                				스포츠
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