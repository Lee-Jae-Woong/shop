<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<form:form action="${root}user/pwSearch_proc" modelAttribute="pwsearchUserDTO">
			<div>
				<img class="back">
			</div>
			<h2 class="Searchtitle">PwSearch</h2>
			<div class="searchbody">
				<h3 class="searchname">아아디</h3>
				<form:input path="id" name="id" class="searchinput" placeholder="id" />
				<form:errors path="id" class="error"></form:errors>
				<br>
				<h3 class="searchname">E-Mail</h3>
				<form:input path="email" name="email" class="searchinput" placeholder="Email" />
				<form:errors path="email" class="error"></form:errors>
				<br>
				<h3 class="searchname">전화번호</h3>
				<form:input path="tel" name="tel" class="searchinput" placeholder="Tel" />
				<form:errors path="tel" class="error"></form:errors>
				<br>
				<form:errors path="pwSearch" id="mainError" class="error"></form:errors>
				<div class="move">
					<input class="movebtn" type="submit" value="찾기">
					<button class="movebtn" type="button">취소</button>
				</div>
			</div>
		</form:form>
	</div>
	<%@include file="../footBar.jsp"%>
</body>
</html>