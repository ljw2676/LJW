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
<title>내가 개설한 모임</title>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>내가 개설한 모임</h1>
   </tr>
</table>

<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no</td>
			<td>제목</td>
			<td>등록일</td>
	
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.GG_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.GG_DATE}</td>
	
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		신청 내역이 없습니다
</c:otherwise>
</c:choose>

${pagingHtml}


</body>
</html>