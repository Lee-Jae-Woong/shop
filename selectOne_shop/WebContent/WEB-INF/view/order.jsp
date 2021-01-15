<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="user" value="${sessionScope.loginUser}" />
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${root}css/order.css" />


<title>Document</title>
<%@include file="topBar.jsp"%>
</head>
<body>
   <div class="myMain">
      <h1 class="orderTitle">주문서작성</h1>
      <br> <br>



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
      
      <br> <br>
   </div>



   <form action="${root }payment" method="post" id="payment"
      name="payment">
      <input type="hidden" value="${user.id}">
      <table class="shopping_cart_foot">
         <tr>
            <td colspan="8">
               <div class="OrdList">주문리스트</div>
            </td>
         </tr>
      </table>

      <div id="contentWrapper">
         <div id="contentWrap">
            <table class="shopping_cart">

               <colgroup>
                  <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
                  <col width="5%" />
                  <col width="63%" />
                  <col width="10%" />
                  <col width="10%" />
                  <col width="0%" />
               </colgroup>

               <thead>
                  <tr height="50">
                     <th>사진</th>
                     <th>상품명</th>
                     <th>수량</th>
                     <th>적립금</th>
                     <th>가격</th>
                  </tr>
               </thead>

               <!-- 상품 리스트 부분 -->
               <tbody>
                  <c:set var="cal1" value="0" />
                  <c:if test="${not empty OrdDto }"> 
                  <c:set var="cal1" value="${cal1 + OrdDto.ordPrice*OrdDto.ordCount }" />

                  <tr>
                     <td><a href="#"><img src="${root }images/${OrdDto.thumbImg }" alt="장바구니_상품3"></a></td>
                     <td>${OrdDto.gdsNum }:${OrdDto.gdsName }<br> <a
                        class="cartOption"> [옵션] color : ${OrdDto.ordColor    } </a></td>
                     <td>${OrdDto.ordCount }개</td>
                     <td><fmt:formatNumber value="${OrdDto.ordPrice*0.02 }"
                           type="number" />원</td>
                     <td><fmt:formatNumber value="${OrdDto.ordPrice }"
                           type="number" />원</td>
                           
                  </tr>
                  </c:if>



                  <!-- 임시 행 장바구니 -->
                  
                  <c:set var="cal2" value="0" />
                  <c:forEach var="dto" items="${CartList }" >
                     <c:set var="cal2" value="${cal2+dto.gdsPrice*dto.cartCount}" />

                     <tr>
                        
                        <td><a href="#"><img src="${root }images/${dto.thumbImg }" alt="장바구니_상품3"></a></td>
                        <td>${dto.gdsName}:${dto.gdsNum }<br> <a
                           class="cartOption">[옵션] color : ${dto.cartColor } </a></td>
                        <td>${dto.cartCount }개</td>
                        <td>${dto.gdsPrice*0.02}원</td>
                        <td>${dto.gdsPrice }원</td>

                     </tr>
<!-- 장바구니 넘기기 forEach문이라 여기있어야함. -->
					 <input type="hidden" value="${dto.cartNum }" name="cartNum" />
					 <input type="hidden" value="${dto.gdsNum }" name="gdsNum" />
					 
                     <input type="hidden" value="${dto.gdsName}" name="ordName">
                     <input type="hidden" value="${dto.cartColor}" name=ordColor>
                     <input type="hidden" value="${dto.cartCount}" name="ordCount">
                     <input type="hidden" value="${dto.gdsPrice }" name="ordPrice" />
                  </c:forEach>
				
<!-- 넘기기 상품, 개인정보(배송지X), 은행명은 선택하면 입력, 결제방법은 무통장 고정 -->
                  
                  <tr>
                     <td>
                     	<input type="hidden" value="${OrdDto.gdsNum }" name="gdsNum" />
                        <input type="hidden" value="${OrdDto.gdsName }" name="ordName" />
                        <input type="hidden" value="${OrdDto.ordColor }" name="ordColor" />
                        <input type="hidden" value="${OrdDto.ordCount }" name="ordCount" />
<!-- 추가 -->                  <input type="hidden" value="${OrdDto.ordPrice }" name="ordPrice" />
                        <input type="hidden" value="${user.userNum }" name="userNum" />
                        <input type="hidden" value="${user.email }" name="email" />
                        <input type="hidden" name="payMethod" value="무통장입금">
                        <input type="hidden" id="bankName" name="bankName" value="" />

                     
<!-- 넘기기 금액, 쿠폰, 누적적립금, 사용적립금 -->                     
                              
                        <input type="hidden" name="cal" id="cal" value="${cal1+cal2 }">
                        <fmt:parseNumber var="point" value="${(cal1+cal2)*0.02 }"
                              integerOnly="true" />
                        <input type="hidden" name="point" id="point" value="${point}">
                        <c:set var="usePoint" value="0"/>
<!-- 추가 -->                  <c:set var="useCouponCal" value="0"/>
                        <input type="hidden" name="usePoint" id="usePoint" value="${usePoint }">
<!-- 추가 -->                  <input type="hidden" name="useCouponCal" id="useCouponCal" value="${useCouponCal }">
                        <input type="hidden" name="cpNum" id="useCp" class="useCp" value="0">
                     </td>   
                  </tr>




               </tbody>

               <tfoot class="cartFootLine">
                  <tr>
                     <td colspan="8">
                        <div class="cartFoot">
                           총 구매금액 : <strong><fmt:formatNumber value="${cal1+cal2 }"
                                 type="number" />원</strong> (적립금 :
                           <fmt:formatNumber value="${(cal1+cal2)*0.02 }" type="number" />
                           원)
                           <fmt:parseNumber var="point" value="${(cal1+cal2)*0.02 }"
                              integerOnly="true" />

                           
                        </div>
                     </td>
                  </tr>
                  <!-- 장바구니 적립금 안내 -->
                  <tr class="cartFootline2">
                     <td colspan="8">
                        <div class="cartFoot">회원님 구매 시 결제 금액의 2%를 적립해 드립니다.</div>
                     </td>
                  </tr>
               </tfoot>
            </table>
         </div>
      </div>


      <table class="shopping_cart_foot">
         <tr>
            <td colspan="8">
               <div class="subtitle1">주문자정보</div>
            </td>
         </tr>
      </table>



      <div class="tbl_order">
         <table class="tbl_orderTbl">

            <tbody>
               <tr>
                  <th style="width: 163px;">이름</th>
                  <td>${user.name }
                  <input type="hidden" id="name" class="MS_input_txt" value="${user.name }">
                  </td>
               </tr>
               <tr>
               </tr>
               <tr>
                  <th>이메일</th>
                  <td>${user.email }</td>
               </tr>
               <tr>
                  <th>연락처</th>
                  <td>${user.tel }
                  <input type="hidden" id="tel" size="4" maxlength="4" class="MS_input_txt w60" value="${user.tel }">
                  </td>
               </tr>
            </tbody>
         </table>
         <input type="hidden" id="mAddr" size="4" maxlength="4" class="MS_input_txt w60" value="${user.mAddr }">
         <input type="hidden" id="lAddr" size="4" maxlength="4" class="MS_input_txt w60" value="${user.lAddr }">
         <input type="hidden" id="dlAddr" size="4" maxlength="4" class="MS_input_txt w60" value="${user.dlAddr }">
      </div>


<!-- (위정보와같음구현)form, 배송지도 여기서 넘김 -->

      <form id="frm" action="" method="post">

         <div class="padding_shipping">
            <table class="shopping_cart_foot">
               <tr class="subtitle2_inline">
                  <td colspan="8" class="subltitle2"
                     style="font-size: 15px; font-weight: bold;">배송정보</td>
                  <td colspan="8" class="samechk"><input type="checkbox"
                     id="copy" onclick="NameToBill(this.form);" /> 위 정보와 같음</td>
               </tr>
            </table>
         </div>

         <div class="tbl_shipping">
            <table class="tbl-shippingTbl">
               <tbody>
                  <tr>
                     <th>이름</th>
                     <td><input type="text" id="receiver" name="receiver"
                        required /></td>
                  </tr>
                  <tr>
                     <th>연락처</th>
                     <td><input type="text" name="phone" id="tel2" size="4"
                        maxlength="4" class="MS_input_txt w60" required /></td>
                  </tr>
                  <tr>
                     <th>배송지 선택</th>
                     <td><input type="radio" value="1" form="order_form"
                        name="place" id="home"> 자택 <input type="radio" value="0"
                        form="order_form" name="place" id="newShip" onclick="NewShip();">
                        신규 배송지
                  </tr>

                  <tr>
                     <th>주소</th>
                     <td><div class="form-group">
                           <input class="form-control"
                              style="width: 20%; display: inline;" placeholder="우편번호"
                              name="addr1" id="addr1" type="text" readonly="readonly"
                              required> <a href="javascript:post();" type="button"
                              class="gdsDeleteBtn CSSbutton fa fa-search"
                              onclick="execPostCode();">우편번호 찾기</a>
                        </div>
                        <div class="form-group">
                           <input class="form-control"
                              style="top: 5px; width: 400px; margin-top: 5px;"
                              placeholder="도로명 주소" name="addr2" id="addr2" type="text"
                              required />
                        </div>
                        <div class="form-group">
                           <input class="form-control"
                              style="top: 5px; width: 400px; margin-top: 2px;"
                              placeholder="상세주소" name="addr3" id="addr3" type="text"
                              required />
                        </div></td>
                  </tr>

<!-- 넘기기 주문메시지, 입금자명 -->

                  <tr>
                     <th>주문메시지<br> <span>(100자내외)</span>
                     </th>
                     <td><textarea name="message" form="order_form" id="message"
                           cols="50" rows="5" class="MS_textarea"></textarea></td>
                  </tr>
                  <tr>
                     <th>무통장 입금자명</th>
                     <td><input type="text" name="depositor" id="depositor"
                        class="MS_input_txt" size="10" maxlength="40" required></td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="padding_payment">
            <table class="shopping_cart_foot">
               <tr class="subtitle2_inline">
                  <td colspan="8" class="subltitle2"
                     style="font-size: 15px; font-weight: bold;">주문상품 할인적용</td>
               </tr>
            </table>
         </div>



         <div id="contentWrapper">
            <div id="contentWrap">
               <table class="payment">

                  <colgroup>
                     <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
                     <col width="10%" />
                     <col width="10%" />
                     <col width="10%" />
                     <col width="10%" />
                     <col width="13%" />
                     <col width="10%" />
                  </colgroup>

                  <thead>
                     <tr height="50">
                        <th>상품금액</th>
                        <th>배송비</th>
                        <th>쿠폰할인</th>
                        <th>적립금사용</th>
                        <th>결제 예정금액</th>
                     </tr>
                  </thead>

                  <!-- 상품 리스트 부분 -->
                  <tbody>

                     <tr height="100">
                        <td><span><fmt:formatNumber value="${cal1+cal2 }"
                                 type="number" /></span>원</td>
                        <td><div class="base">
                              <span><a class="plus"><img src="${root }icon/ic_plus.png"
                                    alt="plus"></a>무료</span>
                           </div></td>
                        <td><div class="base">
                              <span><a class="minus"><img src="${root }icon/ic_minus.png"
                                    alt="minus"></a><span id='couponView'>
                                    0</span></span>원
                           </div></td>
                        <td><div class="base">
                              <span><a class="minus"><img src="${root }icon/ic_minus.png"
                                    alt="minus"></a><span id='pointView'>
                                    0</span></span>원
                           </div></td>
                        <td><div class="base">
                              <span><a class="plus"><img src="${root }icon/ic_equal.png"
                                    alt="equal"></a><span id="calView"
                                 class="redfont"><fmt:formatNumber value="${cal1+cal2 }"
                                       type="number" /></span></span>원

                           </div></td>

                     </tr>
                     <tr>

                     </tr>

                  </tbody>
                  
                  
                  
                  <tfoot>
                     <tr>
                        <td style="font-size: 1.2em; font-weight: bold;">쿠폰</td>
                        <td colspan="4" style="text-align: left">
                        
                        
                        
                                 <select style="width: 212px;"
                                        id="cpSelect" name="cpSelect"
                                       onchange="$('#inputCpClass').val($('#cpSelect').val().substring(0,$('#cpSelect').val().indexOf('|')));
                                               $('#cpNum').val($('#cpSelect').val().substring($('#cpSelect').val().indexOf('|')+1));"
                                       class="w280 MK_bank_select_list MK_pay_add_choice">
                                 <option value="0" id="cp0" class="cp0">보유쿠폰</option>
                                 
                                 <c:forEach var="cl" items="${cpList }" varStatus="status">
                                 
                                 <fmt:parseNumber value="${cl.cpRate*cal}"
                                    integerOnly="true" />
                                 
                                 <option value="${cl.cpRate }|${cl.cpNum } ">
                                    ${cl.cpName }   ${cl.cpRate }% 할인 쿠폰
                                 </option>                              
                                 </c:forEach>
                           </select>


                           
                           
                        <input type="button" class="button" onclick="getInputValue2(); calCulation(smart); getInputValue2();" value="적용">
                           
                           </td>
                           
                           
                     <tr>
                     
                        <td style="font-size: 1.2em; font-weight: bold;">적립금</td>
                                            <td colspan="4" style="text-align: left">
                        
                        
<!-- 적립금 입력창 숫자만 입력가능 -->                        
                        <input type="text" id="couponnum" class="inputPointClass" name="inputPointClass" onkeypress="inNumber();" value="0">                           
                           <input type="button" class="button" onclick="minPoint();" value="사용"> 

                   <c:set var="tp" value="${totalPoint}" />

<c:choose>



    <c:when test="${empty tp}">
     보유적립금 : 0원
    </c:when>
    <c:otherwise>
       보유적립금 : ${totalPoint.totalPoint }원
    </c:otherwise>


</c:choose>

                           </td>
                     </tr>
                     
                     <tr class="cartFootline2">
                        <td colspan="8">
                           <div class="cartFoot">적립금은 100원 단위로 사용하실 수 있습니다. 구매금액의 2%가 적립됩니다.</div>
                        </td>
                     </tr>

                     </tr>
                  </tfoot>
               </table>
            </div>
         </div>

         <div class="padding_payment">
            <table class="shopping_cart_foot">
               <tr class="subtitle2_inline">
                  <td colspan="8" class="subltitle2"
                     style="font-size: 15px; font-weight: bold;">결제정보</td>
               </tr>
            </table>
         </div>

         <div class="tbl_order">
            <table class="tbl_orderTbl">

               <tbody>
                  <tr>
                     <th>결제정보</th>
                     <td>
                        <ul class="pay-method">
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="SMILEPAY" checked="checked">
                              스마일페이 <em><span class="op-card-dc-price fc-red"></span></em></li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="PAYCO"> 페이코(PAYCO) <em><span
                                 class="op-card-dc-price fc-red"></span></em></li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="KAKAOPAY">
                              카카오페이(KAKAOPAY) <em><span class="op-card-dc-price fc-red"></span></em>
                           </li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="SSGPAY"> 쓱페이 (SSG PAY) <em><span
                                 class="op-card-dc-price fc-red"></span></em> <select
                              name="ssgpay_select"
                              class="MK_ssgpay_select MK_pay_add_choice">
                                 <option value="SGC">SSG CARD</option>
                                 <option value="SGM">SSG MONEY</option>
                           </select></li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="C"> 신용카드 <em><span
                                 class="op-card-dc-price fc-red"></span></em></li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="B" checked="checked" /> 무통장입금 <em><span
                                 class="op-bank-dc-price fc-red"></span></em> <select required
                              onchange="document.getElementById('bankName').value = this.options[this.selectedIndex].value"
                              class="w280 MK_bank_select_list MK_pay_add_choice">
                                 <option value="">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
                                 <option value="농협중앙회 123456789123456 (예금주:주식회사수확행)">농협중앙회
                                    123456789123456 (예금주:주식회사수확행)</option>
                                 <option value="국민은행 123456789123456 (예금주:주식회사수확행)">국민은행
                                    123456789123456 (예금주:주식회사수확행)</option>
                           </select></li>
                           <li><input type="radio" class="chk-rdo"
                              name="radio_paymethod" value="D"> 휴대폰 결제 <em><span
                                 class="op-hp-dc-price fc-red"></span></em></li>
                        </ul>
                     </td>

                  </tr>

               </tbody>
            </table>
         </div>

         <div class="padding_payment">
            <table class="shopping_cart_foot">
               <tr class="subtitle2_inline">
                  <td colspan="8" class="subltitle2"
                     style="font-size: 15px; font-weight: bold;">주문자동의</td>
               </tr>
            </table>
         </div>

         <div class="tbl_endPrice">
            <table class="tbl_endPriceTbl">

               <tbody>
                  <tr>
                     <td colspan="2"><input type="checkbox" id="pay_agree"
                        name="pay_agree" required /> 상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</td>
                  </tr>
                  <tr class="endPrice" height="100px">
                     <th><strong>최종 결제금액</strong></th>
                     <td><strong><span id="LastCalView"
                                 class="redfont"><fmt:formatNumber value="${cal1+cal2 }"
                                       type="number" /></span></strong> 원
                        &nbsp; (적립예정: <span id="lastPoint"><fmt:formatNumber
                              value="${(cal1+cal2)*0.02 }" type="number" /></span>원)
                        <div class="reserve-msg">(적립 예정금액과 최종 적립금액은 상이할 수 있습니다. 주문
                           완료 시 지급되는 적립금을 확인해주시기 바랍니다.)</div></td>
                  </tr>

               </tbody>
            </table>
         </div>
         <table class="shopping_cart_foot">
            <tr>
               <td colspan="8">
                  <div class="btnOrderCtr">
                     <input type="submit" class="OrderBtn" value="주문하기" form="payment">
                     <a href="${root }shop" class="CancelBtn">주문취소</a>
                  </div>
               </td>
            </tr>
         </table>
         <br> <br> <br> <br> <br> <br>


      </form>
   </form>

<!-- 쿠폰적용, 적립금 계산기 화면 -->                     
                        <input type="hidden" id="inputCpClass" class="inputCpClass" name="inputCpClass" value="0">
                        <input type="hidden" id="cpNum" class="cpNum" name="cpNum" value="0">                           
                        <input type="hidden" id="totalPoint" value="${totalPoint.totalPoint }">
    
 <!-- 계산기 -->
   <!-- <div style="display: none"> -->
   <div>
      <form id="smart" onload="calCulation(smart);">
            <input type='hidden' name='first' size='7' value="${cal1+cal2 }" onKeyUp=calCulation(smart); readonly>
            <input type='hidden' name='second' size='7' id="calPoint" value="0" onKeyUp=calCulation(smart);>
            <input type='hidden' name='third' size='7' id="calCoupon" value="0" onKeyUp=calCulation(smart);>
            <input type='hidden' name='cpCal' class="cpCal" size='7' value="0" readonly>
            <input type='hidden' name='pointTotal' class="pointTotal" size='7' value="0" readonly>
            <input type='hidden' name='totalCal' class="totalCal" size='7' value="${cal1+cal2 }">
            
            
      </form>
   </div>


<!-- 스크립트 -->
<!-- 주소설정1  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js">
   var element_layer = document.getElementById('layer');

   //주소 검색 닫아주기
   function closeDaumPostcode() {
      // iframe을 넣은 element를 안보이게 한다.
      element_layer.style.display = 'none';
   }

   //주소 검색 열어주기
   function openDaumPostcode(userZipCode, userFirstAddr, userSecondAddr) {
      new daum.Postcode({
         oncomplete : function(data) {
            document.getElementById(userZipCode).value = data.zonecode;
            document.getElementById(userFirstAddr).value = data.address;
            document.getElementById(userSecondAddr).focus();
            element_layer.style.display = 'none';
         },
         width : '100%',
         height : '100%'
      }).embed(element_layer);
      element_layer.style.display = 'block';
      initLayerPosition();
   }

   //팝업창 세부 설정
   function initLayerPosition() {
      var width = 300; //우편번호서비스가 들어갈 element의 width
      var height = 460; //우편번호서비스가 들어갈 element의 height
      var borderWidth = 5; //샘플에서 사용하는 border의 두께

      // 위에서 선언한 값들을 실제 element에 넣는다.
      element_layer.style.width = width + 'px';
      element_layer.style.height = height + 'px';
      element_layer.style.border = borderWidth + 'px solid';
      // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
      element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
            + 'px';
      element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
            + 'px';
   }
</script>
<!-- 주소설정2  -->
<script type="text/javascript">
      var name = "";
      var tel = "";

      function InitValue(frm) {

         name = frm.name.value;
         tel = frm.tel.value;

      }

      function NameToBill(frm) {

         if (frm.copy.checked) {

            InitValue(frm); //현재 텍스트박스와 체크박스의 상태유지

            document.getElementById("receiver").value = document
                  .getElementById("name").value;
            document.getElementById("tel2").value = document
                  .getElementById("tel").value;
            document.getElementById("addr1").value = document
                  .getElementById("mAddr").value;
            document.getElementById("addr2").value = document
                  .getElementById("lAddr").value;
            document.getElementById("addr3").value = document
                  .getElementById("dlAddr").value;
            document.getElementById("depositor").value = document
                  .getElementById("name").value;
            $("input:radio[id='home']").prop("checked", true);

         }

         else { //체크박스를 해제한다면
            document.getElementById("receiver").value = "";
            document.getElementById("tel2").value = "";
            document.getElementById("addr1").value = "";
            document.getElementById("addr2").value = "";
            document.getElementById("addr3").value = "";
            $("input:radio[id='home']").prop("checked", true);
         }

      }

      $(document)
            .ready(
                  function() {

                     // 라디오버튼 클릭시 이벤트 발생
                     $("input:radio[name=place]")
                           .click(
                                 function() {

                                    if ($("input[id=home]:checked")
                                          .val() == "1") {
                                       document
                                             .getElementById("addr1").value = document
                                             .getElementById("mAddr").value;
                                       document
                                             .getElementById("addr2").value = document
                                             .getElementById("lAddr").value;
                                       document
                                             .getElementById("addr3").value = document
                                             .getElementById("dlAddr").value;

                                    } else if ($(
                                          "input[id=newShip]:checked")
                                          .val() == "0") {
                                       document
                                             .getElementById("addr1").value = "";
                                       document
                                             .getElementById("addr2").value = "";
                                       document
                                             .getElementById("addr3").value = "";
                                    }
                                 });
                  });

      function execPostCode() {
         new daum.Postcode({
            oncomplete : function(data) {
               
               var fullRoadAddr = data.roadAddress; 
               var extraRoadAddr = ''; 

               
               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraRoadAddr += data.bname;
               }
               
               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraRoadAddr += (extraRoadAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               
               if (extraRoadAddr !== '') {
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               
               if (fullRoadAddr !== '') {
                  fullRoadAddr += extraRoadAddr;
               }

               
               console.log(data.zonecode);
               console.log(fullRoadAddr);

               $("[name=addr1]").val(data.zonecode);
               $("[name=addr2]").val(fullRoadAddr);

            }
         }).open();
      }
   </script>
   
<!-- 계산함수, 적용함수, 넘기기함수 -->
   <script type="text/javascript">
function minPoint(){    
   var A = document.getElementById('couponnum').value  
   var B = document.getElementById('totalPoint').value
   
   
   if(A%100 != 0){
      alert("적립금은 100원 단위로 사용하실 수 있습니다.");
   }
   else if(A>B){
      alert("적립금이 부족합니다.");
      
   }
   else{
       getInputValue(); calCulation(smart); getInputValue();
   }
}

function inNumber(){
     if(event.keyCode<48 || event.keyCode>57){
        event.returnValue=false;
     }
   }


function calCulation(smart){

         first = parseInt(smart.first.value);
          second = parseInt(smart.second.value);
          third = parseFloat(smart.third.value);
          smart.cpCal.value= first*third;   
          smart.totalCal.value = first-second-(third*first);
          smart.pointTotal.value = (first-second-(third*first))*0.02;
          
          
}

</script>
<script type="text/javascript">
    function getInputValue(){
        
        var valueByClass = $('.inputPointClass').val();
        var valueByClass2 = $('.totalCal').val();
        var valueByClass3 = $('.inputCpClass').val();
        var valueByClass5 = $('.pointTotal').val();
                
        
        document.getElementById('pointView').innerText = valueByClass;
        document.getElementById('calPoint').value=valueByClass;
        document.getElementById('calView').innerText=valueByClass2;
        document.getElementById('LastCalView').innerText=valueByClass2;
        document.getElementById('lastPoint').innerText=valueByClass5;
        
        
        document.getElementById('cal').value=valueByClass2;
        document.getElementById('point').value=valueByClass5;
        document.getElementById('usePoint').value=valueByClass;
        
        
    }
    
    function getInputValue2(){
        
        var valueByClass = $('.inputPointClass').val();
        var valueByClass2 = $('.totalCal').val();
        var valueByClass3 = $('.inputCpClass').val();
        var valueByClass4 = $('.cpNum').val();
        var valueByClass5 = $('.pointTotal').val();
      var valueByClass6 = $('.cpCal').val();
        
        document.getElementById('calCoupon').value=valueByClass3;
        document.getElementById('couponView').innerText = valueByClass6;
        document.getElementById('calView').innerText=valueByClass2;
        document.getElementById('LastCalView').innerText=valueByClass2;
        document.getElementById('lastPoint').innerText=valueByClass5;
        
        document.getElementById('cal').value=valueByClass2;
        document.getElementById('point').value=valueByClass5;
        document.getElementById('useCp').value=valueByClass4;
        document.getElementById('useCouponCal').value=valueByClass6;
        
        
    }


    
</script>
   </body>
</html>