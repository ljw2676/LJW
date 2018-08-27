<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 창</title>
</head>
<body>
<div>
	<form name="reportinput" method="post" enctype="multipart/form-data" id="reportinput">
		ID : ${report.userInfo.M_ID }<br/>
		회원명 : ${report.userInfo.M_NAME }<br/>
		그룹 명 : 
			<c:forEach items="${report.groupList }" var="groupMPNO">
				<select>
					<option>${groupMPNO.GG_NAME }</option>
				</select>
				<input type="hidden" name="gg_no" value="${groupMPNO.GG_NO }">
			</c:forEach>
		<br/><br/>
		<textarea id="r_comment" name="r_comment" placeholder="신고할 내용을 적어주세요" rows="10" cols="50"></textarea><br/><br/>
		<input type="hidden" name="m_pno" value="${report.userInfo.M_NO }">
		<input type="button" value="신고하기" onclick="#this" id="insert" name="insert">
	</form>
</div>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function fn_insertReport(){
    var comSubmit = new ComSubmit("reportinput");
    comSubmit.setUrl("<c:url value='/report/reportInsert' />");
    comSubmit.submit();
 } 

$(document).ready(function() {
    $("#insert").on("click", function(e) { //등록
       e.preventDefault();
		if($('#r_comment').val()==""){
			alert("신고할 내용을 입력해주세요");
			return false;
		}else{
		alert("신고가 완료되었습니다 :3");
		fn_insertReport();
	 }
});
});

</script>
</body>
</html>