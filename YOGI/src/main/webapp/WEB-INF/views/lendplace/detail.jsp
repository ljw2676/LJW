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
<title>장소 상세보기</title>
<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">
</head>
<body>
<form name="apply_form" action="<c:url value='/lendplace/apply' />"  method="post">
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
						<td><a href="javascript:map();">${map.L_ADDR}&nbsp;(${map.L_SUBJECT})</a></td>
						<td>${map.L_CONTENT}</td>
						<td>${map.L_REP_IMAGE}</td>
						<td>${map.L_ENABLE}명</td>
						<td>${map.L_PAYMENT}원</td>
						<td>${map.L_SDATE} ~ ${map.L_EDATE}</td>
						<td>${map.L_RATE}</td>
					</tr>
					
					<tr>
						<td><a href="#this" name="apply">신청</a></td>
						<td><a href="<c:url value='/lendplace/list'/>">목록</a></td>
					</tr>
</table>
<input type="hidden" name="L_NO" value="${map.L_NO}"><input type="hidden" name="M_NO" value="${session_m_no}">
<input type="hidden" data-toggle="datepicker" name="U_DATE"></input> 
<div id="datepicker-container"></div>
</form>

<p>&nbsp;</p>

후기 
<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="review_form" id="review_form" action="<c:url value='/lendplace/insertReview' />" method="post">
        <input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>"> 
        <input type="hidden" name="M_NO" value="<c:out value="${session_m_no}"/>">
        <textarea name="R_CONTENT" id="R_CONTENT" rows="3" cols="60" maxlength="500" placeholder="후기를 달아주세요."></textarea>
        <a href="#" onclick="fn_insertReview()">저장</a>
    </form>
</div>

<c:forEach var="reviewlist" items="${list}" varStatus="status">
	<fmt:parseNumber var = "blank" type = "number" value = "${reviewlist.R_DEPTH}" />
    <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*blank}"/>px; display: inline-block">
        <c:choose>
        	<c:when test="${reviewlist.R_DELETEFLAG eq 'Y'}">
        		삭제된 댓글입니다.
        		<c:if test="${session_m_id == reviewlist.M_ID}">
        			<a href="#" onclick="fn_deleteReview('<c:out value="${reviewlist.R_NO}"/>')">삭제</a>
        		</c:if>
        	</c:when>
        	<c:otherwise>
	        	<c:out value="${reviewlist.M_ID}"/> <c:out value="${reviewlist.R_DATE}"/>
	        	<c:if test="${session_m_id == reviewlist.M_ID}">
        			<a href="#" onclick="fn_deleteReview('<c:out value="${reviewlist.R_NO}"/>','<c:out value="${reviewlist.R_GROUP}"/>')">삭제</a>
        			<a href="#" onclick="fn_reviewUpdate('<c:out value="${reviewlist.R_NO}"/>')">수정</a>
        		</c:if>
        		<a href="#" onclick="fn_reviewReply('<c:out value="${reviewlist.R_NO}"/>')">댓글</a>
        		<br/>
        		<div id="review<c:out value="${reviewlist.R_NO}"/>">	
        		<c:out value="${reviewlist.R_CONTENT}"/>
        		</div>
        	</c:otherwise>
        </c:choose>
    </div>
</c:forEach>

<div id="reviewDiv" style="width: 99%; display:none">
    <form name="form2" id="form2" action="<c:url value='/lendplace/insertReview' />" method="post">
        <input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>">
        <input type="hidden" name="R_GROUP" id="R_GROUP">
        <input type="hidden" name="R_NO" id="R_NO"> 
        <textarea name="R_CONTENT" rows="3" cols="60" maxlength="500"></textarea>
        <a href="#" onclick="fn_reviewUpdateSave()">저장</a>
        <a href="#" onclick="fn_reviewUpdateCancel()">취소</a>
    </form>
</div>

<div id="replyDialog" style="width: 99%; display:none">
    <form name="form3" action="<c:url value='/lendplace/insertReview' />" method="post">
        <input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>"> 
        <input type="hidden" name="R_NO"> 
        <input type="hidden" name="R_PARENT">
       	<input type="hidden" name="M_NO" value="<c:out value="${session_m_no}"/>"> <br/>
        <textarea name="R_CONTENT" rows="3" cols="60" maxlength="500"></textarea>
        <a href="#" onclick="fn_replyReviewSave()">저장</a>
        <a href="#" onclick="fn_replyReviewCancel()">취소</a>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script type="text/javascript">
$(document).ready(function() {
    $("a[name='apply']").on("click", function(e) { //신청
    /* 태그의 기본 기능을 제거 */
    e.preventDefault();
    if(confirm("신청 하시겠습니까?")==true){
    fn_applyLendplace();
    } else {
       return;
    }
    
    });
});

function fn_applyLendplace(){
 alert("장소 대여 신청이 완료되었습니다 :3");
    document.apply_form.submit();
}

function fn_insertReview() {
	if ($.trim($("#R_CONTENT").val()) == "") {
        alert("내용을 입력해주세요.");
        $("#R_CONTENT").focus();
        return;
    }
    $("#review_form").submit();  
}
function fn_deleteReview(R_NO, R_GROUP){
    if (!confirm("삭제하시겠습니까?")) {
        return;
    }
    $("#form2").attr("action", "<c:url value='/lendplace/deleteReview'/>");
    $("#R_NO").val(R_NO);
    $("#R_GROUP").val(R_GROUP);
    $("#form2").submit();

    /* var form = document.form2;

    form.action="<c:url value='/lendplace/deleteReview'/>";
    form.R_NO.value=R_NO;
    form.R_GROUP.value=R_GROUP;
    form.submit();     */
}



var updateR_NO = updateR_CONTENT = null;
function fn_reviewUpdate(R_NO){
    var form = document.form2;
    var review = document.getElementById("review"+R_NO);
    var reviewDiv = document.getElementById("reviewDiv");
    reviewDiv.style.display = "";
    
    if (updateR_NO) {
        document.body.appendChild(reviewDiv);
        var oldR_NO = document.getElementById("review"+updateR_NO);
        oldR_NO.innerText = updateR_CONTENT;
    } 
    
    form.R_NO.value=R_NO;
    form.R_CONTENT.value = review.innerText;
    review.innerText ="";
    review.appendChild(reviewDiv);
    updateR_NO = R_NO;
    updateR_CONTENT = form.R_CONTENT.value;
    form.R_CONTENT.focus();
} 

function fn_reviewUpdateSave(){
    var form = document.form2;
    if (form.R_CONTENT.value=="") {
        alert("글 내용을 입력해주세요.");
        form.R_CONTENT.focus();
        return;
    }
    
    form.action="<c:url value='/lendplace/insertReview' />";
    form.submit();    
} 

function fn_reviewUpdateCancel(){
    var form = document.form2;
    var reviewDiv = document.getElementById("reviewDiv");
    document.body.appendChild(reviewDiv);
    reviewDiv.style.display = "none";
    
    var oldReno = document.getElementById("review"+updateR_NO);
    oldReno.innerText = updateR_CONTENT;
    updateR_NO = updateR_CONTENT = null;
} 


function hideDiv(id){
    var div = document.getElementById(id);
    div.style.display = "none";
    document.body.appendChild(div);
}

function fn_reviewReply(R_NO){
    var form = document.form3;
    var reply = document.getElementById("review"+R_NO);
    var replyDia = document.getElementById("replyDialog");
    replyDia.style.display = "";
    
    if (updateR_NO) {
    	fn_reviewUpdateCancel();
    } 
    
    form.R_CONTENT.value = "";
    form.R_PARENT.value=R_NO;
    reply.appendChild(replyDia);
    form.R_CONTENT.focus();
} 
function fn_replyReviewCancel(){
    hideDiv("replyDialog");
} 

function fn_replyReviewSave(){
    var form = document.form3;
    
    if (form.R_CONTENT.value=="") {
        alert("글 내용을 입력해주세요.");
        form.R_CONTENT.focus();
        return;
    }
    
    form.action="<c:url value='/lendplace/insertReview' />";
    form.submit();    
}

$( function() {/* 달력 */
	 
	 $('[data-toggle="datepicker"]').datepicker({
		  language: 'ko-KR',
		  inline: true,
		  container: '#datepicker-container',
		  format: 'yyyy-mm-dd',
		  startDate: '${map.L_SDATE}',
		  endDate: '${map.L_EDATE}',
		  filter: function(date){
			 <c:forEach items="${date}" var="date"> 
			  var Udate = new Date("${date.U_DATE}");
			  if (date.getFullYear() === Udate.getFullYear()) {
					if (date.getMonth()	=== Udate.getMonth()) {
						if (date.getDate() === Udate.getDate()) {
						       return false; 
						}
					}
				 }
			 </c:forEach>
	  		}
	 });
});

//지도
function map(){
	var popupX=(window.screen.width/2)-(700/2);
	
	var popupY=(window.screen.height/2)-(500/2);
	
	var uri="http://localhost:8080/yogi/map/map.jsp?l_addr=${map.L_ADDR}&l_subject=${map.L_SUBJECT}";
	var res = encodeURI(uri);
	
	
	window.open(res,"post","toolbar=no ,width=700 ,height=500 ,directories=no,status=yes,scrollbars=no,menubar=no,left="+ popupX +",top="+ popupY +", screenX="+ popupX +", screenY= "+ popupY);
	}

</script>
</body>
</html>