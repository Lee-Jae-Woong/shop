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
<link rel="stylesheet" href="${root}css/paymentResult.css" />


<title>Document</title>

<%@include file="topBar.jsp"%>
</head>
<body>


	<p id="thanks">구매해주셔서 감사합니다.</p>

	<div id="divBody">

		<p id="receiptTitle">수확행</p>
		<div id="siteInfo">
			<span id="receiptSpan" class="leftSpan">수확행</span> <span
				id="receiptSpan" class="rightSpan"><fmt:formatDate
					value="${pm.payDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			<div>사업자번호:1010245802456</div>
			<div>대표전화:023124512</div>
			<div>주소:서울시종각구더존아카데미</div>
		</div>
		<hr>
		<div id="ordList">
			<c:set var="token1" value="${pm.ordName }" />
			<c:set var="token2" value="${pm.ordColor }" />
			<c:set var="token3" value="${pm.ordCount }" />
			<c:set var="token4" value="${pm.ordPrice }" />
			<table id="orderInfo">
				<tr>
					<td style="text-align: left; width: 90px;"><span id="menu1">상품명</span></td>
					<td><span id="menu2">옵션</span></td>
					<td><span id="menu3">수량</span></td>
					<td id="rightTd"><span id="menu4">단가</span></td>
				</tr>
				<tr>
					<td style="text-align: left"><span id="list1"><c:forTokens
								var="list1" items="${token1}" delims=",">${list1}<br />
							</c:forTokens></span></td>
					<td><span id="list2"><c:forTokens var="list2"
								items="${token2}" delims=",">${list2}<br />
							</c:forTokens></span></td>
					<td><span id="list3"> <c:forTokens var="list3"
								items="${token3}" delims=",">&nbsp${list3}<br />
							</c:forTokens></span></td>
					<td id="rightTd"><span id="list4"> <c:forTokens
								var="list4" items="${token4}" delims=",">
								<fmt:formatNumber value="${list4}" type="number" />
								<br />
							</c:forTokens></span></td>
				</tr>
			</table>
		</div>
		<hr>
		<div id="calInfo">
			<span id="receiptSpan" class="leftSpan">주문합계</span> <span
				id="receiptSpan" class="rightSpan"><fmt:formatNumber
					value="${pm.cal }" type="number" /></span>
		</div>

		<div id="calInfo">
			<span id="receiptSpan" class="leftSpan">사용적립금액</span>
			<c:set var="usePoint" value="${pm.usePoint }" />
			<c:choose>
				<c:when test="${usePoint eq '0'}">
					<span id="receiptSpan" class="rightSpan"><fmt:formatNumber
							value="${pm.usePoint }" type="number" /></span>
				</c:when>
				<c:otherwise>
					<span id="receiptSpan" class="rightSpan">- <fmt:formatNumber
							value="${pm.usePoint }" type="number" /></span>
				</c:otherwise>
			</c:choose>
		</div>


		<div id="calInfo">
			<span id="receiptSpan" class="leftSpan">사용쿠폰금액</span>
			<c:set var="useCouponCal" value="${pm.useCouponCal }" />
			<c:choose>
				<c:when test="${useCouponCal eq '0'}">
					<span id="receiptSpan" class="rightSpan"><fmt:formatNumber
							value="${pm.useCouponCal}" type="number" /></span>
				</c:when>
				<c:otherwise>
					<span id="receiptSpan" class="rightSpan">- <fmt:formatNumber
							value="${pm.useCouponCal}" type="number" /></span>
				</c:otherwise>
			</c:choose>

		</div>
		<hr>
		<div id="calInfo">
			<span id="receiptSpan" class="leftSpan">누적적립금</span> <span
				id="receiptSpan" class="rightSpan"> <fmt:formatNumber
					value="${pm.point }" type="number" /></span>
		</div>
		<hr>
		<div id="toTal">
			<span id="toTalSpan" class="leftSpan">Total</span> <span
				id="toTalSpan" class="rightSpan"><fmt:formatNumber
					value="${pm.cal }" type="number" /></span>
		</div>
		<hr>
		<div id="payMethodInfo">
			<div>입금자명:${pm.depositor }</div>
			<div>거래방법:무통장입금</div>
			<div style="margin-bottom: 50px;">배송지:(${pm.addr1}) ${pm.addr2} ${pm.addr3}</div>
		</div>
		<br> <br> <br>
	</div>
	 <a href="${root }"
			class="button2"> 홈 페 이 지 로 가 기</a>



	<%@include file="footBar.jsp"%>

</body>
</html>
