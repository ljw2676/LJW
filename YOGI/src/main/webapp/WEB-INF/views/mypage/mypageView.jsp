<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>마이 페이지</h1>
   </tr>
</table>
${session_m_id }님 <br />

<a href="<c:url value='/mypage/writeHistory'/>">내가 개설한 모임</a>
<a href="<c:url value='/mypage/meetHistory'/>">내가 참여한 모임</a>
<a href="<c:url value='/mypage/zzimHistory'/>">나의 찜 목록</a>
<a href="<c:url value='/mypage/placebookHistory'/>">장소 신청 내역</a>


</body>
</html>