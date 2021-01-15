<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/joinResult.css">
<%@include file="../topBar.jsp"%>
</head>
<body>
	<div class="joinResultBody">
		<div class="joinResultmain">
			<h3>Happy Harvest 회원가입을 축하드립니다.</h3>
			<button onclick="location.href='${root}login'">로그인 페이지로 이동</button>
			<button onclick="location.href='${root}'">메인페이지로 이동</button>
		</div> 
	</div>
 <%@include file="../footBar.jsp"%>
</body>
</html>