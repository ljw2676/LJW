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
<title>그룹 리스트</title>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery-1.7.1.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.css'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$('#searchbox').keypress(function(event) {
		if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
			searchSubmit();
		}
	});
	$('.btnEventSearch').click(function(event) {
		searchSubmit();
		});
	$('.Reset').click(function(event) {
		document.search_form.reset();
		}); 
	
	$('.date').appendDtpicker({
	"futureOnly" : true,
	"autodateOnStart" : false,
	"locale" : "ko",
	"dateFormat": "YY/MM/DD",
	"dateOnly": true,
	"closeOnSelected": true,
	"calendarMouseScroll": false
	});
});		
		    function searchSubmit(){
			var categorySize = "";
			$("input[name=Category]:checked").each(function() {
			if(categorySize == ""){
			categorySize = $(this).val();
			} else {
			categorySize = categorySize + "|" + $(this).val();
			}
			});
			var addrSize = "";
			$("input[name=Addr]:checked").each(function() {
			if(addrSize == ""){
			addrSize = $(this).val();
			} else {
			addrSize = addrSize + "|" + $(this).val();
			}
			});
			var paySize = "";
			$("input[name=Pay]:checked").each(function() {
			if(paySize == ""){
			paySize = $(this).val();
			} else {
			paySize = paySize + "|" + $(this).val();
			}
			});
			var dateSizs = "";
			if(categorySize.length > 0){
				$('#searchCategory').val(categorySize);
			}
			if(addrSize.length > 0){
				$('#searchAddr').val(addrSize);
			}
			if(paySize.length > 0){
				$('#searchPay').val(paySize);
			}
			if ($('#startdt').val() != null) {
				$('#searchMStart').val($('#startdt').val());
			}
	}

function fn_groupDetailLink(gg_no){
	var cs = new ComSubmit();
	cs.setUrl("<c:url value='/group/groupDetail' />");
	cs.addParam("gg_no", gg_no);
	cs.addParam("currentPageNo", "${currentPageNo}");
	cs.submit();
}
		    
</script>

</head>
<body>
	
	<c:choose>
		<c:when test="${fn:length(list) > 0 }">
		<table>
		<tr>
		<c:forEach items="${list }" var="row">		
		<td>
			<a href="#this" onclick="fn_groupDetailLink('${row.GG_NO}')">
			${row.GG_NAME }<br />
			${row.GG_PLACE}<br />
			${row.GG_CATEGORY}<br />
			${row.GG_COST}<br />
			${row.GG_DATE }<br />
			</a>
		<td/>
		</c:forEach>
		</tr>
		</table>
	</c:when>
	<c:otherwise>
	<h4>등록된 게시물이 없습니다.</h4>
	</c:otherwise>
	</c:choose>
	
		
		
		<div class="search">
			<div class="Category">
				<input type="checkbox" name="Category" value="공연">공연
				<input type="checkbox" name="Category" value="게임">게임
				<input type="checkbox" name="Category" value="여행">여행
				<input type="checkbox" name="Category" value="음식">음식
				<input type="checkbox" name="Category" value="음악">음악<br/><br/>								
			</div>
			
			<div class="Addr">
				<input type="checkbox" name="Addr" value="송파구">송파구
				<input type="checkbox" name="Addr" value="마포구">마포구
				<input type="checkbox" name="Addr" value="종로구">종로구<br/><br/>		
			</div>
			
			
			
			<div class="Pay">
			<input type="checkbox" name="Pay" value="유료">유료<br>
			<input type="checkbox" name="Pay" value="무료">무료<br>
			</div>
			
			<input autocomplete="off" type="text" class="date" id="startdt" size="5">달력<br>
			
			
			
			<form name="search_form" action="<c:url value="/group/groupList"/>" role="search" method="post" onsubmit="searchSubmit()">
			<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
			<input id="searchCategory" type="hidden" name="searchCategory" value="${searchCategory} ">
			<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
			<input id="searchPay" type="hidden" name="searchPay" value="${searchPay }">
			<input id="searchMStart" type="hidden" name="searchMStart" value="${searchMStart }">
			<input class="Searchbox" autocomplete="off" id="searchbox" type="text" name="searchWord" value=${searchWord }>
			
			<input type="submit" value="검색">
			</form>
		</div>
		${pagingHtml}

</body>
</html>