<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function Check() {
    var f = document.lp_form;
    
    if(f.l_sdate.value == "") {
       alertify.error("대관 시작 날짜를 입력해주세요");
       f.l_sdate.focus();
       return false;
    }
    
    if(f.l_edate.value == "") {
        alertify.error("대관 종료 날짜를 입력해주세요");
        f.l_edate.focus();
        return false;
     }
         
    if(f.l_addr.value == "") {
        alertify.error("장소 상세 주소를 입력해주세요");
        f.l_addr.focus();
        return false;
     }
    
    if(f.l_enable.value == "") {
        alertify.error("총 인원을 입력해주세요");
        f.l_enable.focus();
        return false;
     }
    
    if(f.l_payment.value == "") {
        alertify.error("비용을 입력해주세요");
        f.l_payment.focus();
        return false;
     }
    
    if(f.l_subject.value == "") {
        alertify.error("장소명을 입력해주세요");
        f.l_subject.focus();
        return false;
     }
    
    if(f.l_content.value == "") {
        alertify.error("내용을 입력해주세요");
        f.l_content.focus();
        return false;
     }
    alert("장소가 정상적으로 등록되었습니다.");
    
    document.lp_form.submit();
 }
</script>
<title>Insert title here</title>
</head>
<body>
<table border="0" width=1000px align=center>
	<tr>
		<h1>장소 등록</h1>
	</tr>
</table>

<form name="lp_form" action="<c:url value='/admin/lendplace/Insert'/>" method="post" enctype="multipart/form-data" theme="simple" >
대관 시작 날짜 <input type="text" name="l_sdate" /><br />
대관 종료 날짜 <input type="text" name="l_edate" /><br />
장소명 <input type="text" name="l_subject" /><br />
주소 <input type="text" name="l_addr" /><br />
내용 <textarea name="l_content"></textarea><br />
대표 이미지 <input type="file" name="l_rep_img" /><br />
수용인원 <input type="number" name="l_enable" /><br />
비용 <input type="number" name="l_payment" /><br />
<input type="button" value="장소등록" onclick="return Check();">

</form>
</body>
</html>