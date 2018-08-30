<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome to YOGI~!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	<!-- Animate.css -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/flexslider.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/fonts/flaticon/font/flaticon.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/style.css">

	<!-- Modernizr JS -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
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
<div id="colorlib-page">
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
	<h1 id="colorlib-logo"><a href="http://localhost:8080/yogi/main">YOGI</a></h1>
	<nav id="colorlib-main-menu" role="navigation">
	<ul>
		<li class="colorlib-active"><a href="http://localhost:8080/yogi/main">Home</a></li>
		<li><a href="http://localhost:8080/yogi/groupList">Group</a></li>
		<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
		<li><a href="http://localhost:8080/yogi/mypage/mypageView">MyPage</a></li>
		<li><a href="">About</a></li>
		<li><a href="http://localhost:8080/yogi/logout">Logout</a></li>
	</ul>
	</nav>
	<div class="colorlib-footer">
			<p><small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> Made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> Distributed by: <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </span> <span>Demo Images: <a href="http://nothingtochance.co/" target="_blank">nothingtochance.co</a></span></small></p>
<span>MADE BY: <a href="">YOMI</a></span>
	</div>
</aside>

<div id="colorlib-main">
	<aside id="colorlib-hero" class="js-fullheight">
	<div class="flexslider js-fullheight">
	<ul class="slides">
		<li style="background-image: url(http://localhost:8080/yogi/resources/bootstrap/images/mainPic1.png);">
			<div class="overlay"></div>
			<div class="container-fluid">
			<div class="row">
			<div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
			<div class="slider-text-inner">
			<div class="desc">
				<h1>An Inspiring Built Space</h1>
				<h2>100% html5 bootstrap templates Made by <a href="https://colorlib.com/" target="_blank">colorlib.com</a></h2>
				<p><a class="btn btn-primary btn-learn">View Project <i class="icon-arrow-right3"></i></a></p>
			</div>
			</div>
			</div>
			</div>
			</div>
		</li>
		<li style="background-image: url(http://localhost:8080/yogi/resources/bootstrap/images/mainPic2.png);">
			<div class="overlay"></div>
			<div class="container-fluid">
			<div class="row">
			<div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
			<div class="slider-text-inner">
			<div class="desc">
				<h1>Interior Design Studio</h1>
				<h2>100% html5 bootstrap templates Made by <a href="https://colorlib.com/" target="_blank">colorlib.com</a></h2>
				<p><a class="btn btn-primary btn-learn">View Project <i class="icon-arrow-right3"></i></a></p>
			</div>
			</div>
			</div>
			</div>
			</div>
		</li>
		<li style="background-image: url(http://localhost:8080/yogi/resources/bootstrap/images/mainPic3.png);">
			<div class="overlay"></div>
			<div class="container-fluid">
			<div class="row">
			<div class="col-md-6 col-md-offset-3 col-md-push-3 col-sm-12 col-xs-12 js-fullheight slider-text">
			<div class="slider-text-inner">
			<div class="desc">
				<h1>The National Gallery</h1>
				<h2>100% html5 bootstrap templates Made by <a href="https://colorlib.com/" target="_blank">colorlib.com</a></h2>
				<p><a class="btn btn-primary btn-learn">View Project <i class="icon-arrow-right3"></i></a></p>
			</div>
			</div>
			</div>
			</div>
			</div>
		</li>
	</ul>
	</div>
	</aside>

	<div class="colorlib-work">
	<div class="colorlib-narrow-content">
		<div class="row">
		<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
			<span class="heading-meta">A Perfect Meeting for You ${session_m_id}!</span>
				<h2 class="colorlib-heading animate-box">Recommend Group</h2>
		</div>
		</div>
		<c:choose>
		<c:when test="${fn:length(list) > 0 }">
		<div class="row">
		<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[0].GG_RFN}');">
			<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[0].GG_NO}">${list[0].GG_NAME }</a></h3>
				<span>
				<br><br><br>
				#${list[0].GG_CATEGORY}<br>
				비용 : ${list[0].GG_COST }<br>
				인원 : ${list[0].GG_TOTAL} / ${list[0].GG_ENABLE}
				장소 : ${list[0].GG_ADDR}<br>
				날짜 : ${list[0].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
		
		<div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[1].GG_RFN}');">
				<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[1].GG_NO}">${list[1].GG_NAME}</a></h3>
				<span>
				<br><br><br>
				#${list[1].GG_CATEGORY}<br>
				비용 : ${list[1].GG_COST }<br>
				인원 : ${list[1].GG_TOTAL} / ${list[1].GG_ENABLE}
				장소 : ${list[1].GG_ADDR}<br>
				날짜 : ${list[1].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
		<div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[2].GG_RFN}');">
				<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[2].GG_NO}">${list[2].GG_NAME}</a></h3>
				<span>
				<br><br><br>
				#${list[2].GG_CATEGORY}<br>
				비용 : ${list[2].GG_COST }<br>
				인원 : ${list[2].GG_TOTAL} / ${list[2].GG_ENABLE}
				장소 : ${list[2].GG_ADDR}<br>
				날짜 : ${list[2].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
		<div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[3].GG_RFN}');">
				<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[3].GG_NO}">${list[3].GG_NAME}</a></h3>
				<span>
				<br><br><br>
				#${list[3].GG_CATEGORY}<br>
				비용 : ${list[3].GG_COST }<br>
				인원 : ${list[3].GG_TOTAL} / ${list[3].GG_ENABLE}
				장소 : ${list[3].GG_ADDR}<br>
				날짜 : ${list[3].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
		<div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[4].GG_RFN}');">
				<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[4].GG_NO}">${list[4].GG_NAME}</a></h3>
				<span>
				<br><br><br>
				#${list[4].GG_CATEGORY}<br>
				비용 : ${list[4].GG_COST }<br>
				인원 : ${list[4].GG_TOTAL} / ${list[4].GG_ENABLE}
				장소 : ${list[4].GG_ADDR}<br>
				날짜 : ${list[4].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
		<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
			<div class="project" style="background-image: url('/yogi/resources/upload/${list[5].GG_RFN}');">
			<div class="desc"><div class="con">
				<h3><a href="http://localhost:8080/yogi/groupDetail?gg_no=${list[5].GG_NO}">${list[5].GG_NAME }</a></h3>
				<span>
				<br><br><br>
				#${list[5].GG_CATEGORY}<br>
				비용 : ${list[5].GG_COST }<br>
				인원 : ${list[5].GG_TOTAL} / ${list[5].GG_ENABLE}
				장소 : ${list[5].GG_ADDR}<br>
				날짜 : ${list[5].GG_DATE}<br>
				</span>
					<p class="icon">
						<span><i class="icon-share3"></i></span>
						<span><i class="icon-eye"></i> 100</span>
						<span><i class="icon-heart"></i> 49</span>
					</p>
			</div></div></div>
		</div>
						
		</div>
		</c:when>
	
	<c:otherwise> 등록된 장소가 없습니다. </c:otherwise>
	</c:choose>
	</div>
	</div>
<div class="col-md-6">
	<div class="about-img animate-box" data-animate-effect="fadeInLeft" style="background-image: url(images/img_bg_2.jpg);"></div>
</div>
<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
	<div class="about-desc">
		<span class="heading-meta">Welcome</span>
			<h2 class="colorlib-heading">Chat with other people!</h2>
				<p>다른 사람들이랑 채팅... 해볼래...?</p>
				<div class="check">
					<input type="checkbox" id="status" onclick="openChat();"/> 
					<label for="check"></label>
				</div>
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
	</div>
</div>
</div>
</div>
	

	<!-- jQuery -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.countTo.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/main.js"></script>
	
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