<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW찾기</title>
<script>
function findID() {
	
	var find = document.findId;
	if (find.m_name.value == "") {
		alert("이름을 입력해주세요");
		find.m_name.focus();
		return false;
	}
		
	if (find.m_phone.value == "") {
		alert("핸드폰 번호를 입력해주세요");
		find.m_phone.focus();
		return false;
	}
	var url = "/yogi/findId?name=" + find.m_name.value+"&phone="+find.m_phone.value;
	var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
	window.open(url,"",option);
}

function findPw() {
	var find = document.findPW;
	
	if (find.m_id.value == "") {
		alert("아이디를 입력해주세요");
		find.m_id.focus();
		return false;
	}
	if (find.m_name.value == "") {
		alert("이름을 입력해주세요");
		find.m_name.focus();
		return false;
	}
	if (find.m_phone.value == "") {
		alert("핸드폰 번호를 입력해주세요");
		find.m_phone.focus();
		return false;
	}
	var url = "/yogi/findPW?name=" + find.m_name.value+"&phone="+find.m_phone.value+"&id="+find.m_id.value;
	var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
	window.open(url,"",option);
}
</script>
</head>
<body>
아이디... 비번을 잊었니...? 어리석은 친구여....
	<form:form commandName="member" name="findId" method="post">
		<input type="text" name="m_name" placeholder="이름"/>
		<input type="text" name="m_phone"placeholder="ex) 010-1234-1234"  maxlength="13">
		<input type="button" value="제출!" onclick="findID()"/>
	</form:form>
	
	<form:form commandName="member" name="findPW" method="post">
		<input type="text" name="m_id" placeholder="아이디"/>
		<input type="text" name="m_name" placeholder="이름"/>
		<input type="text" name="m_phone"placeholder="ex) 010-1234-1234"  maxlength="13">
		<input type="button" value="제출!" onclick="findPw()"/>
	</form:form>
	
</body>
</html>