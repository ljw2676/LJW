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
<title>장소 상세보기</title>
<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">
</head>
<body>
<form name="apply_form" action="<c:url value='/lendplace/apply' />"  method="post">
<table border="1">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>주소</td>
						<td>내용</td>
						<td>이미지</td>
						<td>인원</td>
						<td>비용</td>
						<td>기간</td>
						<td>평점</td>
					</tr>
					<tr>
						<td>${map.L_NO}번</td>
						<td>${map.L_SUBJECT}</td>
						<td>${map.L_ADDR}</td>
						<td>${map.L_CONTENT}</td>
						<td>${map.L_REP_IMAGE}</td>
						<td>${map.L_ENABLE}명</td>
						<td>${map.L_PAYMENT}원</td>
						<td>${map.L_SDATE} ~ ${map.L_EDATE}</td>
						<td>${map.L_RATE}</td>
					</tr>
					
					<tr>
						<td><a href="#this" name="apply">신청</a></td>
						<td><a href="<c:url value='/lendplace/list'/>">목록</a></td>
					</tr>
</table>
<input type="hidden" name="L_NO" value="${map.L_NO}"><input type="hidden" name="M_NO" value="${session_m_no}">
<input type="hidden" data-toggle="datepicker" name="U_DATE"></input> 
<div id="datepicker-container"></div>
</form>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script type="text/javascript">
$(document).ready(function() {
		$("a[name='apply']").on("click", function(e) { //신청
		/* 태그의 기본 기능을 제거 */
		e.preventDefault();
		fn_applyLendplace();
		
		});
});

function fn_applyLendplace(){
		
		document.apply_form.submit();
}


$( function() {/* 달력 */
	 
	 $('[data-toggle="datepicker"]').datepicker({
		  language: 'ko-KR',
		  inline: true,
		  container: '#datepicker-container',
		  format: 'yyyy-mm-dd',
		  startDate: '${map.L_SDATE}',
		  endDate: '${map.L_EDATE}',
		  filter: function(date){
			 <c:forEach items="${date}" var="date"> 
			  var Udate = new Date("${date.U_DATE}");
			  if (date.getFullYear() === Udate.getFullYear()) {
					if (date.getMonth()	=== Udate.getMonth()) {
						if (date.getDate() === Udate.getDate()) {
						       return false; 
						}
					}
				 }
			 </c:forEach>
	  		}
	 });
});


</script>
</body>
</html>