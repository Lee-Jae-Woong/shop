<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="user" value="${sessionScope.loginUser}"/>
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/couponpage.css" />


<title>Document</title>

<%@include file="topBar.jsp"%>
</head>
<body>

	<div class="myMain">
		<div class="subTitle">쿠폰내역</div>
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
		<br> 
		
		<br>
	</div>
	<div class="cp_reg">
	
	<img src="${root}/images/coupon.png" style="margin-bottom:30px;">
	<br>
        <div class="reg">
            <form action="${root }regCoupon" method="post" >
                <input type="hidden" name="type">
                <input type="hidden" name="check_type" value="iframe">
                <input type=text size=6 maxlength=4 name="cpCode" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode2" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode3" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 - <input type=text size=6 maxlength=4 name="cpCode4" style='text-align:center;text-transform : uppercase;'  class="input_offcoupon" />
                 <input type="hidden" name="userNum" value="${user.userNum }">
                 <input type="submit"  value="쿠폰번호등록">
            </form>		
	    </div>
        <div class="txt">쿠폰번호는 영문자+숫자 조합이며, 총 16자리 입니다. 예) ABCD-AB12-CD34-12E3</div>
    </div>
	
	
	
	
	
	<!-- 주문정보 간소화 -->
	<!-- 최근 주문 정보 -->
	<table class="shopping_cart_foot">
		<tr>
			<td colspan="8">

				<div class="lstOrdList">전체 쿠폰 목록</div>
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
					<col width="10%" />
					<col width="23%" />
					<col width="18%" />
					<col width="7%" />
					<col width="10%" />
					<col width="7%" />
					
				</colgroup>

				<thead>
					<tr>
						<th scope="row"><div class="tb-center">쿠폰번호</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">쿠폰이름</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">적용범위</div></th>
                    <th scope="row"><div class="tb-center">할인액(률)</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">사용기간</div></th>
                    <th scope="row"><div class="tb-center">사용여부</div></th>
						
					</tr>
				</thead>
<c:forEach var="cl" items="${allCpList }"> 

				<!-- 상품 리스트 부분 -->
				<tbody>


						<tr>
						<td>${cl.cpNum}</td>
							<td >${cl.cpName }</td>
							<td style="text-align: center !important;">${cl.itemScope }</td>
							<td><fmt:formatNumber value="${cl.cpRate }" type="percent"/></td>
							<td>${cl.expDate }</td>
							<c:choose>
                     	<c:when test="${cl.useCp == '사용가능'}"><td><p style="color:#FF5D5D; ">${cl.useCp }</p></td></c:when>
                     	<c:when test="${cl.useCp == '사용완료'}"><td><p style="color:black; font-weight: normal;">${cl.useCp }</p></td></c:when>
                     </c:choose>
							
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
                  <th scope="row" style="background-color:white !important;"><div class="tb-center"  style="margin-bottom:40px !important;"><c:if test="${empty allCpList}">보유하고 계신 쿠폰 내역이 없습니다</c:if></div></th>
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
<div class="paginate">
            <ul>
                <li>
                    <dl>    
                        <dt style="padding-bottom: 10px;">주문 할인쿠폰 적용방법</dt>
                        <dd style="margin-left: 0px; ">
                            주문서 쿠폰 선택에서 고객님이 보유하신 [쿠폰번호]를 선택하시면 할인금액(또는 적립금액)이 나타납니다.<br />
                            (정률할인(적립)의 경우, 할인율(적립률)이 나타납니다.)
                        </dd>
                    </dl>
                </li>

                <li>
                    <dl>    
                        <dt style="padding-bottom: 10px; padding-top: 20px;">쿠폰 사용시 유의사항</dt>
                        <dd style="margin-left: 0px;"> 
                                <li type="none">1. 쿠폰마다 사용 가능 금액과 사용기한이 정해져 있으며, 1개 주문서에 1개의 쿠폰만을 사용하실 수 있습니다.</li>
                                <li type="none">2. 쿠폰을 사용한 주문 후 반품/환불/취소의 경우 한번 사용하신 쿠폰은 다시 사용하실 수 없습니다.</li>
                                <li type="none">3. 쿠폰 적용 품목 및 카테고리가 제한된 경우 해당 품목 또는 카테고리에서만 쿠폰을 사용하실 수 있습니다.</li>
                                <li type="none">4. 할인/적립 쿠폰은 적립금할인 등을 제외한 실제 결제금액에 적용됩니다.</li>
                                <li type="none">5. 모바일 아이콘 표시 쿠폰은 모바일에서만 사용이 가능합니다.</li>
                            
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>

</body>
</html>