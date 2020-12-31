<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="${root}css/paymentView.css">
<title>Insert title here</title>
</head>

<script language="javascript">

function popupAutoResize() {

   var thisX = parseInt(document.body.scrollWidth);

   var thisY = parseInt(document.body.scrollHeight);

   var maxThisX = screen.width - 50;

   var maxThisY = screen.height - 50;

   var marginY = 0;
   var marginY2 = 150;

   //alert(thisX + "===" + thisY);

   //alert("임시 브라우저 확인 : " + navigator.userAgent);

   // 브라우저별 높이 조절. (표준 창 하에서 조절해 주십시오.)    

   if (navigator.userAgent.indexOf("MSIE 6") > 0) marginY = 45;        // IE 6.x

   else if(navigator.userAgent.indexOf("Firefox") > 0) marginY = 50;   // FF

   else if(navigator.userAgent.indexOf("Opera") > 0) marginY = 30;     // Opera

   else if(navigator.userAgent.indexOf("Netscape") > 0) marginY = -2;  // Netscape 

   else marginY = 70;

   

   if (navigator.userAgent.indexOf("MSIE 6") > 0) marginX = 40;        // IE 6.x

   else if (navigator.userAgent.indexOf("MSIE 7") > 0) marginX = 40;        // IE 7.x

   else marginX = 20;


   if (thisX > maxThisX) {

       window.document.body.scroll = "yes";

       thisX = maxThisX;

   }

   if (thisY > maxThisY - marginY) {

       window.document.body.scroll = "yes";

       thisX += 19;

       thisY = maxThisY - marginY;

   }

   window.resizeTo('450', thisY+marginY+marginY2);


   // 센터 정렬

   // var windowX = (screen.width - (thisX+10))/2;

   // var windowY = (screen.height - (thisY+marginY))/2 - 20;

   // window.moveTo(windowX,windowY);

}

</script>

<body> 

<p id="receiptTitle">수확행</p>

<div id="siteInfo">
<span id="receiptSpan" class="leftSpan">수확행</span>
<span id="receiptSpan"  class="rightSpan"><fmt:formatDate value="${pm.payDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
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
<td style="text-align: left"><span id="list1"><c:forTokens var="list1" items="${token1}" delims=",">${list1}<br />
					</c:forTokens></span></td>
<td><span id="list2"><c:forTokens var="list2" items="${token2}" delims=",">${list2}<br />
					</c:forTokens></span></td>
<td><span id="list3">				<c:forTokens var="list3" items="${token3}" delims=",">&nbsp${list3}<br />
					</c:forTokens></span></td>
<td id="rightTd"><span id="list4">				<c:forTokens var="list4" items="${token4}" delims=","><fmt:formatNumber value="${list4}" type="number" /><br />
					</c:forTokens></span></td>
</tr>
</table>
</div>
<hr>
<div id="calInfo">
<span id="receiptSpan" class="leftSpan">주문합계</span>
<span id="receiptSpan"  class="rightSpan"><fmt:formatNumber value="${pm.cal }" type="number" /></span>
</div>

<div id="calInfo">
<span id="receiptSpan" class="leftSpan">사용적립금액</span>
<c:set var="usePoint" value="${pm.usePoint }" />
<c:choose>
<c:when test="${usePoint eq '0'}"><span id="receiptSpan"  class="rightSpan"><fmt:formatNumber value="${pm.usePoint }" type="number" /></span></c:when>
<c:otherwise><span id="receiptSpan"  class="rightSpan">- <fmt:formatNumber value="${pm.usePoint }" type="number" /></span></c:otherwise>
</c:choose>
</div>


<div id="calInfo">
<span id="receiptSpan" class="leftSpan">사용쿠폰금액</span>
<c:set var="useCouponCal" value="${pm.useCouponCal }" />
<c:choose>
<c:when test="${useCouponCal eq '0'}"><span id="receiptSpan"  class="rightSpan"><fmt:formatNumber value="${pm.useCouponCal}" type="number" /></span></c:when>
<c:otherwise><span id="receiptSpan"  class="rightSpan">- <fmt:formatNumber value="${pm.useCouponCal}" type="number" /></span></c:otherwise>
</c:choose>

</div>
<hr>
<div id="calInfo">
<span id="receiptSpan" class="leftSpan">누적적립금</span>
<span id="receiptSpan"  class="rightSpan">
<fmt:formatNumber value="${pm.point }" type="number" /></span>
</div>
<hr>
<div id="toTal">
<span id="toTalSpan" class="leftSpan">Total</span>
<span id="toTalSpan"  class="rightSpan"><fmt:formatNumber value="${pm.cal }" type="number" /></span>
</div>
<hr>
<div id="payMethodInfo">
<div>입금자명:${pm.depositor }</div>
<div>거래방법:무통장입금</div>
<div>배송지:(${pm.addr1})	${pm.addr2} ${pm.addr3}</div>
</div>
<br>
<br>

</body>
	<div class="wrap">
  		<a href="#" class="button2" onclick="self.close();">&nbsp 확  인</a>
	</div>
	  <script language="javascript">

popupAutoResize();

</script>
</html>

