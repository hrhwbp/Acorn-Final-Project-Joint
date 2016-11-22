<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="robots" content="index, follow">
<title>RE:MIND || 로그인</title>

<!-- Essential styles -->
<link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="resources/assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen">

<!-- Boomerang styles -->
<link id="wpStylesheet" type="text/css" href="resources/css/global-style-red.css"
	rel="stylesheet" media="screen">


<!-- Favicon -->
<link href="resources/images/favicon.png" rel="icon" type="image/png">

<!-- Assets -->
<link rel="stylesheet" href="resources/assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/owl-carousel/owl.theme.css">
<link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms.css">
<!--[if lt IE 9]>
        <link rel="stylesheet" href="assets/sky-forms/css/sky-forms-ie8.css">
    <![endif]-->

<!-- Required JS -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>

<!-- 글라이콘 IMPORT -->

<style type="text/css">
@import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
</style>
<!-- =============================================원글에서 가져온 로그인용 스크립트========================================================== -->
<script type="text/javascript">
	/*    $(document).ready(function() {
	 $("#showjoin").hide()
	 })

	 function login() {
	 $("#showjoin").hide()
	 $("#showlogin").show()
	 }

	 function join() {
	 $("#showlogin").hide()
	 $("#showjoin").show()
	 } */

		function logsubmit() {
				/* alert("login try") */
				$.ajax({			
				type : "post",
				url : "loginsub",
				data : $("#loginform").serialize(),
				dataType : "text",			
				success : function(result) {
					if (result == "fail") {

						jQuery("#loginresult").html("이메일과 비밀번호를 확인해 주세요");

					} else if (result == "success") {
						/* alert("yeah!!") */
						window.location.href = "	snslist"
					}
				}
			}); 	
		}
	 
</script>
<!-- =============================================원글에서 가져온 로그인용 스크립트 끝========================================================== -->
</head>
<body>
	<!-- MODALS -->



	<!-- MAIN WRAPPER -->
	<div class="body-wrap">
		<!-- HEADER -->
		<%@ include file="top.jsp"%>

		<!-- Optional header components (ex: slider) -->

		<!-- MAIN CONTENT -->
		<div class="pg-opt" style="background-color: #f2dede;">
			<div class="container bg-danger">
				<div class="row">
					<div class="col-md-6">
						<h2>Sign in</h2>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>							
							<li class="active">Sign in</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<!-- <section class="slice slice-lg bg-image" style="background-image:url(images/backgrounds/full-bg-1.jpg);"> -->
		<section class="slice slice-lg bg-image"
			style="background-image: url(resources/images/giftbox.jpg);">
			<div class="wp-section">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
							<div class="wp-block default user-form user-form-alpha no-margin">
								<div class="form-header">
									<h1><i class="fa fa-lock" aria-hidden="true"></i>로그인</h1>
								</div>
								<div class="form-body">
									<form id="loginform" class="sky-form">
										<fieldset>
											<section>
												<div class="form-group">
													<label class="label">Email</label> <label class="input">
														<i class="icon-append fa fa-user"></i> <input type="email"
														name="m_email" required autofocus required=required>
													</label>
												</div>
											</section>
											<section>
												<div class="form-group">
													<label class="label">Password</label> <label class="input">
														<i class="icon-append fa fa-lock"></i> <input
														type="password" name="m_password" required=required>
													</label>
												</div>
											</section>
											
											<section>
												<div class="row">
													<div class="col-md-12">
														<!-- <label class="checkbox" ><input type="checkbox"
															name="remember" checked><i></i>로그인 유지</label>-->
													</div> 
													<div id="loginresult" style="color: red; font-weight: bold; text-align: center;"><br></div>
												</div>
											</section>

											<section>
												<button class="btn btn-base btn-icon btn-icon-right btn-sign-in pull-right"
													type="button" onclick="logsubmit()">
													<span>로그인 하기</span>
												</button>
											</section>
										</fieldset>
									</form>
								</div>
								<div class="form-footer">
									<p>
										비밀번호를 잊으셨나요?<a href="#"> 이곳을 눌러 찾으세요.</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- FOOTER -->
		<!-- <footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="col">
							<h4>Contact us</h4>
							<ul>
								<li>5th Avenue, New York - United States</li>
								<li>Phone: +10 724 1234 567 | Fax: +10 724 1234 567</li>
								<li>Email: <a href="mailto:hello@example.com"
									title="Email Us">hello@example.com</a></li>
								<li>Skype: <a href="skype:my.business?call"
									title="Skype us">my-business</a></li>
								<li>Creating great templates is our passion</li>
							</ul>
						</div>
					</div>

					<div class="col-md-3">
						<div class="col">
							<h4>Mailing list</h4>
							<p>Sign up if you would like to receive occasional treats
								from us.</p>
							<form class="form-horizontal form-light">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Your email address..."> <span
										class="input-group-btn">
										<button class="btn btn-base" type="button">Go!</button>
									</span>
								</div>
							</form>
						</div>
					</div>

					<div class="col-md-3">
						<div class="col col-social-icons">
							<h4>Follow us</h4>
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-google-plus"></i></a> <a href="#"><i
								class="fa fa-linkedin"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-skype"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-flickr"></i></a>
						</div>
					</div>

					<div class="col-md-3">
						<div class="col">
							<h4>About us</h4>
							<p class="no-margin">
								Boomerang MultiPurpose Template is a multi-solution product made
								with simplicity in mind so you can benefit as much as possible
								from it. <br>
								<br> <a href="#"
									class="btn btn-block btn-base btn-icon fa-check"><span>Try
										it now</span></a>
							</p>
						</div>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-lg-9 copyright">
						2014 © Web Pixels. All rights reserved. <a href="#">Terms and
							conditions</a>
					</div>
					<div class="col-lg-3">
						<a href="http://www.webpixels.ro"
							title="Made with love by Web Pixels" target="_blank" class="">
							<img src="images/webpixels-footer-logo.png"
							alt="Web Pixels - Designing Forward | Logo" class="pull-right">
						</a>
					</div>
				</div>
			</div>
		</footer> -->
	<%@ include file="bottom.jsp" %>
	</div>

	<!-- Essentials -->
	<script src="resources/js/modernizr.custom.js"></script>
	<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.mousewheel-3.0.6.pack.js"></script>
	<script src="resources/js/jquery.easing.js"></script>
	<script src="resources/js/jquery.metadata.js"></script>
	<script src="resources/js/jquery.hoverup.js"></script>
	<script src="resources/js/jquery.hoverdir.js"></script>
	<script src="resources/js/jquery.stellar.js"></script>

	<!-- Boomerang mobile nav - Optional  -->
	<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
	<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script>

	<!-- Forms -->
	<script src="resources/assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script>
	<script src="resources/assets/ui-kit/js/cusel.min.js"></script>
	<script src="resources/assets/sky-forms/js/jquery.form.min.js"></script>
	<script src="resources/assets/sky-forms/js/jquery.validate.min.js"></script>
	<script src="resources/assets/sky-forms/js/jquery.maskedinput.min.js"></script>
	<script src="resources/assets/sky-forms/js/jquery.modal.js"></script>

	<!-- Assets -->
	<script src="resources/assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
	<script src="resources/assets/page-scroller/jquery.ui.totop.min.js"></script>
	<script src="resources/assets/mixitup/jquery.mixitup.js"></script>
	<script src="resources/assets/mixitup/jquery.mixitup.init.js"></script>
	<script src="resources/assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
	<script src="resources/assets/waypoints/waypoints.min.js"></script>
	<script src="resources/assets/milestone-counter/jquery.countTo.js"></script>
	<script src="resources/assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
	<script src="resources/assets/social-buttons/js/rrssb.min.js"></script>
	<script src="resources/assets/nouislider/js/jquery.nouislider.min.js"></script>
	<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
	<script src="resources/assets/bootstrap/js/tooltip.js"></script>
	<script src="resources/assets/bootstrap/js/popover.js"></script>

	<!-- Sripts for individual pages, depending on what plug-ins are used -->

	<!-- Boomerang App JS -->
	<script src="resources/js/wp.app.js"></script>
	<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->

	<!-- Temp -- You can remove this once you started to work on your project -->
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/wp.switcher.js"></script>
	<script type="text/javascript" src="resources/js/wp.ga.js"></script>


</body>
</html>