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
	   function fn_meetingsApplyforDisable(){
	    	alertify.error("신청 마감된 모임입니다.");
	    }
		
		function fn_meetingsApplyfor(mt_no) {
			if (isLoginCheck("${sessionScope.session_m_email}")) {
				var cs = new ComSubmit();
				cs.setUrl("<c:url value='/meetings/applyform' />");
				cs.addParam("mt_no", mt_no);
				cs.submit();
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
		<a onclick="history.go(-1)">뒤로</a>
		<table>
			<tr>
				<td>
					${gModel.GG_CATEGORY}<br/>
					${gModel.GG_NAME}<br/>
					${gModel.WT_NAME}<br/>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
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
	 </div>
	 
	 <div>
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
	 </div>
	 
	 <div>
	 	<h4>${fn:length(cmtList)} COMMENTS</h4>
	 	<c:forEach items="${cmtList }" var="cmt">
		<h5>${cmt.C_NAME }
		<c:if test="${sessionScope.session_m_no != null && sessionScope.session_m_no == cmt.M_NO }">
		<a href="#this" onclick="fn_deleteCmt('${cmt.C_NO}');"><i class="fa fa-trash-o"></i></a>
		</c:if>
		</h5>
		${cmt.C_CONTENT }
		</c:forEach>	 	
	 </div>
	 <br/>
	 <div>
	 <form action="<c:url value="/group/comments"/>" onsubmit="return cmt_check();" method="post">
						<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
						<input type="hidden" name="m_no" value="${sessionScope.session_m_no}">
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
</body>
</html>