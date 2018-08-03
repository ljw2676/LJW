<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
	var eng_check = /^[A-za-z]/g;
	var num_check = /^[0-9]*$/;
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
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
		
		if (userinput.m_password.value.length < 4) {
			/* alertify.error("최소 4자리 이상 입력해주세요!"); */
			alert("최소 4자리 이상 입력해주세요!"); 
			userinput.m_password.focus();
			return false;
		}
		
		if (join.m_password_check.value == "") {
			alert("비밀번호를 한번 더 입력해주세요!");
			/* alertify.error("비밀번호를 한번 더 입력해주세요!"); */
			join.m_password.focus();
			return false;
		} 
		
		if (join.m_password_check.value != join.m_password.value) {
			/* alertify.error("비밀번호를 틀리게 입력하셨습니다..."); */
			alert("비밀번호를 틀리게 입력하셨습니다...");
			join.m_password.focus();
			return false;
		} 
		
		if (join.m_name.value == "") {
			/* alertify.error("이름을 입력해주세요"); */
			alert("이름을 입력해주세요");
			join.m_name.focus();
			return false;
		}
		
		if (join.m_name.value.match(num_check)) {
			alert("이름을 입력해주세요");
			/* alertify.error("이름에는 숫자가 포함될수 없습니다."); */
			join.m_name.focus();
			return false;
		}
		
		if (join.m_phone.value == "") {
			/* alertify.error("전화번호를 입력해주세요"); */
			alert("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if(!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)){
			 alert("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			/* alertify.error("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			alertify.log("예) 010-1234-1234<br> 또는 02-123-1234");
			 */join.m_phone.focus();
			return false;
		}
		alert("회원가입 완료! 환영합니다 >__<");
		join.submit();
	}

	function openConfirmId(userinput) {
		var url = "membersIdChk.action?m_id=" + document.userinput.m_id.value;
		var join = document.userinput;
		if (join.m_id.value == "") {
			/* alertify.error("아이디를 입력해주세요"); */
			join.m_id.focus();
			return false;
		}
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
	}
</script>
</head>
<body>
	회원가입
	<form:form commandName="member" method="post">
			아이디 : <input type="text" name="m_id"/> <br>
			비밀번호 : <input type="password" name="m_password"/> <br>
			이름 : <input type="text" name="m_name"/> <br>
			핸드폰 번호 : <input type="text" name="m_phone"/> <br>
		
		<br><br>	
		<div class="category">
			<input type="checkbox" name="m_fav_field" value="실외활동">실외활동
			<input type="checkbox" name="m_fav_field" value="패션">패션
			<input type="checkbox" name="m_fav_field" value="맛집">맛집<br>
	
			<input type="checkbox" name="m_fav_field" value="게임">게임
			<input type="checkbox" name="m_fav_field" value="동물">동물
			<input type="checkbox" name="m_fav_field" value="보드게임">보드게임<br>
	
			<input type="checkbox" name="m_fav_field" value="전시/공연">전시/공연
			<input type="checkbox" name="m_fav_field" value="취업/스터디">취업/스터디
			<input type="checkbox" name="m_fav_field" value="춤">춤<br>
	
			<input type="checkbox" name="m_fav_field" value="독서/토론">독서/토론
			<input type="checkbox" name="m_fav_field" value="음악">음악
			<input type="checkbox" name="m_fav_field" value="언어교환">언어교환<br>
	
			<input type="checkbox" name="m_fav_field" value="여행">여행
			<input type="checkbox" name="m_fav_field" value="웰빙">웰빙
			<input type="checkbox" name="m_fav_field" value="공예">공예
		</div>
		<br><br>
			
		<input type="button" value="제출!" onclick="insert()"/>
	</form:form>
	
</body>
</html>