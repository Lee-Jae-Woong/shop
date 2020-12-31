<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>

	<!-- <link rel="stylesheet" href="css/home.css" /> -->
	<%@include file="topBar.jsp"%>
	<c:set var="user" value="${sessionScope.loginUser}"/>
	
	<style>
        a{ cursor: pointer; text-decoration: none;}
        a:link {text-decoration: none; color: rgb(0, 0, 0);}
        a:visited {text-decoration: none; color: rgb(0, 0, 0);}
        a:active {text-decoration: none; color: rgb(0, 0, 0);}

        .s_code{
           /*  margin-top: 5%;
            margin-bottom:50px; */
            top:15%;
            display: block;
            font-size: 1em;
            font-weight: bold;
            text-align: left;
            text-indent: 10px;
            position:absolute;
        }
        .stock_state{
        /*  margin-top: 5%;
         margin-left:50px;
          margin-bottom:50px; */
          top:15%;
          left:40%;
          color:red;
            display: block;
            font-size: 1em;
            font-weight: bold;
            text-align: left;
            text-indent: 10px;
            position:absolute;
        }

        .gds_name{
            
            width: 100px;
            height: 25px;
            text-align: left;
            display: block;
            position: absolute;
            font-size: 1.5em;
            font-weight: 300;
            text-indent: 10px;
            margin-top: 40px;
            

        }
        .gds_price{
            text-align: left;
            width: 200px;
            height: 25px;
            margin-top: 45px;
            display: block;
            position: absolute;
            font-size: 18px;
            font-weight: bold;
            text-indent: 10px;
            
            left: 40%;
            
        }
        .review{
            width: 85px;
            text-indent: 10px;
            text-align: left;
            display: block;
            font-size: 1.8ex;
            position: relative;
            border-bottom: 1px solid rgba(0,0,0,0.7);
            top:80%;
        }

        .favorite{
            margin-top: 30%;
        }

        .favorite-div{
            display: inline-block;
            margin-top: 30%;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border-radius: 150px;
            background: #ffffff;
            box-shadow:  5px 5px 17px #e6e6e6, 
                        -5px -5px 17px #ffffff;
            
        }
        .favorite-div:hover{
            border-radius: 50%;
            background: linear-gradient(145deg, #e6e6e6, #ffffff);
            box-shadow:  10px 10px 26px #f0f0f0, 
                        -10px -10px 26px #ffffff;
        }

      
        .list_main{
            text-align: center; 
            
        }
       
        .main-reg{
            width: 450px;
            height: 550px;
            margin-left: 60px;
            margin-top: 70px;
            background-color: cadetblue;
            display: inline-block;
            position: relative;
            border-radius: 10px;
            background: #ffffff;
            box-shadow:  6px 6px 25px #e3e3e3, 
                        -6px -6px 25px #ffffff;
            
        }
        .inner-reg1{
            margin-top: 20px;
            margin-left: 25px;
            margin-bottom: 5px;
            width: 400px;
            height: 400px;
            background-color: darkblue;
            
        }
        .inner-reg2{
            width: 300px;
            height: 100px;
            margin-left:25px;
            position: absolute;
            
        }
        .inner-reg3{
            width: 100px;
            height: 100px;
            position: absolute;
            margin-left: 325px;
        }
    </style>
</head>
<body>
    <body>
        
        <div class="list_main">
         <c:forEach var="dto" items="${GdsInfoList}">
         	<a href="${root }shop?gds=${dto.gdsNum}">
            <div class="main-reg">
                <div class="inner-reg1">
                    <img src="images/${dto.thumbImg}" width="400px" height="400px"/>
                </div>
                <div class="inner-reg2">
                	
                    <span class="s_code">${dto.cateName }</span>
                    <c:choose>
                    	<c:when test="${dto.gdsStock < 1 }">
                    	<span class="stock_state">Sold Out</span>
                    	</c:when>
                    	<c:when test="${dto.gdsStock < 30 }">
                    	<span class="stock_state">마감임박</span>
                    	</c:when>
                    
                    </c:choose>
                    <span class="gds_name">${dto.gdsName }</span>
                    <span class="gds_price">&#8361;${dto.gdsPrice } x 1ea</span>
                    <a href="#"><span class="review">리뷰 ${dto.review_count}개</span></a>
                </div>
                <div class="inner-reg3">
                    <div class="favorite-div">
                    <c:choose>
                    	<c:when test="${dto.like eq false}">
                    	<div class="favorite" id="userlike" value="like"><img src="images/favorite_border.svg" class="unactive" value="${dto.gdsNum}"/></div>
                    	</c:when>
                    	<c:when test="${dto.like eq true}">
                    	<div class="favorite" id="userlike" value="dislike"><img src="images/favorite-black.svg" class="unactive" value="${dto.gdsNum}"/></div>
                    	</c:when>
                    </c:choose>
                        
                    </div>
                </div>
            </div>
            </a>
          </c:forEach>  
        </div>
    
</body>
<script>
$(document).ready(function() {
    $(".favorite > img").on("click", function() {
    		let like = $(this).parent().attr('value');
    		let gdsNum = $(this).attr('value')
    		let check= "<c:out value='${sessionScope.loginUser.check}'/>";
    		if(check === "false"){
				alert("로그인 후 사용가능합니다");
				location.href='${root}login';
				return false;
			}
    		
    		let userNum = "<c:out value='${sessionScope.loginUser.userNum}'/>";
			let result={"gdsNum" : gdsNum, "userNum": userNum};
			
			if(like =='like'){
	    		
    			fetch('${root}shop/like',{
            		method: 'POST',
            		headers:{
               			'Content-Type':'application/json;charset=utf-8' 
            		},
            		body:JSON.stringify(result) 
         		})
         		
         		$(this).prop("src", "images/favorite-black.svg");
     			like.setAttribute('value','dislike');
    	 	
    		}else{
    			
    			fetch('${root}shop/dislike',{
            		method: 'POST',
            		headers:{
               			'Content-Type':'application/json;charset=utf-8' 
            		},
            		body:JSON.stringify(result) 
         		})
    	    	
    	    	$(this).prop("src", "images/favorite_border.svg");
    	    	like.setAttribute('value','like');
    	    	
    	    	
    	    }
			
    	
		});
   
});
</script>
</html>