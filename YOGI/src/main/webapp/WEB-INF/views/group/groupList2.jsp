<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery-1.7.1.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.css'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$('#searchbox').keypress(function(event) {
		if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
			searchSubmit();
		}
	});
	$('.btnEventSearch').click(function(event) {
		searchSubmit();
		});
	$('.Reset').click(function(event) {
		document.search_form.reset();
		}); 
	
	$('.date').appendDtpicker({
	"futureOnly" : true,
	"autodateOnStart" : false,
	"locale" : "ko",
	"dateFormat": "YY/MM/DD",
	"dateOnly": true,
	"closeOnSelected": true,
	"calendarMouseScroll": false
	});
});		
		    function searchSubmit(){
			var categorySize = "";
			$("input[name=Category]:checked").each(function() {
			if(categorySize == ""){
			categorySize = $(this).val();
			} else {
			categorySize = categorySize + "|" + $(this).val();
			}
			});
			var addrSize = "";
			$("input[name=Addr]:checked").each(function() {
			if(addrSize == ""){
			addrSize = $(this).val();
			} else {
			addrSize = addrSize + "|" + $(this).val();
			}
			});
			var paySize = "";
			$("input[name=Pay]:checked").each(function() {
			if(paySize == ""){
			paySize = $(this).val();
			} else {
			paySize = paySize + "|" + $(this).val();
			}
			});
			var dateSizs = "";
			if(categorySize.length > 0){
				$('#searchCategory').val(categorySize);
			}
			if(addrSize.length > 0){
				$('#searchAddr').val(addrSize);
			}
			if(paySize.length > 0){
				$('#searchPay').val(paySize);
			}
			if ($('#startdt').val() != null) {
				$('#searchMStart').val($('#startdt').val());
			}
	}

function fn_groupDetailLink(gg_no){
	var cs = new ComSubmit();
	cs.setUrl("<c:url value='/groupDetail' />");
	cs.addParam("gg_no", gg_no);
	cs.addParam("currentPageNo", "${currentPageNo}");
	cs.submit();
}
		    
</script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Group List</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/flexslider.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/fonts/flaticon/font/flaticon.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/style.css">

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<style>
.search{
  margin-left: -15px;
  margin-right: -15px;
}
.main_common{
    display: inline-block;
}
.pagingHtml{
	margin-top: 1090px;
	margin-left: 370px;
}
</style>
	</head>
	<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="index.html">Balay</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="alram.jsp">Alram</a></li>
					<li><a href="work.html">Project</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li class="colorlib-active"><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<p><small></small></p>			
			</div>
		</aside>
		<div id="colorlib-main">	
			<div class="colorlib-blog">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">Group</span>
							<h2 class="colorlib-heading">Group List</h2>
						</div>
					</div>
					<div class="search">
<div class="submit main_common">
			<form name="search_form" action="<c:url value="/groupList"/>" role="search" method="post" onsubmit="searchSubmit()">
			<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
			<input id="searchCategory" type="hidden" name="searchCategory" value="${searchCategory} ">
			<input id="searchAddr" type="hidden" name="searchAddr" value="${searchAddr }">
			<input id="searchPay" type="hidden" name="searchPay" value="${searchPay }">
			<input id="searchMStart" type="hidden" name="searchMStart" value="${searchMStart }">
			<input class="Searchbox" autocomplete="off" id="searchbox" type="text" name="searchWord" value=${searchWord }>
			
			<input type="submit" value="검색">
			</form>
</div>
<div class="category main_common">
	<input type="checkbox" name="Category" value="실외활동">실외활동
	<input type="checkbox"  name="Category" value="패션">패션
	<input type="checkbox"  name="Category" value="맛집">맛집<br>
	
	<input type="checkbox"  name="Category" value="게임">게임
	<input type="checkbox" name="Category" value="동물">동물
	<input type="checkbox" name="Category" value="보드게임">보드게임<br>
	
	<input type="checkbox" name="Category" value="전시/공연">전시/공연
	<input type="checkbox" name="Category" value="공예">공예
	<input type="checkbox" name="Category" value="춤">춤<br>
	
	<input type="checkbox" name="Category" value="독서/토론">독서/토론
	<input type="checkbox" name="Category" value="음악">음악
	<input type="checkbox" name="Category" value="언어교환">언어교환<br>
	
	<input type="checkbox" name="Category" value="여행">여행
	<input type="checkbox" name="Category" value="웰빙">웰빙
	<input type="checkbox" name="Category" value="취업/스터디">취업/스터디
</div>

<div class="region main_common">
	<input type="checkbox" name="Addr" value="종로구">종로구
	<input type="checkbox" name="Addr" value="중구">중구
	<input type="checkbox" name="Addr" value="용산구">용산구
	<input type="checkbox" name="Addr" name="Addr" value="성동구">성동구<br>
	
	<input type="checkbox" name="Addr" value="광진구">광진구
	<input type="checkbox" name="Addr" value="강동구">강동구
	<input type="checkbox" name="Addr" value="중랑구">중랑구
	<input type="checkbox" name="Addr" value="성북구">성북구<br>

	<input type="checkbox" name="Addr" value="강북구">강북구
	<input type="checkbox" name="Addr" value="도봉구">도봉구
	<input type="checkbox" name="Addr" value="노원구">노원구
	<input type="checkbox" name="Addr" value="은평구">은평구 <br>
	
	<input type="checkbox" name="Addr" value="서대문구">서대문구
	<input type="checkbox" name="Addr" value="마포구">마포구
	<input type="checkbox" name="Addr" value="양천구">양천구
	<input type="checkbox" name="Addr" value="강서구">강서구<br>
	
	<input type="checkbox" name="Addr" value="구로구">구로구
	<input type="checkbox" name="Addr" value="금천구">금천구
	<input type="checkbox" name="Addr" value="영등포구">영등포구
	<input type="checkbox" name="Addr" value="동작구">동작구<br>
	
	<input type="checkbox" name="Addr" value="관악구">관악구
	<input type="checkbox" name="Addr" value="서초구">서초구
	<input type="checkbox" name="Addr" value="강남구">강남구
	<input type="checkbox" name="Addr" value="송파구">송파구<br>
	
	<input type="checkbox" name="Addr" value="동대문구">동대문구
</div>
	
	<div class="Pay main_common">
	<input type="checkbox" name="Pay" value="유료">유료<br>
	<input type="checkbox" name="Pay" value="무료">무료<br>
</div>
		
<div class="calendar main_common">
	<input autocomplete="off" type="text" class="date" id="startdt" size="5">달력<br>	
</div>
</div>					
					<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row">	
						<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
							<div class="blog-entry">
								<a href="#this" onclick="fn_groupDetailLink('${row.GG_NO}')"class="blog-img"><img src="/yogi/resources/upload/${row.GG_RFN }" style="width: 340px; height: 300px;"/></a>
								<div class="desc">
									<span><small><fmt:formatDate value="${row.GG_DATE}" pattern="yy/MM/dd"/> </small> | <small> ${row.GG_CATEGORY} </small> | <small> <c:if test ="${row.GG_COST == 0 }">NO CHARGE</c:if> <c:if test = "${row.GG_COST > 0 }">￦${row.GG_COST}</c:if><br /></small></span>
									<h3><a href="#this" onclick="fn_groupDetailLink('${row.GG_NO}')">${row.GG_NAME }</a></h3>
									<p>${row.GG_ADDR } <br> ${row.GG_PLACE }</p>
								</div>
							</div>
						</div>
						</c:forEach>
				</c:when>
			<c:otherwise>
			<h4>등록된 게시물이 없습니다.</h4>
		</c:otherwise>
	</c:choose>
	
			
		</div>
		<div class="pagingHtml">
			${pagingHtml}
		</div>
	</div>
	
</div>

</div>


	<!-- jQuery -->
	<script src="/yogi/resources/bootstrap/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/yogi/resources/bootstrap/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/yogi/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/yogi/resources/bootstrap/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="/yogi/resources/bootstrap/js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="/yogi/resources/bootstrap/js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="/yogi/resources/bootstrap/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="/yogi/resources/bootstrap/js/jquery.countTo.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="/yogi/resources/bootstrap/js/main.js"></script>

	</body>
</html>

