<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${root}css/Search.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/home.css" />
<c:set var="user" value="${sessionScope.loginUser}" />
<%@include file="../topBar.jsp"%>
</head>
<body>
	<div class="Searchbody">
		<form:form action="${root}user/pwPermute_proc" method="post" modelAttribute="pwPermuteUserDTO">
			<form:hidden path="id" />
			<form:hidden path="email" />
			<form:hidden path="tel" />
			<div>
				<img class="back">
			</div>
			<div>
				<h2 class="Searchtitle">PasswordRermute</h2>
				<div class="searchbody">
					<div class="Searchmain">
						<h3 class="searchname">새로운 비밀번호</h3>
						<form:input path="pw1" type="password" name="pw1" class="searchinput" />
						<form:errors path="pw1" class="error" />
						<h3 class="searchname">새로운비밀번호 확인</h3>
						<form:input path="pw2" type="password" name="pw2" class="searchinput" />
						<form:errors path="pw2" class="error" />
						<form:errors path="pwSearch" id="mainError" class="error" />
						<div class="move">
							<input class="movebtn" type="submit" value="변경">
							<button class="movebtn" type="button">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<%@include file="../footBar.jsp"%>
</body>
</html>