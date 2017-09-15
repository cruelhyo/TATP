<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${pageContext.servletContext.contextPath}/insert?${_csrf.parameterName}=${_csrf.token} --%><!-- /addfundingfile -->
<%-- ${pageContext.servletContext.contextPath}/addfundingfile?${_csrf.parameterName}=${_csrf.token} --%>
	<form action="${pageContext.servletContext.contextPath}/addfundingfile?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="post">
						<div class="form-group">
	                        <label for="concept" class="col-sm-3 control-label">펀딩선택</label>
		                        <div class="col-sm-9">
		                            <select name="fileFdCode" class="form-control" id="fdselectlist">
										<option value="null">선택해주세요</option>
										<!-- ajax요청으로 목록을 채워줌 -->
									</select>
		                        </div>
                    	</div>
                    	<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">보고서파일</label>
		                        <div class="col-sm-9">
		                            <input type="file" class="form-control" name="uploadFile">
		                         <%--    <input type="hidden" id="csrfToken" value="${_csrf.token}"/>
									<input type="hidden" id="csrfHeader" value="${_csrf.headerName}"/> --%>
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



</body>
</html>