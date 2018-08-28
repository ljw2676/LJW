<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>마이페이지</title>
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
	
	<link rel="stylesheet" href="/resources/datepicker/datepicker.css">
	
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/linearicons.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/font-awesome.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/magnific-popup.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/nice-select.css">							
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/animate.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/jquery-ui.css">			
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/main.css">

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	</head>
	
	<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="index.html">Balay</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="work.html">Project</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li class="colorlib-active"><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<p><small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> Made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> Distributed by: <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </span> <span>Demo Images: <a href="http://nothingtochance.co/" target="_blank">nothingtochance.co</a></span></small></p>
				<ul>
					<li><a href="#"><i class="icon-facebook2"></i></a></li>
					<li><a href="#"><i class="icon-twitter2"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin2"></i></a></li>
				</ul>
			</div>

		</aside>

		<div id="colorlib-main">

			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">M Y P A G E</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">${session_m_id }님  환영합니다 ! </h2>
						</div>
					</div>
					
						<div class="col-lg-4 sidebar-widgets">
							<div class="widget-wrap">
							
								<div class="single-sidebar-widget user-info-widget">
									<img src="/yogi/resources/bootstrap_my/img/blog/user-info.png" alt="">
									<div class="single-sidebar-widget popular-post-widget">
									<h4 class="popular-title">${session_m_id }님</h4>
									</div>
									<a href="#"><h4>"${member.M_LV }"</h4></a>
									
										<c:if test="${member.M_GRADE lt 50 }">
										<img src="/yogi/resources/image/lv-b.png">
										</c:if>
		
										<c:if test="${member.M_GRADE ge 50 && member.M_GRADE lt 100}">
										<img src="/yogi/resources/image/lv-s.png">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 100 && member.M_GRADE lt 200}">
										<img src="/yogi/resources/image/lv-g.png">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 200 && member.M_GRADE lt 300}">
										<img src="/yogi/resources/image/lv-v.png">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 300 && member.M_GRADE le 400}">
										<img src="/yogi/resources/image/lv-w.png">
										</c:if>
								</div>
								
								<div class="single-sidebar-widget popular-post-widget">
								
									<div class="popular-post-list">
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp1.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>보유 포인트 : ${member.M_GRADE } </h6></a>
											
											</div>
										</div>
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp2.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>신고 횟수 :  ${member.M_PENALTY }</h6></a>
											
											</div>
										</div>
																						
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
	
			<!-- End footer Area -->	

	<!-- 		<script src="/yogi/resources/bootstrap_my/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="/yogi/resources/bootstrap_my/https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  			<script src="/yogi/resources/bootstrap_my/js/easing.min.js"></script>			
			<script src="/yogi/resources/bootstrap_my/js/hoverIntent.js"></script>
			<script src="/yogi/resources/bootstrap_my/js/superfish.min.js"></script>	
			<script src="/yogi/resources/bootstrap_my/js/jquery.ajaxchimp.min.js"></script>
			<script src="/yogi/resources/bootstrap_my/js/jquery.magnific-popup.min.js"></script>	
 			<script src="/yogi/resources/bootstrap_my/js/jquery-ui.js"></script>								
			<script src="/yogi/resources/bootstrap_my/js/jquery.nice-select.min.js"></script>							
			<script src="/yogi/resources/bootstrap_my/js/mail-script.js"></script>	
			<script src="/yogi/resources/bootstrap_my/js/main.js"></script>	 -->


</body>
</html>

