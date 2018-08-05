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
		<c:forEach items="${list }" var="row">
			${row.GG_NO}
			${row.GG_NAME}
			${row.GG_PLACE}
		</c:forEach>
	</c:when>
</c:choose>
<form name="search_form" action="<c:url value="/group/groupSearch"/>" method="post">

<input id="searchWord" type="hidden" name="searchWord" value="${searchWord}">
<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr}">
<input id="searchPay" type="hidden" name="searchPay" value="${searcPay}">
<input id="searchMStart" type="hidden" name="searchMStart" value="${searchMStart}">

<input type="submit" value="검색">
</form>
</body>
</html>