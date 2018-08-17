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
	  
		function fn_meetingsLikeit(){
	        if(isLoginCheck("${sessionScope.session_m_id}")){
		        var cs = new ComSubmit();
		        cs.setUrl("<c:url value='/group/likeit' />");
		        cs.addParam("GG_no", '${gModel.GG_NO }');
		        cs.submit();
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
				cs.setUrl("<c:url value='/group/deletecmt' />");
				cs.addParam("c_no", c_no);
				cs.addParam("gg_no", '${gModel.GG_NO }');
				cs.submit();
			}

			function fn_meetingsModify() {
				var cs = new ComSubmit();
				cs.setUrl("<c:url value='/group/groupModify' />");
				cs.addParam("gg_no", '${gModel.GG_NO }');
				cs.submit("GET");
			}

	</script>
</head>
<body>
	<div>
		<a href="javascript:history.back()">←</a>
		<table>
			<tr>
				<td>
					<img src="/yogi/resources/upload/${gModel.GG_RFN }" style="width: 340px; height: 300px;"/><br/>
					${gModel.GG_CATEGORY}<br/>
					${gModel.GG_NAME}<br/>
					${gModel.WT_NAME}<br/>
					${gModel.GG_ADDR }<br>
					${gModel.GG_PLACE }<br>
					${gModel.GG_DATE }<br>
					${gModel.GG_TOTAL }<br>
					${gModel.GG_ENABLE }<br>
					${gModel.GG_COST }<br>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
	<c:if test="${gModel.M_NO!=session_m_no }">
	<form action="/yogi/group/likeit" method="post">
			<input type="hidden" name="gg_no" value="${gModel.GG_NO}">
			<input type="hidden" name="m_no" value="${gModel.M_NO}">
	 <c:choose>
		<c:when test="${gModel.GG_LIKEIT==null }">	
			<input type="submit" value="찜">
		</c:when> 
		<c:otherwise>
			<input type="submit" value="찜취소">
		</c:otherwise>	  
	</c:choose>
	 </form>
	 </c:if>
	 </div>
	 
	 <div>
	 <c:if test="${gModel.M_NO!=session_m_no }">
	<form action="/yogi/group/enroll" method="post">
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
	 <form action="/yogi/group/modifyForm" method="post">
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
		<li>${gl.GE_NAME }</li>
		</ul>
		</c:forEach>	
	</div>
	 
		 <div>
	 	<h4> COMMENTS(${fn:length(cmtList)})</h4>	
	 	
	 	<c:forEach items="${cmtList }" var="row" varStatus="status">
		<form action='<c:url value='/group/commentsRep?c_no=${row.C_NO}&ref=${row.REF}'/>' method='post'>
		<input type='hidden' name='re_step' value='${row.RE_STEP}'/>
		<input type='hidden' name='re_level' value='${row.RE_LEVEL}'/>
		<input type="hidden" name="gg_no" value="${gModel.GG_NO}">	
		
		
	<table>	
			<c:if test='${row.RE_STEP != 0 }'>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if><tr>	
		<td>${row.C_NAME } <fmt:formatDate value="${row.C_DATE}" pattern="yy/MM/dd hh:mm:ss"/> <a href="#" onclick="doDisplay('<c:out value='${row.C_NO}'/>')">답변</a><br/>	
			${row.C_CONTENT }	
		<div id="repDiv<c:out value='${row.C_NO}'/>" style="display:none">	
		<textarea name="c_content"></textarea><input type="submit" value="답변전용">		
		</div>
			</td>
		</tr>
		</table>
		</form>
		</c:forEach>	 
		
	 </div>
	 <br/>
	 <div>
	 <form action="<c:url value='/group/comments'/>" onsubmit="return cmt_check();" method="post">
						<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
						<input type="hidden" name="ref" value='0'>
						
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="comment">Comment <span class="required">*</span></label>
										<textarea class="form-control" id="comment" rows="4" name="c_content"></textarea>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-right">
									<input type="submit" value="입력"/>
								</div>
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
			comSubmit.setUrl("<c:url value='/group/inactivateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
</script>
</body>
</html>