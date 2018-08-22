<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	요긔요긔 >__<
	아이디눈 : ${session_m_id}
	<br>
	그룹 리스트
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>그룹명</td>
			<td>주최자</td>
			<td>카테고리</td>
			<td>장소</td>
			<td>비용(원)</td>
			<td>총 인원(명)</td>
		</tr>
		<c:forEach items="${list}" var="row" begin="1" end="4" step="1">
		<tr>
			<td><a href="http://localhost:8080/yogi/group/groupDetail?gg_no=${row.GG_NO}">
			<img src="C:/java/git/YOGI/YOGI/src/main/webapp/resources/upload/${row.GG_RFN }" style="width: 340px; height: 300px;"/></a></td>
			<td>${row.GG_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.M_NAME}</td>
			<td>${row.GG_CATEGORY}</td>
			<td>${row.GG_PLACE}</td>
			<td>${row.GG_COST}</td>
			<td>${row.GG_TOTAL}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		생성된 그룹이 없습니다.
</c:otherwise>
</c:choose>
<a href="http://localhost:8080/yogi/group/groupList">더보기</a>
<a href="http://localhost:8080/yogi/lendplace/list">장소</a>
<a href="http://localhost:8080/yogi/lendplace/chat"> 채팅 테스트 </a>
<a href="http://localhost:8080/yogi/members/modifyForm">회원 정보 수정</a>
</body>
</html>