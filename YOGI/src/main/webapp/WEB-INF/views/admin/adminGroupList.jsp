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
	그룹 리스트
</div>

<br>

<div align="center">
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
			<td>penalty</td>
			<td>날짜</td>
			<td>활성화 여부</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.GG_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.M_NAME}</td>
			<td>${row.GG_CATEGORY}</td>
			<td>${row.GG_PLACE}</td>
			<td>${row.GG_COST}</td>
			<td>${row.GG_TOTAL}</td>
			<td>${row.GG_PENALTY}</td>
			<td>${row.GG_DATE}</td>
			<c:if test="${row.GG_ACTIVE == 0}">
			<td><a href="#this" name="inactivateGroup">O</a><input type="hidden" id="GG_NO" value="${row.GG_NO}"></td>
			</c:if>
			<c:if test="${row.GG_ACTIVE == 1 }">
			<td><a href="#this" name="activateGroup">X</a><input type="hidden" id="GG_NO" value="${row.GG_NO}"></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</c:when>
<c:otherwise>
		<br>
		생성된 그룹이 없습니다.
</c:otherwise>
</c:choose>
</div>

<br><br>

<div align="center">
	${pagingHtml}
</div>

<form id="commonForm" name="commonForm"></form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='inactivateGroup']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateGroup($(this));
			});
			$("a[name='activateGroup']").on("click", function(e) { //활성화
				e.preventDefault();
				fn_activateGroup($(this));
			});
		});
		
		function fn_inactivateGroup(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/group/inactivateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
		
		function fn_activateGroup(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/group/activateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
</script>
</body>
</html>