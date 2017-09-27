<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/javascript/fileupload.js'/>"></script> --%>



</head>
<body>
	<form action="${pageContext.servletContext.contextPath}/insert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="post">
						
                    	<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">보고서파일</label>
		                        <div class="col-sm-9">
		                            <input type="file" class="form-control" name="uploadFile">
		                        </div>
                    	</div>
                    	
                    	<div class="form-group">
	                        <div class="col-sm-12 text-right">
	                            <button type="submit" class="btn btn-success preview-add-button">
	                                	입력완료
	                            </button>
	                        </div>
                    	</div>
					</form>
	
	
	<!--simple form2  ${pageContext.servletContext.contextPath}/insert?${_csrf.parameterName}=${_csrf.token}--> 
	<!-- local에는 저장되는 업로드 폼  -->
	<%-- <form id="inserForm" action="${pageContext.servletContext.contextPath}/insert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST">
		<input type="file" id="uploadFile" name="uploadFile"><br> <br>
		<input type="hidden" id="csrfToken" value="${_csrf.token}"/>
			<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/>
			<input type="submit" value="Upload" />
	</form> --%>
</body>


