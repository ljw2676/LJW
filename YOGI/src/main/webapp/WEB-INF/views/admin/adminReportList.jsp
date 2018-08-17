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
	신고 리스트
</div>

<br>

<div align="center">
<c:choose>
<c:when test="${fn:length(list) > 0 }">
	<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>모임 이름</td>
			<td>주최자ID</td>
			<td>신고자no.</td>
			<td>사유</td>
			<td colspan="2">비활성화(페널티포인트)</td>
		</tr>
		<c:forEach items="${list}" var="row">

		<tr>
			<td>${row.R_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.M_ID}</td>
			<td>${row.M_NO}</td>
			<td>${row.R_COMMENT}</td>
			<td>
			<c:if test="${row.M_ACTIVE == 0}">
				<a href="#this" name="inactivateMember">멤버(${row.M_PENALTY})</a><input type="hidden" id="M_NO" value="${row.M_NO}">
			</c:if>	
			<c:if test="${row.M_ACTIVE == 1 }">
				<font color="red">X(${row.M_PENALTY})</font>
			</c:if>
			</td>
			<td>
			<c:if test="${row.GG_ACTIVE == 0}">	
				<a href="#this" name="inactivateGroup">모임(${row.GG_PENALTY})</a><input type="hidden" id="GG_NO" value="${row.GG_NO}">
			</c:if>
			<c:if test="${row.GG_ACTIVE == 1}">
				<font color="red">X(${row.GG_PENALTY})</font>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</c:when>
<c:otherwise>
		<br>
		신고가 없습니다.
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
			$("a[name='inactivateMember']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateMember($(this));
			});
			$("a[name='inactivateGroup']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateGroup($(this));
			});
		});
		
		function fn_inactivateMember(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/member/inactivateMember' />");
			comSubmit.addParam("M_NO", obj.parent().find("#M_NO").val());
			comSubmit.submit();
		}
		
		function fn_inactivateGroup(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/group/inactivateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
		
</script>
</body>
</html>