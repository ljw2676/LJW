<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<a href="http://localhost:8080/yogi/members/find">ID/PW찾기</a>
	<br>로그인<br>
	<form:form commandName="member" name="userinput" method="post">
		<c:choose>
			<c:when test="${'none' eq cookieID}">
				<input type="text" name="m_id" placeholder="아이디"/>
				<input type="password" name="m_password" placeholder="비밀번호"/>
				<input type="checkbox" name="idSave" id="idSave"  value="save"/>아이디/비밀번호 유지
			</c:when>
			<c:otherwise>
				<input type="text" name="m_id" placeholder="아이디" value="${cookieID}"/>
				<input type="password" name="m_password" placeholder="비밀번호"  value="${cookiePW}"/>
				<input type="checkbox" name="idSave" id="idSave" value="save" checked/>아이디/비밀번호 유지
			</c:otherwise>
		</c:choose>
	
		<input type="button" value="제출!" onclick="insert()"/>
	</form:form>
</body>
</html>