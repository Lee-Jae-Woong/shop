<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form name="fileForm" action="${root }review_test" method="post" enctype="multipart/form-data"">
            	<input id="uploadFiles" multiple="multiple" type="file" name="filenames" onchange="upload()"/>
    			<div id="thumbimgs"></div>
    			
    			<!-- Score <input type="radio" name="score" value="1">1
    			<input type="radio" name="score" value="2">2
    			<input type="radio" name="score" value="3">3
    			<input type="radio" name="score" value="4">4
    			<input type="radio" name="score" value="5">5<br> 
    			Content <textarea id="content" name="content"></textarea> -->
    			<input type="text" name="src" />
    			<button type="submit" >Send</button>
    			<br><br>
    			
    </form>

</body>
</html>