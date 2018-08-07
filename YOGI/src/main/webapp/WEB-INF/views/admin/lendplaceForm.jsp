<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<form action="/yogi/admin/lendplace/Insert" id="lp_form" name="lp_form" method="post" >
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
	
	<tr>
		<!-- <td><input type="button" id="insert" name="insert" value="등록" onclick="#this" /></td> -->
		<td><input type="submit" value="등록" ></td>
	</tr>
</table>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
      $(document).ready(function() {
         $("#insert").on("click", function(e) { //등록
            e.preventDefault();
            fn_insertLendplace();
         });
      });
      
      
      function fn_insertLendplace(){
         var comSubmit = new ComSubmit("lp_form");
         comSubmit.setUrl("<c:url value='/admin/lendplace/Insert' />");
         comSubmit.submit();
      }
</script>
</body>
</html>