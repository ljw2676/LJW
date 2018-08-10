<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<script>
	function end(){
		window.opener.location.href="http://localhost:8080/yogi/members/find";
		self.close();
	}
</script>
</head>
<body>
	잘못입력하셨습니다.<br>
	<input type="button" onclick="end()" value="확인"/>
</body>
</html>