<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/mypage.css" />
<link rel="stylesheet" href="${root}css/cart.css">

<title>Document</title>

<%@include file="topBar.jsp"%>
</head>
<body>

	<div class="myMain">
		<div class="subTitle">적립금 내역</div>
		<br> <br>

		<!-- //info -->

		<div class="mypage_menu">
			<div class="myMenu">
					<ul class="baseBox">


					<li><a href="${root }paymentViewAll">주문내역</a></li>
					<li><a href="${root }pointView">적립금</a></li>
					<li><a href="${root }couponPage">쿠폰</a></li>
					<li><a href="#">관심상품</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="#">회원정보수정</a></li>
					<li><a href="#">회원탈퇴</a></li>

				</ul>
			</div>
		</div>
		<!-- //myMenu -->
		<br> <br>
	</div>

	
	<!-- 주문정보 간소화 -->
	<!-- 최근 주문 정보 -->
	<table class="shopping_cart_foot">
		<tr>
			<td colspan="8">

				<div class="lstOrdList">적립금 내역 정보</div>
				<div class="ordAllList"></div>

			</td>
		</tr>
	</table>
	<div id="contentWrapper">
		<div id="contentWrap">
			<table class="shopping_cart">

				<colgroup>
					<!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
					<col width="5%" />
					<col width="7%" />
					<col width="10%" />
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
				</colgroup>

				<thead>
					<tr>

						<th>주문번호</th>
						<th>주문일자</th>
						<th>상품명</th>
						<th>누적적립금</th>
						<th>사용적립금</th>
					</tr>
				</thead>

				<!-- 상품 리스트 부분 -->
				<tbody>
					<c:forEach var="pv" items="${pointView }">

						<tr>

							<td>${pv.ordNum }_${pv.userNum}</td>
							<td><fmt:formatDate value="${pv.payDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${fn:split(pv.ordName,',')[0]}
								<c:if
									test="${not empty fn:split(pv.ordName,',')[1]}">
								외 ${fn:length(fn:split(pv.ordName, ","))-1} 개
								</c:if>
							</td>
							
							<td><fmt:formatNumber value="${pv.point }" type="number" />원</td>
							<td><fmt:formatNumber value="-${pv.usePoint }" type="number" />원</td>
							
							
						</tr>

					</c:forEach>


				</tbody>
			</table>
		</div>
	</div>

	<div id="contentWrapper"  style="height:100px !important;">
      <div id="contentWrap" >
      	<colgroup>
               <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
               <col width="100%" />
        </colgroup>
      
      	<table class="shopping_cart"  style="border-style: hidden !important; ">
         <thead >
               <tr >
                  <th scope="row" style="background-color:white !important;"><div class="tb-center"  style="margin-bottom:40px !important;"><c:if test="${empty pointView}"><br><br>적립금 내역이 없습니다</c:if></div></th>
               </tr>
         </thead>
         	 <tbody>
         	<tr>
         		<td >
         		</td>
         	</tr>
         </tbody>
       
         </table>
      </div>
   </div>
   
	<br>
	<br>
	<br>


</body>
</html>