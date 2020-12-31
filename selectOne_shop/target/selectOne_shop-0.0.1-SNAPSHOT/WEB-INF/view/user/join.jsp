<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}css/join.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
  function checkUserId(){
  	const id = $("#id").val();
  	
  	if(id.length == 0){
  		alert('아이디를 입력해 주세요');
  		return;
  	}
  	
  	$.ajax({
  		url : '${root}join/checkUserId/'+id,
  		type : 'get',
  		dataType : 'text',
  		success : function(result){
  			if(result.trim() == 'true'){
  				alert('사용할 수 있는 아이디입니다');
  				$("#checkId").val('true')
  			}else{
  				alert('사용할 수 없는 아이디입니다');
  				$("#checkId").val('false')
  			}
  		}
  	})
  }
  function resetUserId(){
  	$("#checkId").val("false");
  }
</script>
<%@include file="../topBar.jsp"%>
</head>
<body>
	<img class="back">
  <div class="joinbody">
    <h2 class="jointitle">Sign Up</h2>
    <div>
      <form:form action="${root }join/join_proc" method="post" modelAttribute="userDTO">
			<form:hidden path="checkId"/>
        <div class="info">
          <div class ="joinmuen">
            <h3 class="joinarticle">이름</h3>
            <div class="joininput">
              <form:input path="name" name="name" class="inputbar" type="text"/>
              <p class="warning"><img src="${root}images/alert_img.jpg">회원 이름은 2~15 글자여야 합니다</p>
              <form:errors path="name" class="error"/>
            </div>
          </div>
          <div class ="joinmuen">
            <h3 class="joinarticle">아이디</h3>
            <div class="joininput">
              <form:input path="id" id="id" name="id" class="inputbar" type="text" />
              <p class="warning"><img src="${root}images/alert_img.jpg">아이디는 4~20 글자여야 합니다</p>
              <div>
                <button class="overlap" type="button" onclick="checkUserId();">중복확인</button>
              </div>
              <form:errors path="id" class="error"/>
            </div>
          </div>
          <div class ="joinmuen">
            <h3 class="joinarticle">비밀번호</h3>
            <div class="joininput">
              <form:input path="pw1" id="pw1" name="pw1" class="inputbar" type="password" />
              <p class="warning"><img src="${root}images/alert_img.jpg">숫자 영문자 특수 문자를 포함한 8 ~ 12 자를 입력하세요.</p>
              <form:errors path="pw1" class="error"/>
            </div>
          </div>
          <div class ="joinmuen">
            <h3 class="joinarticle">비밀번호확인</h3>
            <div class="joininput">
              <form:input path="pw2" id="pw2" name="pw2" class="inputbar" type="password" />
              <p class="warning"><img src="${root}images/alert_img.jpg">비밀번호을 확인해주세요</p>
              <form:errors path="pw2" class="error"/>
            </div>
          </div>
          <div class ="joinmuen">
            <h3 class="joinarticle">이메일</h3>
            <div class="joininput">
              <form:input path="email" id="email" name="email" class="inputbar" type="email" />
              <p class="warning"><img src="${root}images/alert_img.jpg">이메일 형식으로 작성해주세요</p>
              <form:errors path="email" class="error"/>
            </div>
          </div>
          <div class ="joinmuen">
            <h3 class="joinarticle">전화번호</h3>
            <div class="joininput">
              <form:input path="tel" id="tel" name="tel" class="inputbar" type="tel" />
              <p class="warning"><img src="${root}images/alert_img.jpg">"-"없이 입력해주세요</p>
              <form:errors path="tel" class="error"/>
            </div>
          </div>
        </div>
        <div class ="addrinfo">
          <h3 class="addrtitle">Address</h3>
          <div>
            <h4 class="addr">우편번호</h4>
            <div class="addrinput">
              <form:input path="mAddr" name="mAddr" class="postcodify_postcode5" />
               <button type="button" id="postcodify_search_button">검색</button>
               <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
							 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
							 <script>
									$(function() {
										$("#postcodify_search_button").postcodifyPopUp();
									});
								</script>
              <form:errors path="mAddr" class="addrerror"/>
            </div>
            <h4 class="addr">도로명 주소</h4>
            <div class="addrinput">
              <form:input path="lAddr" name="lAddr" class="postcodify_address" />
              <form:errors path="mAddr" class="addrerror"/>
            </div>
            <h4 class="addr">상세주소</h4>
            <div class="addrinput">
              <form:input path="dlAddr" name="dlAddr" class="postcodify_details" />
               <form:errors path="dlAddr" class="addrerror"/>
            </div>
            <div class="result">
              <input id="btn" class="move" type="submit" value="회원가입">
              <button class="move" type="reset">다시작성</button>
              <button class="move" type="button" onclick="location.href='${root}/'">취소</button>
            </div>
          </div>
        </div>
      </form:form>
    </div>
  </div>
  <%@include file="../footBar.jsp"%>
</body>
</html>