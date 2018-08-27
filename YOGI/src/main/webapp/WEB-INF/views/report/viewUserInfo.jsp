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
<title>멤버 프로필 창</title>
<script type="text/javascript">
function report(m_pno) {
	window.opener.location.href="http://localhost:8080/yogi/report/reportForm?m_pno="+m_pno;
	self.close();
}
function end(){
	self.close();
}
</script>
</head>
<body>
<div align="center">
<c:if test="${userInfo.M_PROFILE }!=null">
	<img src="/yogi/resources/upload/${userInfo.M_PROFILE }" style="width: 200px; height: 200px;">
</c:if>
<c:if test="${userInfo.M_PROFILE }==null">
	<img src="/yogi/resources/image/no_image.png" style="width: 200px; height: 200px;">
</c:if>
</div>
<div align="center">
	<form:form commandName="user" name="user" method="post" enctype="multipart/form-data">
		<input type="hidden" name="m_no" value="${userInfo.M_NO }">
		ID : ${userInfo.M_ID }<br />
		이름 : ${userInfo.M_NAME}<br />
		등급 : ${userInfo.M_LV }<br />
		페널티 : ${userInfo.M_PENALTY }<br />
		<input type="button" value="신고하기" onclick="report('${userInfo.M_NO }')">
		<input type="button" value="닫기" onclick="end()">
	</form:form>
</div>
</body>
</html>