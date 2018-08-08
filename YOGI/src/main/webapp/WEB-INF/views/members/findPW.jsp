<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정!</title>
<script>
function checkPW() {
	
	var find = document.resetPassword;
	if (find.m_password.value == "") {
		alert("비밀번호를 입력해주세요");
		find.m_password.focus();
		return false;
	}
	if (find.m_password_check.value == "") {
		alert("비밀번호를 한번 더 입력해주세요");
		find.m_password_check.focus();
		return false;
	}
	if (find.m_password_check.value != find.m_password.value) {
		alert("비밀번호를 틀리게 입력했습니다. 다시 입력해주세요");
		find.m_password.focus();
		return false;
	}
	find.submit();
}
</script>
</head>
<body>
	"${member.m_id}"님 새로운 비밀번호를 입력해 주세요.
	<form:form commandName="member" name="resetPassword" method="post">
		비밀번호 : <input type="password" name="m_password" /> <br>
		비밀번호 : <input type="password" name="m_password_check" onkeyup="checkPwd()"/> <br>
		<input type="hidden" name="m_id" value=${member.m_id} />
		<input type="button" value="재설정~!" onclick="checkPW()"/>
	</form:form>
</body>
</html>