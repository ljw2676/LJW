<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>그룹 리스트</title>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(list) > 0 }">
		<table>
		<tr>
		<c:forEach items="${list }" var="row">		
		<td>
			${row.GG_NAME}<br />
			${row.GG_PLACE}<br />
			${row.GG_DETAIL}<br />
		<td/>
		</c:forEach>
		</tr>
		</table>
	</c:when>
	<c:otherwise>
	<h4>등록된 게시물이 없습니다.</h4>
	</c:otherwise>
	</c:choose>
	
		<div>
		<ul>${pagingHtml}</ul>
		</div>
</body>
</html>