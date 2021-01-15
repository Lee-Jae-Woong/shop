<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${root}css/mypage.css" />
<link rel="stylesheet" href="${root}css/cart.css">
<link rel="stylesheet" href="${root}css/infoModify.css">
<%@include file="topBar.jsp"%>
</head>
<body>
	<div class="myMain">
		<div class="subTitle">회원 정보 수정</div>
		<br> <br>
		<div class="info">
			<div class="order">
				<table class="myPageUserInfo">
					<colgroup>
						<!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
				</table>
			</div>
		</div>
		<!-- //info -->
		<div class="mypage_menu">
			<div class="myMenu">
				<ul>
					<li><a href="${root }paymentViewAll">주문내역</a></li>
					<li><a href="#">적립금</a></li>
					<li><a href="#">쿠폰</a></li>
					<li><a href="#">관심상품</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="${root}infoModify">회원정보수정</a></li>
					<li><a href="#">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<!-- //myMenu -->
		<br> <br>
	</div>
	<div class="ModifyBody">
		<form:form action="${root}/infoModify_proc" method="post" modelAttribute="userModifyDTO">
			<div class="infoModifyBody">
				<table>
					<th colspan="2" class="infoModifyTitle">회원 정보 수정</th>
					<tr>
						<td class="infoModifyid">아이디</td>
						<td id="infoModifyid">${user.id}</td>
					</tr>
					<tr>
						<td class="infoModifypw">비밀번호</td>
						<td id="infoModifypw">
							<form:input path="pw" id="pw" name="pw" class="inputbar" type="password"/><br>
							<form:errors path="pw" class="error"/>
						</td>
					</tr>
				</table>
				<input class="modifyBtn" type="submit" value="회원정보 확인하기" />
			</div>
		</form:form>
	</div>
	<%@include file="footBar.jsp"%>
</body>
</html>