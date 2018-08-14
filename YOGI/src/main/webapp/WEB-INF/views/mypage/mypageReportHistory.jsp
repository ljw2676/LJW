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
<title>나의 신고 내역</title>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>나의 신고 내역</h1>
   </tr>
</table>

<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no</td>
			<td>모임명</td>
			<td>신고 사유</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.R_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.R_COMMENT}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		신고 내역이 없습니다
</c:otherwise>
</c:choose>
${pagingHtml}
<br />
<input type="button" value="닫기" onclick="self.close();" />
</body>
</html>