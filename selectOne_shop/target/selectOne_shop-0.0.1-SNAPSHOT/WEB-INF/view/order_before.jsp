<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<html>
<head>
    <title>구매하기</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${root }css/cart.css">
    <%@include file="topBar.jsp"%>
</head>

<body>
    <div id="contentWrapper">
        <div id="contentWrap">
            <h2>주문서 작성</h2>
            <table class="shopping_cart">

                <colgroup>
                    <!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
                    <col width="5%" />
                    <col width="10%" />
                    <col width="33%" />
                    <col width="18%" />
                    <col width="7%" />
                    <col width="10%" />
                    <col width="7%" />
                    <col width="10%" />
                </colgroup>

                <thead>
                    <tr>
                        <th>상품번호</th>
                        <th>사진</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>적립금</th>
                        <th>가격</th>
                  
                    </tr>
                </thead>

                <!-- 상품 리스트 부분 -->
                <tbody>
           	        <c:set var="cal" value="0"/>
                    <c:forEach var="dto" items="${List }">
                    <c:set var="cal" value="${cal+dto.cartPrice}" />
              			<tr>
                    <td>${dto.gdsNum }</td>
                    <td><a href="#"><img src="${root }images/1.jpg" alt="장바구니_상품3"></a></td>
                    <td>상품명 : 상품명 추가할것<br>
                        <a class="cartOption">[옵션] color : ${dto.cartColor } </a>
                    </td>
                    <td>
                        <div class="cartCountChangeEdge">
                            <div class="cartCountChange">
                     			<span>${dto.cartCount }</span>     
                            </div>
                        </div>
                    </td>
                    <td>${dto.cartPrice*0.02}</td>
                    <td>${dto.cartPrice }</td>
                   
                    </tr>
              		
            		</c:forEach>
                
                    
                </tbody>
                <tfoot class="cartFootLine">
                    <!-- 장바구니 결제 금액 -->
                    <tr>
                        <td colspan="8">
                            <div class="cartFoot">
                                총 구매금액 : ${cal } 원 <strong>${cal }원</strong> (적립금 : 256원)
                            </div>
                        </td>
                    </tr>
                   
                </tfoot>
            </table>
            <table>
            <h3>주문자 정보</h3>
            	이름:<input type="text" name="name" /><br>
            	이메일:<input type="text" name="email"/> <input type="text" name="email"/><input type="text" name="email"/>
            </table>
            <table>
            <h3>배송 정보</h3>
            </table>
            <table class="shopping_cart_foot">
          
                <tr>
                    <td colspan="8">
                        <div class="btnOrderCtr">
                            <a href="" class="allGdsBtn">결재하기</a>
                            <a href="" class="allGdsBtn">취소하기</a>
                           
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
   
</body>



</html>