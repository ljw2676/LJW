<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정!</title>
<style>
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
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
	find.submit();
}

function check(){
	var pw1 = document.resetPassword.m_password.value;
	var pw2 = document.resetPassword.m_password_check.value;
	if(pw1!=pw2){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	}
}
</script>
</head>
<body>
	"${member.m_id}"님 새로운 비밀번호를 입력해 주세요.
	<form:form commandName="member" name="resetPassword" method="post">
		비밀번호 : <input type="password" name="m_password" onkeyup="check()"/> <br>
		비밀번호 : <input type="password" name="m_password_check" onkeyup="check()"/> <br>
		<input type="hidden" name="m_id" value=${member.m_id} />
		<div id="checkPwd">동일한 암호를 입력하세요.</div>
		<input type="button" value="재설정~!" onclick="checkPW()"/>
	</form:form>
</body>
</html>