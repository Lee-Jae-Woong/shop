<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <title>위시리스트</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/userlike.css">
    <%@include file="topBar.jsp"%>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
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
                    	<td><input class="userlike_02" type="checkbox" data-gdsNum="userlike.gdsNum" name="userlike_02" value="userlike.gdsNum"></td>
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
<script>


 $("#chk_01").click(function(){
	
	 var chk = $("#chk_01").prop("checked");
	 if(chk) {
	  $(".userlike_02").prop("checked", true);
	 } else {
	  $(".userlike_02").prop("checked", false);
	 }
});
	/*
$(".gdsDeleteBtn").on("click", function(){
	 var confirma = confirm("정말 삭제하시겠습니까?");
	  if(confirma) {
	   var checkArr = new Array();
		 $("input[class='userlike_02']:checked").each(function(){
			    checkArr.push($(this).attr("data-gdsNum"));
			   });
		 
		 $.ajax({
			    url : "${root}shop/checkdislike",
			    type : "POST",
			    contentType: 'application/json',
			    data : 	{userlike_02 : checkArr} ,
			    success : function(result){
			    	  if(result == 1) {  	        
			    	   location.href = "userlike";
			    	  } else {
			    	   alert("삭제 실패");
		    	  }	
		    }
		});
	}
}); */
 
$("#chk_01").click(function(){
	
	 var chk = $("#chk_01").prop("checked");
	 if(chk) {
	  $(".userlike_02").prop("checked", true);
	 } else {
	  $(".userlike_02").prop("checked", false);
	 }
});
	
$(".gdsDeleteBtn").on("click", function(){
	 
	   var checkArr =	[];
		 $("input[class='userlike_02']:checked").each(function(i){
			    checkArr.push($(this).attr("data-gdsNum"));
			   });
		var objParams = {
				"gdsNum" : $("#userlike_02").val(),	
				"checkList" : checkArr
		};
		
		console.log(checkArr);
		
		 $.ajax({
			    url : "${root}shop/checkdislike",
			    dataType : "json",
			    type : "POST",
			    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			    data : 	objParams ,
			    success : function(retVal){
			    	  if(retVal.code == "OK") {  	        
			    	   alert(reVal.message);
			    	  } else {
			    		  alert(reVal.message);
		    	  }	
			    },
               error       :   function(request, status, error){
                   console.log("AJAX_ERROR");
               }
         });
         
     }); 
     
 


</script>
</html>