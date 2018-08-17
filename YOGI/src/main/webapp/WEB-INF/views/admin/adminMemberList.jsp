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
	회원 리스트
</div>

<br>

<div align="center">
<c:choose>
<c:when test="${fn:length(list) > 0 }">
	<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>ID</td>
			<td>phone</td>
			<td>점수</td>
			<td>등급</td>
			<td>penalty</td>
			<td>가입날짜</td>
			<td>활성화 여부</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.M_NO}</td>
			<td>${row.M_ID}</td>
			<td>${row.M_PHONE}</td>
			<td>${row.M_GRADE}</td>
			<td>${row.M_LV}</td>
			<td>${row.M_PENALTY}</td>
			<td>${row.M_DATE}</td>
			<c:if test="${row.M_ACTIVE == 0}">
			<td><a href="#this" name="inactivateMember">O</a><input type="hidden" id="M_NO" value="${row.M_NO}"></td>
			</c:if>
			<c:if test="${row.M_ACTIVE == 1 }">
			<td><a href="#this" name="activateMember">X</a><input type="hidden" id="M_NO" value="${row.M_NO}"></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</c:when>
<c:otherwise>
		<br>
		가입한 멤버가 없습니다.
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
			$("a[name='activateMember']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_activateMember($(this));
			});
		});
		
		function fn_inactivateMember(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/member/inactivateMember' />");
			comSubmit.addParam("M_NO", obj.parent().find("#M_NO").val());
			comSubmit.submit();
		}
		
		function fn_activateMember(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/member/activateMember' />");
			comSubmit.addParam("M_NO", obj.parent().find("#M_NO").val());
			comSubmit.submit();
		}
</script>
</body>
</html>