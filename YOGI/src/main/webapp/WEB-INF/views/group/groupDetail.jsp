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
		
		function cmt_check() {
				var area = document.getElementById('comment');
				if (!isLoginCheck("${sessionScope.session_m_email}")) {
					return false;
				}
				if (!area.value) {
					alertify.error("댓글에 내용이 입력되지 않았습니다.");
					area.focus();
					return false;
				}
			}

			function fn_deleteCmt(c_no) {
				var cs = new ComSubmit();
				cs.setUrl("<c:url value='/commentsDelete' />");
				cs.addParam("c_no", c_no);
				cs.addParam("gg_no", '${gModel.GG_NO }');
				cs.submit();
			}

			function fn_meetingsModify() {
				var cs = new ComSubmit();
				cs.setUrl("<c:url value='/groupModify' />");
				cs.addParam("gg_no", '${gModel.GG_NO }');
				cs.submit("GET");
			}
			
			function commentsInsert(){	
				var cs = new ComSubmit();	
				cs.setUrl("<c:url value='/comments' />");
				cs.addParam("m_name",'${sWriter.M_NAME}');
				cs.addParam("ref",0);
				cs.addParam("m_no1",'${gModel.M_NO}');
				cs.addParam("gg_no",'${gModel.GG_NO}');
				cs.addParam("c_content",$(document).find("#comment").val());
				cs.submit();
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
	 <a href="#this" name="inactivateGroup">삭제하기</a><input type="hidden" id="GG_NO" value="${gModel.GG_NO}">
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
	 
		 <div>
	 	<h4> COMMENTS(${fn:length(cmtList)})</h4>
	 	<c:forEach items="${cmtList }" var="row" varStatus="status">	
		<form action='<c:url value='/commentsRep?c_no=${row.C_NO}&ref=${row.REF}'/>' method='post'>
		<input type='hidden' name='re_step' value='${row.RE_STEP}'/>
		<input type='hidden' name='re_level' value='${row.RE_LEVEL}'/>
		<input type="hidden" name="gg_no" value="${gModel.GG_NO}"/>
		<input type="hidden" name="m_no1" value="${gModel.M_NO}"/>
		<input type="hidden" name="c_name" value="${row.C_NAME}" />		
		<fmt:parseNumber var = "blank" type = "number" value = "${row.RE_LEVEL}" />
		<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*blank}"/>px; display: inline-block">	
		${row.C_NAME } <fmt:formatDate value="${row.C_DATE}" pattern="yy/MM/dd hh:mm:ss"/> <a href="#" onclick="doDisplay('<c:out value='${row.C_NO}'/>')">답변</a> <c:if test="${row.M_NO == session_m_no }"><a href="#" onclick="fn_deleteCmt('<c:out value='${row.C_NO}'/>')">삭제</a></c:if><br/>	
			${row.C_CONTENT }	
		<div id="repDiv<c:out value='${row.C_NO}'/>" style="display:none">	
		<textarea name="c_content"></textarea><input type="submit" value="답변전용">		
		</div>
		</div>
		</form>
	</c:forEach>
	 </div>
	 <br/>
	  
	 <div>
	 <form action="<c:url value='/comments'/>" onsubmit="return cmt_check();" method="post">				
						<input type="hidden" name="ref" value='0'>			
						<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
						<input type="hidden" name="gg_no" value="${gModel.GG_NO }"/>
						 <input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="comment">Comment <span class="required">*</span></label>
										<textarea class="form-control" id="comment" rows="4" name="c_content"></textarea>
									</div>
								</div>
							</div>

							
							<div class="col-sm-12 text-right">
									<a href="#" onclick="commentsInsert()">입력</a> <!-- <input type="submit" value="입력"/> -->
							</div>
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
</script>
</body>
</html>