<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/topBar.css">
<title>TopBar - 수확행 - 행복을 거두자</title>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${root }js/topBar.js" defer></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>

<script>

function loginCheck(){
	if (${user.check eq false}){
		return true;
	}
	return false;
}


function moveTargetPage(url){
	if(loginCheck()){
		alert("로그인 후 이용가능합니다");
		location.href = "${root }login";
	}else{
		location.href = "${root}"+url;
	}

}

</script>

<style>
.header2 {
	background-color: white;
}
</style>

</head>
<body style="zoom: 1;">
	<div id="header" class="headerBar">
		<div class="header2">
			<div id="headerTop">
				<h1 class="title">
					<a href="${root }" class="titleimg">TempTitle</a>
				</h1>
				<div class="loginOutReg">
					<ul>
					<c:choose>
					   <c:when test="${user.check eq false}">
      						 <li><a href="${root }login" class="login">로그인</a></li>
      						 <li><a href="${root }join" class="reg">회원가입</a></li>
   					   </c:when>
   					   <c:when test="${user.check eq true}">  		
      						 <li> ${user.name} 님 </li> <li> <a href="${root }logout" class="login">로그아웃</a></li> <br>
      						 <li>반갑습니다. </li>
      						 
   					   </c:when>
					</c:choose>
						
					</ul>
			</div>
			</div>

			<div id="headerNavWrap">
				<div id="headerNavArea">
					<div class="headerNav">
						<div class="navArea subListWrap">
							<div class="convenientList">
								<ul>
									<li><a href="javascript:void(0);" onclick="moveTargetPage('myPage');" class="ic_info" title="마이페이지">마이페이지</a></li>
									<li><a href="javascript:void(0);"  onclick="moveTargetPage('userlike');" class="ic_wish" title="위시리스트">위시리스트</a></li>
									<li><a href="javascript:void(0);"  onclick="moveTargetPage('cart');" class="ic_cart" title="장바구니">장바구니 </a></li>
								</ul>
							</div>
							<div class="search-wrapper">
								<div class="input-holder">
									<input type="text" class="search-input"
										placeholder="상품을 검색해주세요." />
									<button class="search-icon"
										onclick="searchToggle(this, event);">
										<span></span>
									</button>
								</div>
								<span class="close" onclick="searchToggle(this, event);"></span>
							</div>
							<div class="menuList">
								<ul>
									<li><a href="${root }shoplist">All.전체상품</a></li>
									<li><a href="#">Spring.봄</a></li>
									<li><a href="#">Summer.여름</a></li>
									<li><a href="#">Fall.가을</a></li>
									<li><a href="#">Winter.겨울</a></li>
									<li><a href="#">Etc</a></li>
									<li style="width: 80px !important;"><a href="#"
										class="colorRed" style="width: 80px !important;"
										title="꽃 + 화분"> SET.판매 </a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 사이드바 -->
	<div id="rightMenu">
		<div class="topBtmWrap">
		<ul>
			<li><a href="#" class="ico" style="display:block;">
			<span><button class="topBtm">맨 위로
			</button></span>
			
			</a></li>
		</ul>
		</div>
	</div>
	
	<div id="insertBody"></div>
	<div>
	</div>

</body>
</html>