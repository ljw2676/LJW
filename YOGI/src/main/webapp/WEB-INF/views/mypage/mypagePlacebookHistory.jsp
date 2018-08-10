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
<title>장소 신청 내역</title>

<table border="0" width=1000px align=center>
   <tr>
      <h1>장소 신청 내역</h1>
   </tr>
</table>

</head>
<body>
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no</td>
			<td>장소명</td>
			<td>주소</td>
			<td>수용인원</td>
			<td>비용</td>
			<td>대관 가능 기간</td>
			<td>평점</td>
			<td>신청날짜</td>
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
			<td>${row.PB_DATE}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		신청 내역이 없습니다
</c:otherwise>
</c:choose>

</body>
</html>