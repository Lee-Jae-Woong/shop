<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <title>위시리스트</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/userlike.css">
    <%@include file="topBar.jsp"%>
</head>

<body>
    <div id="contentWrapper">
        <div id="contentWrap">
            <table class="userLikeList">
				<h2></h2>
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
                        <th><input class="userLike_00" type="checkbox" name="chk_01" value="userLike_01"></th>
                        <th>사진</th>
                        <th class="userLikeleft">상품번호</th>
                        <th>상품명</th>
                       
                    </tr>
                </thead>
			
                <!-- 상품 리스트 부분 -->
                
                <tbody>
           	        <c:set var="userLike" value="0"/>
                    <c:forEach var="userlike" items="${UserLikeList }">
    
              		<tr>
                    	<td><input class="userLike_02" type="checkbox" name="chk_02" value="userLike_02"></td>
                    	<td><a href="#"><img src="images/${userlike.thumbImg }" alt="장바구니_상품3"></a></td>
                    <td>
                    	상품번호 :${userlike.gdsNum }
                    </td>
                    <td>
                   	 	상품명 :${userlike.gdsName }
                    </td>
                 
                    </tr>
              		
            		</c:forEach>
                    
                    
                </tbody>
                <tfoot class="userLikeListFootLine">
                	<table class="userLikeList_foot">
		                <tr>
		                    <td colspan="8">
		                        <div class="btnDeleteCtr">
		                            <a href="" class="gdsDeleteBtn">선택상품 삭제</a>
		                        </div>
		                    </td>
		                </tr>
                </tfoot>
            </table>
         </div>
    </div>
</body>

</html>