<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
#checkPwd{
  color : red;
  font-size: 12px;
}

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var pw_check = 0;

	function insert() {
		var join = document.userinput

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

		if(pw_check != 1){
			alert("비밀번호를 확인해 주세요.");
			join.m_password.focus();
			return false;
		}
		alert("회원정보 수정 완료!");
		join.submit();
	}
	
	function del(){
		//회원탈퇴 기능 만들기
		var url = "/yogi/members/delMem?id=" + document.userinput.m_id.value;
		var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
		window.open(url,"",option);
	}
	
	
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
	회원정보수정
	
	
	<form:form commandName="member" name="userinput" method="post" enctype="multipart/form-data">
		아이디 : <input type="text" name="m_id" id="m_id" value = ${members.m_id } readonly/>
		프로필 사진 : <input type="file" name="file"><br>
		비밀번호 : <input type="password" name="m_password" onkeyup="checkPwd()"/> <br>
		비밀번호 : <input type="password" name="m_password_check" onkeyup="checkPwd()"/> <br>
		<div id="checkPwd">동일한 암호를 입력하세요.</div>
		이름 : <input type="text" name="m_name" value=${members.m_id } readonly/> <br>
		핸드폰 번호 : <input type="text" name="m_phone" value=${members.m_phone} /> <br>
		
		<br><br>
		<div class="category">
			<c:if test="${interest[0] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="실외활동" checked>실외활동
			</c:if>
			<c:if test="${interest[0] eq null}">
				<input type="checkbox" name="m_fav_field" value="실외활동">실외활동
			</c:if>
			<c:if test="${interest[1] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="패션" checked>패션
			</c:if>
			<c:if test="${interest[1] eq null}">
				<input type="checkbox" name="m_fav_field" value="패션">패션
			</c:if>
			<c:if test="${interest[2] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="맛집" checked>맛집
			</c:if>
			<c:if test="${interest[2] eq null}">
				<input type="checkbox" name="m_fav_field" value="맛집">맛집
			</c:if>
			<br>
				
			<c:if test="${interest[3] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="게임"checked>게임
			</c:if>
			<c:if test="${interest[3] eq null}">
				<input type="checkbox" name="m_fav_field" value="게임">게임
			</c:if>			
			<c:if test="${interest[4] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="동물" checked>동물
			</c:if>
			<c:if test="${interest[4] eq null}">
				<input type="checkbox" name="m_fav_field" value="동물">동물
			</c:if>
			<c:if test="${interest[5] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="보드게임" checked>보드게임
			</c:if>
			<c:if test="${interest[5] eq null}">
				<input type="checkbox" name="m_fav_field" value="보드게임">보드게임
			</c:if>
			<br>
				
			<c:if test="${interest[6] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="전시/공연" checked>전시/공연
			</c:if>
			<c:if test="${interest[6] eq null}">
				<input type="checkbox" name="m_fav_field" value="전시/공연">전시/공연
			</c:if>
			<c:if test="${interest[7] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="취업/스터디" checked>취업/스터디
			</c:if>
			<c:if test="${interest[7] eq null}">
				<input type="checkbox" name="m_fav_field" value="취업/스터디">취업/스터디
			</c:if>
			<c:if test="${interest[8] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="춤" checked>춤
			</c:if>
			<c:if test="${interest[8] eq null}">
				<input type="checkbox" name="m_fav_field" value="춤">춤
			</c:if>
			<br>
				
			<c:if test="${interest[9] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="독서/토론" checked>독서/토론
			</c:if>
			<c:if test="${interest[9] eq null}">
				<input type="checkbox" name="m_fav_field" value="독서/토론">독서/토론
			</c:if>
			<c:if test="${interest[10] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="음악" checked>음악
			</c:if>
			<c:if test="${interest[10] eq null}">
				<input type="checkbox" name="m_fav_field" value="음악">음악
			</c:if>
			<c:if test="${interest[11] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="언어교환" checked>언어교환
			</c:if>
			<c:if test="${interest[11] eq null}">
				<input type="checkbox" name="m_fav_field" value="언어교환">언어교환
			</c:if>
			<br>
				
			<c:if test="${interest[12] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="여행" checked>여행
			</c:if>
			<c:if test="${interest[12] eq null}">
				<input type="checkbox" name="m_fav_field" value="여행">여행
			</c:if>
			<c:if test="${interest[13] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="웰빙" checked>웰빙
			</c:if>
			<c:if test="${interest[13] eq null}">
				<input type="checkbox" name="m_fav_field" value="웰빙">웰빙
			</c:if>
			<c:if test="${interest[14] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="공예" checked>공예
			</c:if>
			<c:if test="${interest[14] eq null}">
				<input type="checkbox" name="m_fav_field" value="공예">공예
			</c:if>
				<br>
		</div>
		<br><br><br>
		<div class="area">
			<c:if test="${area[0] eq 'check'}">
				<input type="checkbox" name="m_fav_field" value="종로구" checked>종로구
			</c:if>
			<c:if test="${area[0] eq null}">
				<input type="checkbox" name="m_fav_area" value="종로구">종로구
			</c:if>
			<c:if test="${area[1] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="중구" checked>중구
			</c:if>
			<c:if test="${area[1] eq null}">
				<input type="checkbox" name="m_fav_area" value="중구">중구
			</c:if>
			<c:if test="${area[2] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="용산구" checked>용산구
			</c:if>
			<c:if test="${area[2] eq null}">
				<input type="checkbox" name="m_fav_area" value="용산구">용산구
			</c:if>
			<c:if test="${area[3] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="성동구" checked>성동구
			</c:if>
			<c:if test="${area[3] eq null}">
				<input type="checkbox" name="m_fav_area" value="성동구">성동구
			</c:if>			
			<c:if test="${area[4] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="광진구" checked>광진구
			</c:if>
			<c:if test="${area[4] eq null}">
				<input type="checkbox" name="m_fav_area" value="광진구">광진구
			</c:if>
			<br>
			
			<c:if test="${area[5] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="동대문구" checked>동대문구
			</c:if>
			<c:if test="${area[5] eq null}">
				<input type="checkbox" name="m_fav_area" value="동대문구">동대문구
			</c:if>
			<c:if test="${area[6] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="중랑구" checked>중랑구
			</c:if>
			<c:if test="${area[6] eq null}">
				<input type="checkbox" name="m_fav_area" value="중랑구">중랑구
			</c:if>
			<c:if test="${area[7] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="성북구" checked>성북구
			</c:if>
			<c:if test="${area[7] eq null}">
				<input type="checkbox" name="m_fav_area" value="성북구">성북구
			</c:if>
			<c:if test="${area[8] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="강북구" checked>강북구
			</c:if>
			<c:if test="${area[8] eq null}">
				<input type="checkbox" name="m_fav_area" value="강북구">강북구
			</c:if>
			<c:if test="${area[9] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="도봉구" checked>도봉구
			</c:if>
			<c:if test="${area[9] eq null}">
				<input type="checkbox" name="m_fav_area" value="도봉구">도봉구
			</c:if>
			<br>
			
			<c:if test="${area[10] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="노원구" checked>노원구
			</c:if>
			<c:if test="${area[10] eq null}">
				<input type="checkbox" name="m_fav_area" value="노원구">노원구
			</c:if>
			<c:if test="${area[11] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="은평구" checked>은평구
			</c:if>
			<c:if test="${area[11] eq null}">
				<input type="checkbox" name="m_fav_area" value="은평구">은평구
			</c:if>
			<c:if test="${area[12] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="서대문구" checked>서대문구
			</c:if>
			<c:if test="${area[12] eq null}">
				<input type="checkbox" name="m_fav_area" value="서대문구">서대문구
			</c:if>
			<c:if test="${area[13] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="마포구" checked>마포구
			</c:if>
			<c:if test="${area[13] eq null}">
				<input type="checkbox" name="m_fav_area" value="마포구">마포구
			</c:if>
			<c:if test="${area[14] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="양천구" checked>양천구
			</c:if>
			<c:if test="${area[14] eq null}">
				<input type="checkbox" name="m_fav_area" value="양천구">양천구
			</c:if>
			<br>
			
			<c:if test="${area[15] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="강서구" checked>강서구
			</c:if>
			<c:if test="${area[15] eq null}">
				<input type="checkbox" name="m_fav_area" value="강서구">강서구
			</c:if>
			<c:if test="${area[16] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="구로구" checked>구로구
			</c:if>
			<c:if test="${area[16] eq null}">
				<input type="checkbox" name="m_fav_area" value="구로구">구로구
			</c:if>
			<c:if test="${area[17] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="금천구" checked>금천구
			</c:if>
			<c:if test="${area[17] eq null}">
				<input type="checkbox" name="m_fav_area" value="금천구">금천구
			</c:if>
			<c:if test="${area[18] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="영등포구" checked>영등포구
			</c:if>
			<c:if test="${area[18] eq null}">
				<input type="checkbox" name="m_fav_area" value="영등포구">영등포구
			</c:if>
			<c:if test="${area[19] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="동작구"checked>동작구
			</c:if>
			<c:if test="${area[19] eq null}">
				<input type="checkbox" name="m_fav_area" value="동작구">동작구
			</c:if>
			<br>
			
			<c:if test="${area[20] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="관악구" checked>관악구
			</c:if>
			<c:if test="${area[20] eq null}">
				<input type="checkbox" name="m_fav_area" value="관악구">관악구
			</c:if>
			<c:if test="${area[21] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="서초구" checked>서초구
			</c:if>
			<c:if test="${area[21] eq null}">
				<input type="checkbox" name="m_fav_area" value="서초구">서초구
			</c:if>
			<c:if test="${area[22] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="강남구"checked>강남구
			</c:if>
			<c:if test="${area[22] eq null}">
				<input type="checkbox" name="m_fav_area" value="강남구">강남구
			</c:if>
			<c:if test="${area[23] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="송파구"checked>송파구
			</c:if>
			<c:if test="${area[23] eq null}">
				<input type="checkbox" name="m_fav_area" value="송파구">송파구
			</c:if>			
			<c:if test="${area[24] eq 'check'}">
				<input type="checkbox" name="m_fav_area" value="강동구" checked>강동구
			</c:if>
			<c:if test="${area[24] eq null}">
				<input type="checkbox" name="m_fav_area" value="강동구">강동구
			</c:if>
				<br>
		</div>
		<br><br>
		<input type="button" value="확인!" onclick="insert()"/>
	</form:form>
	
	<input type="button" value="회원탈퇴" onclick="del()"/>
	
</body>
</html>