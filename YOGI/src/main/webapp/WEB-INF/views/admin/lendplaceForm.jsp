<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록 </title>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>장소 등록</h1>
   </tr>
</table>

<form:form commandName="lendplaceModel" name="lp_form" method="post">
<table>
	<tr>
		<td>장소명</td>
		<td><input type="text" name="L_SUBJECT"/></td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td><input type="text" name="L_ADDR"/></td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea name="L_CONTENT" ></textarea></td>
	</tr>
	
	<tr>
		<td>수용인원</td>
		<td><input type="number" name="L_ENABLE"/></td>
	</tr>
	
	<tr>
		<td>비용</td>
		<td><input type="number" name="L_PAYMENT"/></td>
	</tr>
	
		
</table>
    <input type="submit" value="장소등록" />
</form:form>


</body>
</html>