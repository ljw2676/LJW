<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
멤버 리스트
<table border="1">
	<thead>
		<tr background="gray">
			<th>no.</th>
			<th>ID</th>
			<th>phone</th>
			<th>점수</th>
			<th>등급</th>
			<th>penalty</th>
			<th>가입날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="adminMemberList" varStatus="stat">
		<tr>
			<td>${adminMemberList.m_no}</td>
			<td>${adminMemberList.m_id}</td>
			<td>${adminMemberList.m_phone}</td>
			<td>${adminMemberList.m_grade}</td>
			<td>${adminMemberList.m_lv}</td>
			<td>${adminMemberList.m_penalty}</td>
			<td>${adminMemberList.m_date}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>