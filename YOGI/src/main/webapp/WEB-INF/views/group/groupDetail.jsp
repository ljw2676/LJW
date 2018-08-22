<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<script src="http://code.jquery.com/jquery-latest.js"></script>
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

	function List(){
		var tmpHtml = "";
		tmpHtml = tmpHtml + '<textarea name="c_content"/>';
			 
		$("#div_List").append(tmpHtml);
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
	
</script>
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
				cs.addParam("c_name",$(document).find("#c_name").val());
				cs.addParam("ref",0);
				cs.addParam("m_no1",'${gModel.M_NO}');
				cs.addParam("gg_no",'${gModel.GG_NO}');
				cs.addParam("c_content",$(document).find("#comment").val());
				cs.submit();
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
		<input type="hidden" name="gg_no" value="${gModel.GG_NO}">	
	
	<div>
	<c:choose>
	<c:if test="${gModel.M_NO!=session_m_no }">
	<form action="/yogi/likeit" method="post">
			<input type="hidden" name="gg_no" value="${gModel.GG_NO}">
			<input type="hidden" name="m_no" value="${gModel.M_NO}">
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
	<form action="/yogi/group/modifyForm" method="post">
		<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
		<input type="hidden" name="m_no" value="${gModel.M_NO}">
		<input type="submit" value="수정하기">
	</form>
	<a href="#this" name="inactivateGroup">삭제하기</a><input type="hidden" id="GG_NO" value="${gModel.GG_NO}">
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
	 	글작성한 사람의 M_NO = ${gModel.M_NO}
		<h4>신청자(${geList.size()})</h4>
		<c:forEach items="${geList }" var="gl">
		<ul>
		<li>${gl.GE_NAME }</li>
		</ul>
		</c:forEach>	
	</div>
	 
	<div>
		<h4> COMMENTS(${fn:length(cmtList)})</h4>
		<c:forEach items="${cmtList }" var="row">
			<ul>
				<li>${row.C_NAME } <div class="div_list"><a onclick="List()">답글달기</a></div> </li>
				<li>${row.C_CONTENT }</li>
			</ul>
		</c:forEach>	 	
	</div>
	<br/>
	<div>
	<form action="<c:url value="/group/comments"/>" onsubmit="return cmt_check();" method="post">
		<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
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
		<input type="hidden" name="c_name" id="c_name" value="${row.C_NAME }" />
	</c:forEach>
	 </div>
	 <br/>
	  
	 <div>
	 <form action="<c:url value='/comments'/>" id="cmtist" onsubmit="return cmt_check();" method="post">				
						<input type="hidden" name="ref" value='0'>			
						<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
						<input type="hidden" name="gg_no" value="${gModel.GG_NO }"/>
						===================${gModel.GG_NO }
	
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
									<a href="#" onclick="commentsInsert()">입력</a> <!-- <input type="submit" value="입력"/> -->
							</div>
					</form>
			 </div>
	 
	<c:if test="reply">
	<form action="replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		<input type="hidden" name="ref" value="${cmtList.C_REF }" />
		<input type="hidden" name="re_level" value="${cmtList.C_LV }" />
		<input type="hidden" name="re_step" value="${cmtList.C_RE }" />
	</form>
	</c:if>
	
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