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
		
		var memberActiveSize = "";
		$("input[name=MemberActive]:checked").each(function() {
			if(memberActiveSize == ""){
				memberActiveSize = $(this).val();
			} else {
				memberActiveSize = memberActiveSize + "|" + $(this).val();
			}
		});
		/* var searchCategorySize = "";
		$("input[name=searchCategory]:checked").each(function() {
			if(searchCategorySize == ""){
				searchCategorySize = $(this).val();
			}
		}); */
		if(memberActiveSize.length > 0){
			$('#searchMemberActive').val(memberActiveSize);
		}/* 
		if(searchCategorySize.length > 0){
			$('#searchCategory').val(searchCategorySize);
		} */
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

<div align="center">
	회원 리스트
</div>

<br>

<%-- <div>
<c:if test="${searchMemberActive != null || searchWord != null}">
	[
		<c:if test="${searchMemberActive != null }">
			<c:if test="${searchMemberActive == 'O' }">
				활성화된 멤버
			</c:if>
			<c:if test="${searchMemberActive == 'X' }">
				비활성화된 멤버
			</c:if>
		</c:if>
		<c:if test="${searchWord != null && searchMemberActive != null}">
			&nbsp;중&nbsp;
		</c:if>
		<c:if test="${searchWord != null }">
			<c:if test="${searchCategory == 'id' }">
				${searchCategory } :
			</c:if>
			<c:if test="${searchCategory == 'grade' }">
				${searchCategory } :
			</c:if>
			${searchWord }
		</c:if>
	]을(를) 검색한 결과입니다.
</c:if>
</div> --%>

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

<div class="search">
	<form name="search_form" action="<c:url value="/admin/member/list"/>" role="search" method="post" onsubmit="searchSubmit()">
		<div class="MemberActive">
			<input type="checkbox" name="MemberActive" value="O">활성 멤버<br>
			<input type="checkbox" name="MemberActive" value="X">비활성 멤버<br>
		</div>
		<div class="searchCategory">
			<select name="searchCategory" id="searchCategory">
				<option value="id" selected="selected">ID</option>
				<option value="grade">등급</option>
			</select>
		</div>
		<div>
			<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
			<input id="searchMemberActive" type="hidden" name="searchMemberActive" value="${searchMemberActive }">
			<input class="Searchbox" autocomplete="off" id="searchbox" type="text" name="searchWord" value=${searchWord }>
		
			<input type="submit" value="검색">
		</div>
	</form>
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