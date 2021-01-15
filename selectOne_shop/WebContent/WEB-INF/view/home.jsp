<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home1.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${root }css/home1.css" />
<%@include file="topBar.jsp"%>
<c:set var="user" value="${sessionScope.loginUser}" />
</head>

<body>
	<section>
		<div class="body">
			<div>
				<h2 class="maintitle">Season</h2>
			</div>

			<div class="big" id="big1">
				<div>
					<h2 class="season" id="season1">Spring Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton1">
						<div class="hiddenbody" id="hiddenbody1">
							<div class="hiddencont">
								<p>Product.</p>
								봄꽃
								<p>Price</p>
								2000원 ~ 5000원
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="big" id="big2">
				<div>
					<h2 class="season" id="season2">Summer Flower</h2>
					<a href="${root}shoplist">
						<div class="hiddenbutton" id="hiddenbutton2">
							<div class="hiddenbody" id="hiddenbody2">
								<div class="hiddencont">
									<p>Product.</p>
									여름꽃
									<p>Price</p>
									2000원 ~ 5000원
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="big" id="big3">
				<div>
					<h2 class="season" id="season3">Autumn Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton3">
						<div class="hiddenbody" id="hiddenbody3">
							<div class="hiddencont">
								<p>Product.</p>
								가을꽃
								<p>Price</p>
								2000원 ~ 5000원
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="big" id="big4">
				<div>
					<h2 class="season" id="season4">Winter Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton4">
						<div class="hiddenbody" id="hiddenbody4">
							<div class="hiddencont">
								<p>Product.</p>
								겨울꽃
								<p>Price</p>
								2000원 ~ 5000원
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div>
			<div class="productbody">
				<h2 class="producttitle">Recommended product</h2>
				<div>
					<c:forEach var="dto" items="${GdsInfoList}">
						<a href="${root }shop?gds=${dto.gdsNum}">
						<div class="productlist">
							<div>
								<div class="productimg">
									<img src="images/${dto.thumbImg}" width="400px" height="350px"/>
								</div>
								<div class="productcon">
									<span class="s_code">${dto.cateName }</span>
									<c:choose>
										<c:when test="${dto.gdsStock < 1 }">
											<span class="stock_state">Sold Out</span>
										</c:when>
										<c:when test="${dto.gdsStock < 30 }">
											<span class="stock_state">마감임박</span>
										</c:when>
									</c:choose>
									<span class="gds_name">${dto.gdsName }</span> <span
										class="gds_price">&#8361;${dto.gdsPrice } x 1ea</span> <a
										href="#"><span class="review">리뷰
											${dto.review_count}개</span></a>
								</div>
								<div class="inner-reg3">
									<div class="favorite-div">
										<c:choose>
											<c:when test="${dto.like eq false}">
												<div class="favorite" id="userlike" value="like">
													<img src="images/favorite_border.svg" class="unactive"
														value="${dto.gdsNum}" />
												</div>
											</c:when>
											<c:when test="${dto.like eq true}">
												<div class="favorite" id="userlike" value="dislike">
													<img src="images/favorite-black.svg" class="unactive"
														value="${dto.gdsNum}" />
												</div>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div>
			<div class="flowerinterior">
				<div>
					<h2 class="flowertitle">A flower in the room</h2>
				</div>

				<div class="flower1">
					<div class="interior1">
						<a href="#"><img id="img1">
							<h3 class="cont">가족과 함께....</h3></a>
					</div>
					<div class="interior2">
						<a><img id="img2">
							<h3 class="cont">해바라기 처럼 ...</h3></a>
					</div>
				</div>
				<div class="flower2">
					<div class="interior2">
						<a><img id="img3">
							<h3 class="cont">나(꽃)만 바라봐...</h3></a>
					</div>
					<div class="interior1">
						<a><img id="img4">
							<h3 class="cont">하늘에서 꽃잎이 휘날리며...</h3></a>
					</div>
				</div>
				<div class="flower3">
					<div class="interior1">
						<a><img id="img5">
							<h3 class="cont">피크닉을 나가며....</h3></a>
					</div>
					<div class="interior2">
						<a><img id="img6">
							<h3 class="cont">꽃속에 잠들다...</h3></a>
					</div>
				</div>
				<div class="flower4">
					<div class="interior2">
						<a><img id="img7">
							<h3 class="cont">꽃에 뜨거운 물은 안되요...</h3></a>
					</div>
					<div class="interior1">
						<a><img id="img8">
							<h3 class="cont">집인테리어는 꽃으로...</h3></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="footBar.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							$(".favorite > img")
									.on(
											"click",
											function() {
												let like = $(this).parent()
														.attr('value');
												let gdsNum = $(this).attr(
														'value')
												let check = "<c:out value='${sessionScope.loginUser.check}'/>";
												if (check === "false") {
													alert("로그인 후 사용가능합니다");
													location.href = '${root}login';
													return false;
												}

												let userNum = "<c:out value='${sessionScope.loginUser.userNum}'/>";
												let result = {
													"gdsNum" : gdsNum,
													"userNum" : userNum
												};

												if (like == 'like') {

													fetch(
															'${root}shop/like',
															{
																method : 'POST',
																headers : {
																	'Content-Type' : 'application/json;charset=utf-8'
																},
																body : JSON
																		.stringify(result)
															})

													$(this)
															.prop("src",
																	"images/favorite-black.svg");
													like.setAttribute('value',
															'dislike');

												} else {

													fetch(
															'${root}shop/dislike',
															{
																method : 'POST',
																headers : {
																	'Content-Type' : 'application/json;charset=utf-8'
																},
																body : JSON
																		.stringify(result)
															})

													$(this)
															.prop("src",
																	"images/favorite_border.svg");
													like.setAttribute('value',
															'like');

												}

											});

						});
	</script>
</body>
</html>
