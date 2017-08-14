<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<c:if test="${param.error != null }">
		        <h2>Username/Password not corrrect</h2>
		</c:if>
		<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl }" method="post">
			<p style="margin:0; padding: 0;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</p>
			<table>
				<tr>
				    <td style="width: 200px;"><spring:message code="user.email" /></td>
				    <td style="width: 390px"><input type="text" name="username" style="width: 99%;" /></td>
				</tr>
				<tr>
				    <td><spring:message code="user.password" /></td>
				    <td><input type="password" name="password" style="width: 99%;" /></td>
				</tr>
			</table>
			<input type="submit" value="로그인">
		</form>
	
	</body>
</html>