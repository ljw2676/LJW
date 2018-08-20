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
	장소 리스트
</div>

<br>

<div align="center">
<c:choose>
<c:when test="${fn:length(list) > 0 }">
	<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>장소명</td>
			<td>주소</td>
			<td>수용인원</td>
			<td>비용</td>
			<td>대관 가능 기간</td>
			<td>평점</td>
			<td>삭제</td>
		</tr>
		<c:forEach items="${list}" var="row">
		<input type="hidden" id="L_UDATE" value="${row.L_UDATE}">
		<tr>
			<td>${row.L_NO}</td>
			<td><a href="#this" name="detail">${row.L_SUBJECT}</a><input type="hidden" id="L_NO" value="${row.L_NO}"></td>
			<td>${row.L_ADDR}</td>
			<td>${row.L_ENABLE}</td>
			<td>${row.L_PAYMENT}</td>
			<td>${row.L_SDATE} ~ ${row.L_EDATE}</td>
			<td>${row.L_RATE}</td>
			<td><a href="#this" name="update">수정</a><input type="hidden" id="L_NO" value="${row.L_NO}"><input type="hidden" id="L_UDATE" value="${row.L_UDATE}"></td>
			<td><a href="#this" name="delete">삭제</a><input type="hidden" id="L_NO" value="${row.L_NO}"></td>
		</tr>
		</c:forEach>
	</table>
</c:when>
<c:otherwise>
		<br>
		등록한 장소가 없습니다.
</c:otherwise>
</c:choose>
</div>

<div>
	<a href="<c:url value='/admin/lendplace/Form'/>">장소 등록</a>
</div>

<br><br>

<div align="center">
	${pagingHtml}
</div>

<form id="commonForm" name="commonForm"></form>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
		$(document).ready(function() {
			 $("a[name='update']").on("click", function(e) { //수정
				e.preventDefault();
			 	var L_UDATE = parseInt($(this).parent().find("#L_UDATE").val());
				if ( L_UDATE > 0) {
					alert("현재 이 장소로 신청한 회원이 있어 수정이 불가능합니다!");
					return false;
				}else{
					fn_updateLendplace($(this));	
				}
			}); 
			
			$("a[name='delete']").on("click", function(e) { //삭제
				e.preventDefault();
				fn_deleteLendplace($(this));
			});
			
			$("a[name='detail']").on("click", function(e) { //상세보기
				e.preventDefault();
				fn_detailLendplace($(this));
			});
		});
		/* function fn_Update(L_UDATE){
			var l_udate = parseInt(L_UDATE);
			if (l_udate > 0) {
				alert("현재 이 장소로 신청한 회원이 있어 수정이 불가능합니다!");
				return false;
			}else{
				fn_updateLendplace($(this));
			}
		} */
		
		 function fn_updateLendplace(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lendplace/updateForm' />");
			comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
			comSubmit.submit();
		} 
		function fn_deleteLendplace(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/lendplace/Delete' />");
			comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
			comSubmit.submit();
		}
		function fn_detailLendplace(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lendplace/detail' />");
			comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
			comSubmit.submit();
		}
		
		/* function lendDelete(no) {
	         if(confirm("삭제 하시겠습니까?") == true){
	            location.href='/admin/lendplace/Delete?L_NO='+no;
	         }else {
	            return;
	         }
		} */
		
</script>
</body>
</html>