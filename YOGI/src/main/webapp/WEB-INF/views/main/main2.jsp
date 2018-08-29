<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/chat.css">
<title>메인화면</title>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script>
$(".chat").on({
    "click" : function() {
    	alert("asdf");
        if ($(this).attr("src") == "./img/chat.png") {
            $(".chat").attr("src", "./img/chathide.png");
            $("#_chatbox").css("display", "block");
            openSocket();
        } else if ($(this).attr("src") == "./img/chathide.png") {
            $(".chat").attr("src", "./img/chat.png");
            $("#_chatbox").css("display", "none");
            closeSocket();
        }
    }
});
</script>
</head>
<body>
	요긔요긔 >__<
	아이디눈 : ${session_m_id}
	<br>
	그룹 리스트
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<table border="1">
		<tr background="gray">
			<td>no.</td>
			<td>그룹명</td>
			<td>주최자</td>
			<td>카테고리</td>
			<td>장소</td>
			<td>비용(원)</td>
			<td>총 인원(명)</td>
		</tr>
		<c:forEach items="${list}" var="row" begin="1" end="4" step="1">
		<tr>
			<td><a href="http://localhost:8080/yogi/groupDetail?gg_no=${row.GG_NO}">
			<img src="C:/java/git/YOGI/YOGI/src/main/webapp/resources/upload/${row.GG_RFN }" style="width: 340px; height: 300px;"/></a></td>
			<td>${row.GG_NO}</td>
			<td>${row.GG_NAME}</td>
			<td>${row.M_NAME}</td>
			<td>${row.GG_CATEGORY}</td>
			<td>${row.GG_PLACE}</td>
			<td>${row.GG_COST}</td>
			<td>${row.GG_TOTAL}</td>
		</tr>
		</c:forEach>
</table>
</c:when>
<c:otherwise>
		<br>
		생성된 그룹이 없습니다.
</c:otherwise>
</c:choose>
<a href="http://localhost:8080/yogi/groupList">더보기</a>
<a href="http://localhost:8080/yogi/lendplace/list">장소</a>
<a href="http://localhost:8080/yogi/members/modifyForm">회원 정보 수정</a>
<a href="http://localhost:8080/yogi/admin/adminpageView">관리자 페이지</a>
<a href="http://localhost:8080/yogi/logout">로그아웃</a>

<br><br><br>
채팅... 해볼래...? 킼
<div class="check">
	<input type="checkbox" id="status" onclick="openChat();"/> 
	<label for="check"></label>
</div>
<!-- <input type="checkbox" id="status" onclick="openChat();"/> -->
<!-- <input type="button" id="status" onclick="openChat();" value="open"/> -->
<div id="_chatbox" style="display: none">
<fieldset>
	<div id="messageWindow">
        <input type="hidden" id="sender" value="${session_m_id}">
        <input id="messageinput" type="text" onkeyup="enterkey()"  />
        <input type="button" onclick="send();" value="Send">
	    <!-- Server responses get written here -->
    	<div id="messages"></div>
    </div>
</fieldset>
</div>

<div>
<ul>
		<c:forEach items="${sessionScope.session_mem_alram}" var="alram">
			<li>
				<table style="width: 100%">
					<tr>
						<td><c:if test="${alram.ALRAM_INDEX_NO == 1 }">
								<a href="alramRead?alram_seq=${alram.ALRAM_SEQ }">작성한 모임에
									<strong>${alram.REG_ID }</strong> 님이 댓글을 남겼습니다!
								</a>
							</c:if>
							<c:if test="${alram.ALRAM_INDEX_NO == 2 }">
								<a href="alramRead?alram_seq=${alram.ALRAM_SEQ }">회원님이 신청한 모임이 수정되었습니다!
								</a>
							</c:if>
						</td>
					</tr>
				</table>
			</li>
		</c:forEach>
	</ul>
</div>
    
 <!-- <img class="chat" src="./img/chat.png" /> -->


<script type="text/javascript">
	var ws;
	var messages=document.getElementById("messages");
        
	function openSocket(){
		if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
			writeResponse("WebSocket is already opened.");
			return;
		}
		//웹소켓 객체 만드는 코드
		ws=new WebSocket("ws://localhost:8080/yogi/echoecho");
            
		ws.onopen=function(event){
			if(event.data===undefined) return;
				writeResponse(event.data);
		};
		ws.onmessage=function(event){
			writeResponse(event.data);
		};
		ws.onclose=function(event){
			writeResponse("Connection closed");
		}
	}
        
	function send(){
		var text=document.getElementById("sender").value + ":" + document.getElementById("messageinput").value;
		ws.send(text);
		text="";
		document.getElementById("messageinput").value="";
	}
        
	function closeSocket(){
		ws.close();
	}
	function writeResponse(text){
		messages.innerHTML+="<br/>"+text;
	}
	
	function openChat(){
		var stat = document.getElementById('status').value;
		if(stat == 'Close'){
			document.getElementById("status").value="open";
			$("#_chatbox").css("display", "none");
			closeSocket();
		}
		else{
			openSocket();
			document.getElementById("status").value="Close";
			$("#_chatbox").css("display", "block");
			
		}
	}
	
//  엔터키를 통해 send함
	function enterkey() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
    //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	window.setInterval(function() {
		var elem = document.getElementById('messageWindow');
		elem.scrollTop = elem.scrollHeight;
	}, 0);
</script>

</body>
</html>