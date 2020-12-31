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
<link rel="stylesheet" href="${root}css/infoModify_form.css">

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
					<li><a href="${root }pointView">적립금</a></li>
					<li><a href="${root }couponPage">쿠폰</a></li>
					<li><a href="#">관심상품</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="${root}infoModify">회원정보수정</a></li>
					<li><a href="#">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div>
		<div>
			<form:form action="${root}infoModify_form_proc" method="post" modelAttribute="userInfoModifyDTO">
				<table class="infoModify_formbody">
					<th colspan="3" class="infoModify_formtitle">회원 정보 수정
						<hr>
					</th>
					<tr>
						<td class="infoModify">이름</td>
						<td class="infoModifytr">${user.name}</td>
					</tr>
					<tr>
						<td class="infoModify">아이디</td>
						<td class="infoModifytr">${user.id}</td>
					</tr>
					<tr>
						<td class="infoModify">비밀번호</td>
						<td class="infoModifytr">
							<form:input path="pw1" id="pw1" name="pw1" class="inputbar" type="password" /><br> 
							<form:errors path="pw1" class="error" />
						</td>
					</tr>
					<tr>
						<td class="infoModify">비밀번호 확인</td>
						<td class="infoModifytr"><form:input path="pw2" id="pw2" name="pw2" class="inputbar" type="password" /><br>
						<form:errors path="pw2" class="error"/></td>
					</tr>
					<tr>
						<td class="infoModify">이메일</td>
						<td class="infoModifytr"><form:input path="email" id="email" name="email" class="inputbar" type="email" /><br>
						<form:errors path="email" class="error" /></td>
					</tr>
					<tr>
						<td class="infoModify">전화번호</td>
						<td class="infoModifytr">
						<form:input path="tel" id="tel" name="tel" class="inputbar" type="tel" /><br>
						<form:errors path="tel" class="error"/></td>
					</tr>
					<th colspan="3" class="infoModify_formtitle">주소
						<hr>
					</th>
					<tr>
					<tr>
						<td class="infoModify">우편번호</td>
						<td class="infoModifytr"><form:input path="mAddr" name="mAddr" class="postcodify_postcode5" /><br> <form:errors path="mAddr" class="error" /></td>
						<td>
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
						<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
							$(function() {
								$("#postcodify_search_button").postcodifyPopUp();
							});
						</script>
					</tr>
					<tr>
						<td class="infoModify">도로명 주소</td>
						<td class="infoModifytr"><form:input path="lAddr" name="lAddr" class="postcodify_address" /><br> <form:errors path="lAddr" class="error" /></td>
					</tr>
					<tr>
						<td class="infoModify">상세주소</td>
						<td class="infoModifytr"><form:input path="dlAddr" name="dlAddr" class="postcodify_details" /><br> <form:errors path="dlAddr" class="error" /></td>
					</tr>
					<tr id="movebtn">
						<td colspan="3"><input id="btn" class="move" type="submit" value="변경하기">
							<button class="move" type="reset">다시작성</button>
							<button class="move" type="button" onclick="location.href='${root}/main'">취소</button>
							<button class="move" type="button" onclick="infoDelete();">회원탈퇴</button></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
	<%@include file="footBar.jsp"%>
	<script>
		
		function infoDelete() {
			if(confirm("정말 탈퇴하시겠습니까?(탈퇴시 회원정보복구는 불가합니다)") == true){
				location.href='${root}infoDelete';
			}else{
				return;
			}
		}
	</script>
</body>
</html>