<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function lendDelete() {
	if(confirm("삭제 하시겠습니까?") == true){
		location.href='/admin/lendplace/Delete?l_no=${lendplaceModel.l_no}';
	}else {
		return;
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" value = "삭제"  onclick = "lendDelete();"/>

</body>
</html>