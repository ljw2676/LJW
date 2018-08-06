<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
장소 리스트
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>장소명</td>
			<td>주소</td>
			<td>수용인원</td>
			<td>비용</td>
			<td>대관 가능 기간</td>
			<td>평점</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.L_NO}</td>
			<td>${row.L_SUBJECT}</td>
			<td>${row.L_ADDR}</td>
			<td>${row.L_ENABLE}</td>
			<td>${row.L_PAYMENT}</td>
			<td>${row.L_SDATE} ~ ${row.L_EDATE}</td>
			<td>${row.L_RATE}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		등록한 장소가 없습니다.
</c:otherwise>
</c:choose>
</body>
</html>