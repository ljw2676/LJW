<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 상세페이지</title>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery-1.7.1.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.css'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.js'/>" charset="utf-8"></script>
<script type="text/javascript">
function doDisplay(C_NO){
		 var con = document.getElementById("repDiv"+C_NO);
	if(con.style.display=='block'){
	    con.style.display = 'none';
		  }else{
		     con.style.display = 'block';
	   }
}	

function fn_meetingsModify() {
	var cs = new ComSubmit();
	cs.setUrl("<c:url value='/groupModify' />");
	cs.addParam("gg_no", '${gModel.GG_NO }');
	cs.submit("GET");
}
			$(document).ready(function(){
				$("#likeit").bind("click", function() {
					var gg_no = ${gModel.GG_NO };
					$.ajax({
						async:true,
						type:'POST', 
						data : {"gg_no":gg_no},
						url:'/yogi/group/likeit',
						dataType : "json",
						success : function(data){
							if(data.likeIt > 0){
								document.getElementById("likeit").value="찜 취소";
							}else{
								document.getElementById("likeit").value="찜";
							}
						},
						error : function(error){
							alert("error: " + error)
						}
					})
				})
			})
function fn_memberProfileLink(m_pno){
   var url = "/yogi/report/viewUserInfo?m_pno="+m_pno;
   var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=600";
   window.open(url,"",option);
}
			
	</script>
</head>
<body>
	<div>
		<a href="http://localhost:8080/yogi/groupList">목록으로!</a>
		<table>
			<tr>
				<td>
					<img src="/yogi/resources/upload/${gModel.GG_RFN }" style="width: 340px; height: 300px;"/><br/>
					카테고리: <strong>${gModel.GG_CATEGORY}</strong><br/>
					글 제목: <strong>${gModel.GG_NAME}</strong><br/>
					모임 주최자: <strong>${gModel.WT_NAME}</strong><br/>
					모임 주소: <strong>${gModel.GG_ADDR }</strong><br>
					모임 장소: <strong>${gModel.GG_PLACE }</strong><br>
					모임  날짜: <strong>${gModel.GG_DATE }</strong><br>
					모임 총 인원: <strong>${gModel.GG_TOTAL }</strong><br>
					모임 신청인원: <strong>${gModel.GG_ENABLE }</strong><br>
					비용: <strong>${gModel.GG_COST }</strong><br>
				
				</td>
			</tr>
		</table>
	</div>
	
		<input type="hidden" name="gg_no" value="${gModel.GG_NO}">	
	<div>
	<c:choose>
		<c:when test="${gModel.GG_LIKEIT==null }">	
			<input type="button" id="likeit" value="찜">
		</c:when> 
		<c:otherwise>
			<input type="button" id="likeit" value="찜 취소">
		</c:otherwise>	  
	</c:choose>
	</div>
	 <div>
	 <c:if test="${gModel.M_NO!=session_m_no }">
	<form action="/yogi/enroll" method="post">
			<input type="hidden" name="gg_no" value="${gModel.GG_NO}">
			<input type="hidden" name="m_no" value="${gModel.M_NO}">
	 <c:choose>
		<c:when test="${gModel.GG_ENROLL==null }">	
			<input type="submit" value="모임신청">
		</c:when> 
		<c:otherwise>
			<input type="submit" value="모임취소">
		</c:otherwise>	  
	</c:choose>
	 </form>
	 </c:if>
	 </div>
	 
	 <div>
	 <c:if test="${gModel.M_NO==session_m_no }">
	 <form action="/yogi/modifyForm" method="post">
	 	<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
	 	<input type="hidden" name="m_no" value="${gModel.M_NO}">
	 	<input type="submit" value="수정하기">
	 </form>
	 <a href="#this" name="inactivateGroup">삭제하기</a><input type="hidden" id="gg_no" value="${gModel.GG_NO}">
	 </c:if>
	 </div>
	 
	 <div>
		<h4>신청자(${geList.size()})</h4>
		<c:forEach items="${geList }" var="gl">
   		   <ul>
       		  <a href="#this" onclick="fn_memberProfileLink('${gl.M_NO}')">
           		 <li>${gl.GE_NAME }</li>
       		  </a>
    	  </ul>
		</c:forEach>	
	</div>
	 
	 	<h4> COMMENTS(${fn:length(cmtList)})</h4>
	 	
	 	<div style="border: 1px solid; width: 600px; padding: 5px">
    							<form name="review_form" id="review_form" action="<c:url value='/comments'/>" method="post">
        						<input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>"> 
        						<input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
								<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
        						<input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>">
        						<textarea name="c_content" id="c_content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        						<a href="#" onclick="fn_insertReview()">저장</a>
    							</form>
							</div>

							<c:forEach var="row" items="${cmtList}" varStatus="status">
							<fmt:parseNumber var = "blank" type = "number" value = "${row.C_DEPTH}" />
    						<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*blank}"/>px; display: inline-block">
        						<c:choose>
        							<c:when test="${row.C_DEL eq 'Y'}">
        								삭제된 댓글입니다.
        							<c:if test="${session_m_no == row.M_NO}">
        								<a href="#" onclick="fn_deleteReview('<c:out value="${row.C_NO}"/>')">삭제</a>
        							</c:if>
        							</c:when>
        							<c:otherwise>
	        							<c:out value="${row.C_NAME}"/>
	        							<c:if test="${session_m_no == row.M_NO}">
        									<a href="#" onclick="fn_deleteReview('<c:out value="${row.C_NO}"/>','<c:out value="${row.C_GROUP}"/>')">삭제</a>
        								</c:if>
        									<a href="#" onclick="fn_reviewReply('<c:out value="${row.C_NO}"/>')">댓글</a>
        								<br/>
        								<div id="review<c:out value="${row.C_NO}"/>">	
        									<c:out value="${row.C_CONTENT}"/>
        								</div>
        							</c:otherwise>
        						</c:choose>
    						</div>					
							</c:forEach>

							 <div id="reviewDiv" style="width: 99%; display:none">
    							<form name="form2" id="form2" action="<c:url value='/comments' />" method="post">
    							    <input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>">
        							<input type="hidden" name="c_no" id="c_no">
     							    <input type="hidden" name="c_group" id="c_group">
     							    <input type="hidden" name="c_parent">   							
        							<input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
									<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
									<input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>"> 
        							<textarea name="c_content" rows="3" cols="60" maxlength="500"></textarea>
        							<a href="#" onclick="fn_reviewUpdateSave()">저장</a>
        							<a href="#" onclick="fn_reviewUpdateCancel()">취소</a>
    							</form>
							</div> 

							<div id="replyDialog" style="width: 99%; display:none">
    							<form name="form3" action="<c:url value='/comments'/>" method="post">
     							   <input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>"> 							   					   
   								   <input type="hidden" name="c_parent">
   								   <input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
								   <input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
     							   <input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>"> <br/>
   								   <textarea name="c_content" rows="3" cols="60" maxlength="500"></textarea>
    							   <a href="#" onclick="fn_replyReviewSave()">저장</a>
   								   <a href="#" onclick="fn_replyReviewCancel()">취소</a>
    							</form>	
							</div>
			
	 <form id="commonForm" name="commonForm"></form>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	 <script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
	 <script type="text/javascript">
		$(document).ready(function() {
			$("a[name='inactivateGroup']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateGroup($(this));
			});
		});
		
		function fn_inactivateGroup(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inactivateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
		
		function fn_insertReview() {
			if ($.trim($("#c_content").val()) == "") {
		        alert("내용을 입력해주세요.");
		        $("#c_content").focus();
		        return;
		    }
		    $("#review_form").submit();  
		}
		
		function fn_deleteReview(C_NO, C_GROUP){
		    if (!confirm("삭제하시겠습니까?")) {
		        return;
		    }
		    $("#form2").attr("action", "<c:url value='/deleteCmt'/>");
		    $("#c_no").val(C_NO);
		    $("#c_group").val(C_GROUP);
		    $("#form2").submit();

		    /* var form = document.form2;

		    form.action="<c:url value='/lendplace/deleteReview'/>";
		    form.R_NO.value=R_NO;
		    form.R_GROUP.value=R_GROUP;
		    form.submit();     */
		}


	 var updatec_no = updatec_content = null;
		function fn_reviewUpdate(c_no){
		    var form = document.form2;
		    var review = document.getElementById("review"+c_no);
		    var reviewDiv = document.getElementById("reviewDiv");
		    reviewDiv.style.display = "";
		    
		    if (updatec_no) {
		        document.body.appendChild(reviewDiv);
		        var oldc_no = document.getElementById("review"+updatec_no);
		        oldc_no.innerText = updatec_content;
		    } 
		    
		    form.c_no.value=c_no;
		    form.c_content.value = review.innerText;
		    review.innerText ="";
		    review.appendChild(reviewDiv);
		    updatec_no = c_no;
		    updatec_content = form.c_content.value;
		    form.c_content.focus();
		} 

		 function fn_reviewUpdateSave(){
		    var form = document.form2;
		    if (form.c_content.value=="") {
		        alert("글 내용을 입력해주세요.");
		        form.c_content.focus();
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
		    
		    var oldReno = document.getElementById("review"+updatec_no);
		    oldReno.innerText = updatec_content;
		    updatec_no = updatec_content = null;
		}


		function hideDiv(id){
		    var div = document.getElementById(id);
		    div.style.display = "none";
		    document.body.appendChild(div);
		}

		function fn_reviewReply(c_no){
		    var form = document.form3;
		    var reply = document.getElementById("review"+c_no);
		    var replyDia = document.getElementById("replyDialog");
		    replyDia.style.display = "";
		    
		    if (updatec_no) {
		    	fn_reviewUpdateCancel();
		    } 
		    
		    form.c_content.value = "";
		    form.c_parent.value=c_no;
		    reply.appendChild(replyDia);
		    form.c_content.focus();
		} 
		function fn_replyReviewCancel(){
		    hideDiv("replyDialog");
		} 

		function fn_replyReviewSave(){
		    var form = document.form3;
		    
		    if (form.c_content.value=="") {
		        alert("글 내용을 입력해주세요.");
		        form.c_content.focus();
		        return;
		    }
		    
		    form.action="<c:url value='/comments' />";
		    form.submit();    
		}
		
</script>
</body>
</html>