<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function insert() {
		var g = document.groupinput
		if(g.gg_category == ""){
			alert("카테고리를 해주세요");
			g.gg_category.focus();
			return false;
		}
		if(g.gg_name == ""){
			alert("모임 명을 입력해주세요");
			g.gg_name.focus();
			return false;
		}
		if(g.gg_date == ""){
			alert("날짜를 입력해주세요");
			g.gg_date.focus();
			return false;
		}
		if(g.gg_place == ""){
			alert("주소를 입력해주세요");
			g.gg_place.focus();
			return false;
		}
		if(g.gg_simple == ""){
			alert("장소 명을 입력해주세요");
			g.gg_simple.focus();
			return false;
		}
		if(g.gg_total == ""){
			alert("모집 인원을 입력해주세요");
			g.gg_total.focus();
			return false;
		}
		if(g.gg_cost == ""){
			alert("비용을 입력해주세요");
			g.gg_cost.focus();
			return false;
		}
		alert("모임 등록이 완료되었습니다 :3");
		g.submit();
		
		
	}
</script>
</head>
<body>

<form:form commandName="group" name="groupinput" method="post" enctype="multipart/form-data">
	카테고리 : <select name="gg_category">
					<option value="실외활동">실외활동</option>
					<option value="패션">패션</option>
					<option value="맛집">맛집</option>
					<option value="게임">게임</option>
					<option value="게임">동물</option>
					<option value="보드게임">보드게임</option>
					<option value="전시/공연">전시/공연</option>
					<option value="취업/스터디">취업/스터디</option>
					<option value="춤">춤</option>
					<option value="독서/토론">독서/토론</option>
					<option value="음악">음악</option>
					<option value="언어교환">언어교환</option>
					<option value="여행">여행</option>
					<option value="웰빙">웰빙</option>
					<option value="공예">공예</option>
			   </select>
			   <br>
	모임 명 : <input type="text" name="gg_name"><br>
	날짜 : <input type="text" name="gg_date"><br>
	주소 : <input type="text" name="gg_place"><br>
	장소 명 : <input type="text" name="gg_simple"><br>
	모집 인원 : <input type="number" name="gg_total"><br>
	비용 : <input type="number" name="gg_cost"><br>
	첨부 사진 : <input type="file" name="file"><br>
	상세 내용 : <input type="text" name="gg_detail"><br>
	
	<input type="button" value="등록" onclick="insert()"/>
</form:form>

</body>
</html>