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
신고 리스트
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>모임no.</td>
			<td>주최자no.</td>
			<td>신고자no.</td>
			<td>사유</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.R_NO}</td>
			<td>${row.GG_NO}</td>
			<td>${row.M_NO}</td>
			<td>${row.M_PNO}</td>
			<td>${row.R_COMMENT}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		신고가 없습니다.
</c:otherwise>
</c:choose>
</body>
</html>