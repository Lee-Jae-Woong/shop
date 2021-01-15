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


<title>Document</title>

<%@include file="topBar.jsp"%>
</head>
<body>

   <div class="myMain">
      <div class="subTitle">마이페이지</div>
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

               <thead>
                  <tr height="50">
                     <th>안녕하세요, ${user.name } 님</th>
                     <th>장바구니</th>
                     <th>위시리스트</th>
                     <th>적립금</th>
                     <th>쿠폰</th>
                  </tr>
               </thead>

               <!-- 상품 리스트 부분 -->
               <tbody>
                  <tr height="100">
                     <td style="padding-left: 50px; border-left: 0px;"><div class="base"
                           style="text-align: left;">
                           전화번호 : ${user.tel }<br> 이메일주소 : ${user.email }<br>
                        </div></td>
                     <td><div class="base">${cartCount}개</div></td>
                     <td><div class="base">${userLikeListCount }개</div></td>
                     <td><div class="base">
                     
                     <c:set var="tp" value="${totalPoint}" />

<c:choose>



    <c:when test="${empty tp}">
       0원
    </c:when>
    <c:otherwise>
        ${totalPoint.totalPoint }원
    </c:otherwise>


</c:choose>

                     </div></td>
                     <td><div class="base">${cpCount}장</div></td>

                  </tr>

               </tbody>

               <tfoot>
                  <tr height="30">
                     <th></th>
                     <th></th>
                     <th></th>
                     <th></th>
                     <th></th>
                  </tr>
               </tfoot>

            </table>
         </div>
      </div>
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

            <div class="lstOrdList">최근 주문 정보</div>
            <div class="ordAllList">
               <a  href="${root }paymentViewAll">전체보기</a>
            </div>

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
               <col width="7%" />
               <col width="7%" />
            </colgroup>

            <thead >
               <tr >
                  <th >번호</th>
                  <th>주문번호</th>
                  <th>상품명</th>
                  <th>주문일자</th>
                  <th>결제금액</th>
                  <th>결제방법</th>
                  <th>배송상태</th>
                  <th>전자영수증</th>
               </tr>
            </thead>

            <!-- 상품 리스트 부분 -->
            <tbody>
               <c:forEach var="mp" items="${mp }" end="4">
					
                  <tr>
                  
                     <td>${mp.payNum }</td>
                     <td>${mp.ordNum }_${mp.userNum}</td>
                     <td>${fn:split(mp.ordName,',')[0]}
                     	<c:if test="${not empty fn:split(mp.ordName,',')[1]}"> 외 ${fn:length(fn:split(mp.ordName, ","))-1} 개</c:if>
                     </td>
                     <td><fmt:formatDate value="${mp.payDate}"
                           pattern="yyyy-MM-dd" /></td>
                     <td><fmt:formatNumber value="${mp.cal }" type="number" />원</td>
                     <td>무통장입금</td>
                     <td>배달완료</td>
                     <td>
								<form action="${root }paymentView" method="post" target="POPUPW"  modelAttribute="paymentDTO"
    									onsubmit="POPUPW = window.open('about:blank','POPUPW', 'width=450,height=700');">
								<input type="hidden" name="payNum" value="${mp.payNum }" />
								<div class="field"><input type="submit" name="sub" value="발 급" class="blue_button"></div>
								</form>
					</td>
                  </tr>

               </c:forEach>
               
            </tbody>
            
         </table>
   <div id="contentWrapper"  style="height:100px !important;">
      <div id="contentWrap" >
      	<colgroup>
               <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
               <col width="100%" />
        </colgroup>
      
      	<table class="shopping_cart"  style="border-style: hidden !important;" >
         <thead  >
               <tr >
                  <th scope="row"  style="background-color:white !important;" ><div class="tb-center" style="margin-bottom:40px !important;"><c:if test="${empty mp}">주문 내역이 없습니다</c:if></div></th>
               </tr >
         </thead>
         <tbody>
         	<tr>
         		<td>
         		</td>
         	</tr>
         </tbody>
       
         </table>
      </div>
   </div>
   
   
   <table class="shopping_cart_foot">
      <tr>
         <td colspan="8">

            <div class="lstOrdList">사용가능 쿠폰</div>
            <div class="ordAllList">
               <a  href="${root }couponPage">전체보기</a>
            </div>

         </td>
      </tr>
   </table>
   
   <div id="contentWrapper">
      <div id="contentWrap">
         <table class="shopping_cart" >

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

            <thead >
               <tr >
                  <th scope="row" ><div class="tb-center">쿠폰번호</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">쿠폰이름</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">적용범위</div></th>
                    <th scope="row"><div class="tb-center">할인액(률)</div></th>
                    <th class="ipt" scope="row"><div class="tb-center">사용기간</div></th>
                    <th scope="row"><div class="tb-center">사용여부</div></th>
                  
               </tr>
            </thead>
<c:forEach var="cl" items="${cpList }"> 

            <!-- 상품 리스트 부분 -->
            <tbody>


                  <tr>
                  <td>${cl.cpNum}</td>
                     <td>${cl.cpName }</td>
                     <td>${cl.itemScope }</td>
                     <td>${cl.cpRate }</td>
                     <td>${cl.expDate }</td>
                     <td>${cl.useCp }</td>
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
      
      	<table class="shopping_cart"  style="border-style: hidden !important;">
         <thead >
               <tr >
                  <th scope="row"  style="background-color:white !important;" ><div class="tb-center"  style="margin-bottom:40px !important;"><c:if test="${empty cpList}">보유하고 계신 쿠폰 내역이 없습니다</c:if></div></th>
               </tr>
         </thead>
         	 <tbody>
         	<tr>
         		<td>
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