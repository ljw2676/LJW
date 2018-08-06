<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>첫화면</title>
<script>
function insert() {
		var join = document.userinput
		if (join.m_id.value == "") {
			/* alertify.error("아이디를 입력해주세요"); */
			alert("아이디를 입력해주세요");
			join.m_id.focus();
			return false;
		}
		
		if (join.m_password.value == "") {
			/* alertify.error("비밀번호를 입력해주세요"); */
			alert("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}
		join.submit();
}
</script>
</head>
<body>
	첫화면 <br>
	<a href="http://localhost:8080/yogi/members/createForm">회원가입</a>
	<br>로그인<br>
	<form:form commandName="member" name="userinput" method="post">
		<input type="text" name="m_id"/>
		<input type="text" name="m_password"/>
		<input type="button" value="제출!" onclick="insert()"/>
	</form:form>
</body>
</html>