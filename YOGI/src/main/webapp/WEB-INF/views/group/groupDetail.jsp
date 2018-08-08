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
	</script>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>
					${gModel.GG_CATEGORY}<br/>
					${gModel.GG_NAME}<br/>
					<%-- ${host.M_NAME}<br/> --%>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
	<%-- <form action="/yogi/group/likeit" method="post">
			<input type="hidden" name="gg_no" value="${gModel.GG_NO}">
			<input type="hidden" name="m_no" value="${gModel.M_NO}">		
	 <c:choose>
		<c:when test="${gModel.GG_LIKEIT } == null">	
			<input type="submit" value="찜">
		</c:when>
		<c:otherwise>
			<input type="submit" value="찜취소">
		</c:otherwise>	 
	</c:choose>
	 </form> --%>
	<%--  <button type="button" class="btn ${gModel.GG_LIKEIT == null ? 'btn-default':(gModel.GG_LIKEIT == sessionScope.session_m_no ? 'btn-template-primary':'btn-default')}" onclick="fn_meetingsLikeit();" data-toggle="tooltip" data-placement="top" title="" data-original-title="찜">
										<i class="fa fa-thumbs-o-up"></i>
	</button> --%>
	 </div>
</body>
</html>