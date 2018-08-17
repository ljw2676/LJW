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

<div align="center">
	장소 예약 현황
</div>

<br>

<div align="center">
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>장소no.</td>
			<td>주최자no.</td>
			<td>대관 날짜</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.PB_NO}</td>
			<td>${row.L_NO}</td>
			<td>${row.M_NO}</td>
			<td>${row.L_SDATE}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		예약된 장소가 없습니다.
</c:otherwise>
</c:choose>
</div>

<br><br>

<div align="center">
	${pagingHtml}
</div>

</body>
</html>