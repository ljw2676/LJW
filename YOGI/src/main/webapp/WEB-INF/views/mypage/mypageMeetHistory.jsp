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
<title>내가 참여한 모임</title>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>내가 참여한 모임</h1>
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
		참여한 모임이 없습니다.
</c:otherwise>
</c:choose>

${pagingHtml}

</body>

<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
/* 		$(document).ready(function() {
			$("a[name='title']").on("click", function(e) { //신청
				/* 태그의 기본 기능을 제거 */
				e.preventDefault();
				fn_selectLendplaceDetail($(this));
			});
				});
			 */
			function fn_selectLendplaceDetail(gg_no) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/groupDetail' />");
				comSubmit.addParam("gg_no", gg_no);
				comSubmit.addParam("currentPageNo", "${currentPageNo}");
				comSubmit.submit();
			}
</script>			
</html>