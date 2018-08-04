<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 상세보기</title>
</head>
<body>
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
</table>
</body>
</html>