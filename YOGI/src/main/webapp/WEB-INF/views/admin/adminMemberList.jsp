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
		<c:forEach items="${list}" var="list" varStatus="stat">
		<tr>
			<td>${list.m_no}</td>
			<td>${list.m_id}</td>
			<td>${list.m_phone}</td>
			<td>${list.m_grade}</td>
			<td>${list.m_lv}</td>
			<td>${list.m_penalty}</td>
			<td>${list.m_date}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>