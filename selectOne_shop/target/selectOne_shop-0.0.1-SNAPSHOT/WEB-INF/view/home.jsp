<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home1.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
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
					<h2 class="season">Spring Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton1">
						<div class="hiddenbody" id="hiddenbody1">
							<div class="hiddencont">
								<p>Product.</p>
								벚꽃
								<p>Price</p>
								15000원
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="big" id="big2">
				<div>
					<h2 class="season">Summer Flower</h2>
					<a href="https://www.naver.com/">
						<div class="hiddenbutton" id="hiddenbutton2">
							<div class="hiddenbody" id="hiddenbody2">
								<div class="hiddencont">
									<p>Product.</p>
									벚꽃
									<p>Price</p>
									15000원
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="big" id="big3">
				<div>
					<h2 class="season">Autumn Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton3">
						<div class="hiddenbody" id="hiddenbody3">
							<div class="hiddencont">
								<p>Product.</p>
								벚꽃
								<p>Price</p>
								15000원
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="big" id="big4">
				<div>
					<h2 class="season">Winter Flower</h2>
					<div class="hiddenbutton" id="hiddenbutton4">
						<div class="hiddenbody" id="hiddenbody4">
							<div class="hiddencont">
								<p>Product.</p>
								벚꽃
								<p>Price</p>
								15000원
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
					<div class="productlist">
						<div class="productimg" id="productimg1"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
					<div class="productlist">
						<div class="productimg" id="productimg2"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
					<div class="productlist">
						<div class="productimg" id="productimg3"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
					<div class="productlist">
						<div class="productimg" id="productimg4"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
					<div class="productlist">
						<div class="productimg" id="productimg5"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
					<div class="productlist">
						<div class="productimg" id="productimg6"></div>
						<div class="productcon">
							<p>상품코드</p>
							<h2>상품명</h2>
							<p>￦10,000 X 1EA</p>
							Review 1개
							<div class="favorite-div">
								<img class="favorite" src="favorite_border.svg" alt="">
							</div>
						</div>
					</div>
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
							<h3 class="cont">벚꽃/개나리</h3> </img></a>
					</div>
					<div class="interior2">
						<a><img id="img2">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
				</div>
				<div class="flower2">
					<div class="interior2">
						<a><img id="img3">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
					<div class="interior1">
						<a><img id="img4">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
				</div>
				<div class="flower3">
					<div class="interior1">
						<a><img id="img5">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
					<div class="interior2">
						<a><img id="img6">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
				</div>
				<div class="flower4">
					<div class="interior2">
						<a><img id="img7">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
					<div class="interior1">
						<a><img id="img8">
							<h3 class="cont">벚꽃/개나리</h3></a>
					</div>
				</div>
			
			</div>
		</div>
	</section>
	<%@include file="footBar.jsp"%>
</body>
</html>
