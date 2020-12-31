<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<html lang="ko">
<head>
<title>장바구니</title>
<meta charset="utf-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${root}css/cart.css">
<%@include file="topBar.jsp"%>
</head>
<body>
	<div id="contentWrapper">
		<div id="contentWrap">
			<h2></h2>
			<table class="shopping_cart">

				<!-- 각 열의 데이터 길이를 고려해서, 최적의 너비값 설정 -->
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="30%" />
					<col width="20%" />
					<col width="8%" />
					<col width="10%" />
					<col width="7%" />
					<col width="10%" />
				</colgroup>

				<thead>
					<tr>
						<th><input class="cart_00" type="checkbox" id="checkAll">
						<th>사진</th>
						<th>상품명</th>
						<th>수량</th>
						<th>적립금</th>
						<th>가격</th>
						<th>배송비</th>
						<th>선택</th>
					</tr>
				</thead>

				<!-- 상품 리스트 부분 -->
				<tbody>
					<c:set var="cal" value="0" />
					<c:forEach var="dto" items="${CartList}">
						<c:set var="cal" value="${cal+dto.gdsPrice*dto.cartCount}"/>
						<tr id="tr_value">
							<td><input class="checkList" type="checkbox" id="cartNum" name="chk_order" value="${dto.cartNum}"></td>
							<td><a href="#"><img src="images/${dto.thumbImg }" alt="장바구니_상품3"></a></td>
							<td>상품번호 : ${dto.gdsNum }<br> <a class="cartOption">[옵션] color : ${dto.cartColor} </a>
							</td>
							<td>
								<div class="cartCountChangeEdge">
									<div class="cartCountChange">
										<a type="button" class="btnDw" id="bt_down">-</a>
										<input type="text" id="num" class="txtSpin" name="count" value="${dto.cartCount}" onchange="change();">
										<a type="button" class="btnUp" id="bt_up">+</a>
										<a class="cartCountBtn">수정</a>
									</div>
								</div>
							</td>
							<td>${dto.gdsPrice*dto.cartCount*0.02}</td>
							<td>${dto.gdsPrice}</td>
							<td>[기본배송]<br>조건
							</td>
							<td><span id="delete" onclick="location.href='cart/delete?cartNum=${dto.cartNum}'">×</span><br>
								<!-- <p>관심상품담기</p></td> -->
						</tr>
						</c:forEach>
				</tbody>
				<tfoot class="cartFootLine">
					<!-- 장바구니 결제 금액 -->
					<tr>
						<td colspan="8">
							<div class="cartFoot">
								총 구매금액 : ${cal } 원 <strong>${cal }원</strong> (적립금 : ${cal*0.02}원)
							</div>
						</td>
					</tr>
					<!-- 장바구니 적립금 안내 -->
					<tr>
						<td colspan="8">
							<div class="cartFoot">회원님은 1원이상 구매 시 결제 금액의 2%를 적립해 드립니다.</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<table class="shopping_cart_foot">
				<tr>
					<td colspan="8">
						<div class="btnDeleteCtr">
						<a type="button" id="delete" class="DeleteBtn" name="DeleteBtn" href="javascript:void(0)" onclick="deleteCart();" >선택상품 삭제</a>
						</div> 
					</td>
				</tr>
				<tr>
					<td colspan="8">
						<div class="btnOrderCtr">
							<a href="${root }cart/order" class="allGdsBtn">전체상품 주문</a>
							<a href="javascript:void(0)" type="button" class="selectGdsBtn" onclick="chkOrder(this)">선택상품 주문</a>
							<a href="javascript:void(0)" id="deleteAll" class="cartClear">장바구니 비우기</a>
							<a href="${root }" class="shopingContinue">쇼핑 계속하기</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script>
	function select_chkBox() {
		let check = document.getElementsByName('chk_order');
		let cartNums = '?';
		let count = 0;
		for (let i = 0; i < check.length; i++) {
			if (check[i].checked) {
				if (count != 0) {
					cartNums += '&'
				}
				cartNums += 'num=' + check[i].value;
				count ++;
			}
		}
		// ?num=100&num=200&num=300
		return cartNums;
		}
	
		function chkOrder() {
			let cartNums = select_chkBox();
			location.href = 'cart/orderSelect' + cartNums;
		}
		function deleteCart() {
			let cartNums = select_chkBox();
			location.href = 'cart/deleteChoice' + cartNums;
		}
		

		// 체크박스
		$(document).ready(function() {
			$('#checkAll').click(function() {
				if ($("#checkAll").prop("checked")) {
					$("input[type=checkbox]").prop("checked", true);
				} else {
					$("input[type=checkbox]").prop("checked", false);
				}
			});


		});


		//전체삭제 

		$("#deleteAll").click(function() {
			if (confirm("장바구니를 비울까요?")) {
				location.href = "cart/deleteAll";
			} else {
				return false;
			}
		});



		// 장바구니 수량 조정
		$(function() {
			$('.btnUp').click(function() {
				let n = $('.btnUp').index(this);
				let num = $(".txtSpin:eq(" + n + ")").val();
				if (num < 100) {
					num = $(".txtSpin:eq(" + n + ")").val(num * 1 + 1);
				} else {
					num = 100;
				}
			});
			$('.btnDw').click(function() {
				let n = $('.btnDw').index(this);
				let num = $(".txtSpin:eq(" + n + ")").val();
				if (num > 1) {
					num = $(".txtSpin:eq(" + n + ")").val(num * 1 - 1);
				} else {
					num = 1;
				}
			});
		});

		// 장바구니 값 수정하기
		$(function() {
			$('.cartCountBtn').click(function(){
				let n = $('.cartCountBtn').index(this);
				let cartCount = $(".txtSpin:eq(" + n + ")").val();
				
				
				let cartNum =  $(".checkList:eq(" + n + ")").val();

				
				location.href="cart/cartUpdate?cartCount="+cartCount+"&cartNum="+cartNum;
				
				
			});
			
		});




		// 선택삭제
		$('#DeleteBtn').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				$("input[name=chk_order]:checked").each(function() {
					let value = $(this).val();
				});
			} else {
				return false;
			}

		});



		
	</script>
</body>

</html>