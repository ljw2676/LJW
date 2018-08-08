<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 완료</title>
<script>
	function end(){
		window.opener.location.href="http://localhost:8080/yogi/";
		self.close();
	}
</script>
</head>
<body>
	비밀번호 변경이 완료되었습니다.
	<input type="button" onclick="end()" value="확인"/>
</body>
</html>