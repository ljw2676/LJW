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
<title>장소 목록</title>
</head>
<body>


<%-- <form name="search_form" action="<c:url value="/meetings"/>" method="post" role="search" onsubmit="searchSubmit();">
	<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
	<input id="searchL_s_date" type="hidden" name="searchL_s_date" value="${searchL_s_date }">
	<input id="searchL_e_date" type="hidden" name="searchL_e_date" value="${searchL_e_date }">
	<input type="text" class="form-control" id="searchbox" name="searchWord" value="${searchWord }" placeholder="키워드 검색">
	<button type="submit" value="검색"></button>
</form> --%>
		
<form name="search_form" action="<c:url value='/lendplace/list' />" role="search" method="post" method="post" onsubmit="searchSubmit()">

<input id="searchAddr" type="hidden" name="searchAddr">
키워드 검색 
<input autocomplete="off" class="searchbox" id="searchWord" type="text" name="searchWord" maxlength="10" placeholder="예)역삼동,음향,주차 등" style="background-color:transparent;" />
<br><br>
비용 검색
<input autocomplete="off" class="min_pay" type="text" name="min_pay" id="min_pay" size="13" placeholder="0" style="background-color:transparent;"> - 
<input autocomplete="off" class="max_pay" type="text" name="max_pay" id="max_pay" size="13" placeholder="0" style="background-color:transparent;">
<br>

	<input type="checkbox" style="margin-top:67px; margin-left:90px; "name="area" value="종로구">종로구
	<input type="checkbox" style="margin-left:47px;" name="area" value="중구">중구
	<input type="checkbox" style="margin-left:60px;" name="area" value="용산구">용산구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="광진구">광진구
	<input type="checkbox" style="margin-left:47px;" name="area" value="동대문구">동대문구
	<input type="checkbox" style="margin-left:32px;" name="area" value="중랑구">중랑구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강북구">강북구
	<input type="checkbox" style="margin-left:47px;" name="area" value="도봉구">도봉구
	<input type="checkbox" style="margin-left:46px;" name="area" value="노원구">노원구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="서대문구">서대문구
	<input type="checkbox" style="margin-left:34px;" name="area" value="마포구">마포구
	<input type="checkbox" style="margin-left:46px;" name="area" value="양천구">양천구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="구로구">구로구
	<input type="checkbox" style="margin-left:47px;" name="area" value="금천구">금천구
	<input type="checkbox" style="margin-left:46px;" name="area" value="영등포구">영등포구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="관악구">관악구
	<input type="checkbox" style="margin-left:47px;" name="area" value="서초구">서초구
	<input type="checkbox" style="margin-left:46px;" name="area" value="강남구">강남구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강동구">강동구
	<input type="checkbox" style="margin-left:47px;" name="area" value="성동구">성동구
	<input type="checkbox" style="margin-left:46px;" name="area" value="성북구">성북구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="은평구">은평구 
	<input type="checkbox" style="margin-left:47px;" name="area" value="강서구">강서구
	<input type="checkbox" style="margin-left:46px;" name="area" value="동작구">동작구
	<br>
	<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="송파구">송파구
<br><br>
<font color="white" size="5">날짜</font><input autocomplete="off" type="date" class="date" name="l_sdate" id="l_sdate" size="13" style="background-color:transparent;"> - 
<input autocomplete="off" type="date" class="date" name="l_edate" id="l_edate" size="13" style="background-color:transparent;">
<input type="submit" value="검색">
</form>

<br><br>

<c:choose>
	<c:when test="${fn:length(list) > 0 }">
		<table border="1">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>주소</td>
						<td>인원</td>
						<td>비용</td>
						<td>기간</td>
						<td>평점</td>
						<td>신청</td>
						<td>취소</td>
					</tr>
			<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.L_NO}번</td>
						<td><a href="#this" name="title">${row.L_SUBJECT}</a><input type="hidden" id="L_NO" value="${row.L_NO}"></td>
						<td>${row.L_ADDR}</td>
						<td>${row.L_ENABLE}명</td>
						<td>${row.L_PAYMENT}원</td>
						<td>${row.L_SDATE} ~ ${row.L_EDATE}</td>
						<td>${row.L_RATE}</td>
						<!-- 장소 신청 버튼 -->
						<td><a href="#this" name="apply">신청</a><input type="hidden" id="L_NO" value="${row.L_NO}"></td>
						<td><a href="#this" name="cancel">취소</a><input type="hidden" id="L_NO" value="${row.L_NO}"></td>
					</tr>
			</c:forEach>
			
		</table>
	</c:when>
	<c:otherwise>
		등록된 장소가 없습니다.
	</c:otherwise>
</c:choose>

<br><br>

<a href="<c:url value='/admin/lendplace/Form'/>">글쓰기</a>

<form id="commonForm" name="commonForm"></form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_selectLendplaceDetail($(this));
			});
			
			$("a[name='apply']").on("click", function(e) { //신청
				e.preventDefault();
				fn_applyLendplace($(this));
			});
			
			$("a[name='cancel']").on("click", function(e) { //신청
				e.preventDefault();
				fn_cancelLendplace($(this));
			});
			
			$('#searchbox').keypress(function(event) {
				if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
					searchSubmit();
				}
			});
		});
		
		
		function fn_selectLendplaceDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lendplace/detail' />");
			comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
			comSubmit.submit();
		}
	
	      function fn_applyLendplace(obj){
	          var comSubmit = new ComSubmit();
	      	  comSubmit.setUrl("<c:url value='/admin/lendplace/Apply' />");
			  comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
	          comSubmit.submit();
	      }
	      
	      function fn_cancelLendplace(obj){
	          var comSubmit = new ComSubmit();
	      	  comSubmit.setUrl("<c:url value='/admin/lendplace/Cancel' />");
			  comSubmit.addParam("L_NO", obj.parent().find("#L_NO").val());
	          comSubmit.submit();
	      }
	    
		  function searchSubmit(){
		 	  var areaSize = "";
		 	  $("input[name=area]:checked").each(function() {
		 	  	if(areaSize == ""){
		 	 		areaSize = $(this).val();
		 	  	} else {
		 	  		areaSize = areaSize + "|" + $(this).val();
		 	  	}
		 	  });
		 			
		 	  if(areaSize.length > 0){
		 		$('#searchAddr').val(areaSize);
		 	  }
		 	  document.search_form.submit();
		 } 

</script>
</body>
</html>