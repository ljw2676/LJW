<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#checkPwd{
  color : red;
  font-size: 12px;
}

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
	var eng_check = /^[A-za-z]/g;
	var num_check = /^[0-9]*$/;
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var id_check = 0;
	var pw_check = 0;

	function insert() {
		var join = document.userinput
		if (join.m_id.value == "") {
			alert("아이디를 입력해주세요");
			join.m_id.focus();
			return false;
		}

		if (join.m_password.value == "") {
			alert("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}

		if (userinput.m_password.value.length < 4) {
			alert("최소 4자리 이상 입력해주세요!");
			userinput.m_password.focus();
			return false;
		}

		if (join.m_password_check.value == "") {
			alert("비밀번호를 한번 더 입력해주세요!");
			join.m_password.focus();
			return false;
		}
		
		if (join.m_password_check.value != join.m_password.value) {
			alertify.error("비밀번호를 틀리게 입력하셨습니다...");
			join.m_password.focus();
			return false;
		} 

		if (join.m_name.value == "") {
			alert("이름을 입력해주세요");
			join.m_name.focus();
			return false;
		}

		if (join.m_name.value.match(num_check)) {
			alert("이름을 입력해주세요");
			join.m_name.focus();
			return false;
		}

		if (join.m_phone.value == "") {
			alert("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}

		if (!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)) {
			alert("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			/* alertify.log("예) 010-1234-1234<br> 또는 02-123-1234"); */
			 join.m_phone.focus();
			return false;
		}
		if(id_check != 1){
			alert("아이디 중복 확인을 해주세요.");
			join.m_id.focus();
			return false;
		}
		if(pw_check != 1){
			alert("비밀번호를 확인해 주세요.");
			join.m_password.focus();
			return false;
		}
		alert("회원가입 완료! 환영합니다 >__<");
		join.submit();
	}

	
	$(document).ready(function(){
		$("#checkId").bind("click", function() {
			var userId = $("#m_id").val();
			$.ajax({
				async:true,
				type:'POST', 
				data : {"userId":userId},
				url:'/yogi/checkId',
				dataType : "json",
				success : function(data){
					if (userId == "") {
						alert("아이디를 입력해주세요");
						$("#m_id").focus();
					}
					else if(data.cnt > 0){
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						$("#m_id").focus();
					}else{
						id_check=1;
						alert("사용가능한 아이디입니다.");
						$("#m_password").foucs();
					}
				},
				error : function(error){
					alert("error: " + error)
				}
			})
		})
	})
	
	function checkPwd(){
		var pw1 = document.userinput.m_password.value;
		var pw2 = document.userinput.m_password_check.value;
		if(pw1!=pw2){
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
			pw_check=0;
		}else{
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
			pw_check=1;
		}
	}
	
</script>
</head>
<body>
	회원가입
	<form:form commandName="member" name="userinput" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="m_id" id="m_id"/>
		<input type="button" value="중복확인" id="checkId" /><br>
		프로필 사진 : <input type="file" name="file"><br>
		비밀번호 : <input type="password" name="m_password" onkeyup="checkPwd()"/> <br>
		비밀번호 : <input type="password" name="m_password_check" onkeyup="checkPwd()"/> <br>
		<div id="checkPwd">동일한 암호를 입력하세요.</div>
		이름 : <input type="text" name="m_name"/> <br>
		핸드폰 번호 : <input type="text" name="m_phone" placeholder="010-0000-0000"/> <br>
			
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
		<div class="area">
			<input type="checkbox" name="m_fav_area" value="종로구">종로구
			<input type="checkbox" name="m_fav_area" value="중구">중구
			<input type="checkbox" name="m_fav_area" value="용산구">용산구
			<input type="checkbox" name="m_fav_area" value="성동구">성동구<br>
	
			<input type="checkbox" name="m_fav_area" value="광진구">광진구
			<input type="checkbox" name="m_fav_area" value="동대문구">동대문구
			<input type="checkbox" name="m_fav_area" value="중랑구">중랑구
			<input type="checkbox" name="m_fav_area" value="성북구">성북구<br>

			<input type="checkbox" name="m_fav_area" value="강북구">강북구
			<input type="checkbox" name="m_fav_area" value="도봉구">도봉구
			<input type="checkbox" name="m_fav_area" value="노원구">노원구
			<input type="checkbox" name="m_fav_area" value="은평구">은평구 <br>
	
			<input type="checkbox" name="m_fav_area" value="서대문구">서대문구
			<input type="checkbox" name="m_fav_area" value="마포구">마포구
			<input type="checkbox" name="m_fav_area" value="양천구">양천구
			<input type="checkbox" name="m_fav_area" value="강서구">강서구<br>
	
			<input type="checkbox" name="m_fav_area" value="구로구">구로구
			<input type="checkbox" name="m_fav_area" value="금천구">금천구
			<input type="checkbox" name="m_fav_area" value="영등포구">영등포구
			<input type="checkbox" name="m_fav_area" value="동작구">동작구<br>
	
			<input type="checkbox" name="m_fav_area" value="관악구">관악구
			<input type="checkbox" name="m_fav_area" value="서초구">서초구
			<input type="checkbox" name="m_fav_area" value="강남구">강남구
			<input type="checkbox" name="m_fav_area" value="송파구">송파구<br>
	
			<input type="checkbox" name="m_fav_area" value="강동구">강동구
		</div>
			
		<input type="button" value="제출!" onclick="insert()"/>
	</form:form>
	
</body>
</html>