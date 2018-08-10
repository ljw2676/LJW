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
			<td>장소명</td>
			<td>사용 날짜</td>
			<td>신청 날짜</td>
			<td>취소</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<tr>
			<td>${row.L_SUBJECT}</td>
			<td>${row.U_DATE }
			<td>${row.PB_DATE}</td>
			<td>
			<a href="#this" name="cancel">취소</a>
			<input type="hidden" id="L_NO" value="${row.L_NO}">
			<input type="hidden" id="U_DATE" value="${row.U_DATE}">
			</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		신청 내역이 없습니다
</c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='cancel']").on("click", function(e) { //취소
				e.preventDefault();
				fn_cancelLendplace($(this));
			});
		});
		
	      function fn_cancelLendplace(obj){
	          var comSubmit = new ComSubmit();
	      	  comSubmit.setUrl("<c:url value='/admin/lendplace/Cancel' />");
			  comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
			  comSubmit.addParam("U_DATE", obj.parent().find("#U_DATE").val());
	          comSubmit.submit();
	      }
		

</script>

</body>
</html>