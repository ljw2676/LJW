<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과창!</title>
<script>
	function end(){
		window.opener.location.href="http://localhost:8080/yogi/";
		self.close();
	}
</script>
<body>
	${member.m_name}의 아이디눈!!!! "${member.m_id}"
	<input type="button" onclick="end()" value="확인"/>
</body>
</html>