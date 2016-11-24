<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="importstop.jsp"%>
<title>RE:MIND || 가입하기</title>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">

    Essential styles
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen"> 
     
    Boomerang styles
        <link id="wpStylesheet" type="text/css" href="css/global-style-red.css" rel="stylesheet" media="screen">
        

    Favicon
    <link href="resources/images/favicon.png" rel="icon" type="image/png">

    Assets
    <link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="assets/sky-forms/css/sky-forms.css">    
    [if lt IE 9]>
        <link rel="stylesheet" href="assets/sky-forms/css/sky-forms-ie8.css">
    <![endif]

    Required JS
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    

    <!-- Page scripts -->
<script type="text/javascript">
	$(document).ready(function() {
		//$('#btnJoin').attr("disabled", "disabled");
		$("#m_email").bind('input', function() {
			setTimeout("email_check()", 1000)
		});
		$("#m_password").bind('input', function() {
			setTimeout("password_check()", 500)
		}); // input의 값이 변경되면 0.5초 딜레이 후에 cmp_pass실행
		$("#m_password_check").bind('input', function() {
			setTimeout("password_check()", 500)
		});
		//$("#btnAgree").bind('input',function agree_check(){});

		//$('#btnJoin').attr("disabled", "disabled");         // 최초 가입버튼 비활성화
		//$('#btnJoin').attr("onClick", "make_regist_json()");
		//$('#btnJoin').click(make_regist_json());
	});

	function password_check() {
		$("#passwordCheck").empty();
		if ($("#m_password").val() == $("#m_password_check").val()) { // 비밀번호와 확인내용이 같은지 확인
			if ($("#m_password").val().length >= 6) { // 최소 비밀번호 길이 6
				$('#btnJoin').removeAttr("disabled");
				$("#passwordCheck").html(
						"<p style='color:green;'>적합한 비밀번호 입니다</p>");
			} else {
				//$("#passwordCheck").append("비밀번호가 너무 짧습니다");
				$("#passwordCheck").html(
						"<p style='color:green;'>비밀번호가 너무 짧습니다</p>");
				$('#btnJoin').attr("disabled", "disabled");
			}
		} else {
			$("#passwordCheck")
					.html("<p style='color:red;'>입력된 비밀번호가 다릅니다</p>");
			$('#btnJoin').attr("disabled", "disabled");
		}
	}

	function email_check() {
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var m_email = $("#m_email").val();

		$("#m_email").empty();
		if (m_email == null || m_email == "") {			
			$('#emailCheck').html("<p style='color:red;'>이메일 주소를 넣어주세요</p>");
			$('#btnJoin').attr("disabled", "disabled");
		} else {
			if (!regEmail.test(m_email)) {
				$('#emailCheck').html("<p style='color:red;'>이메일 주소를 확인하여 주세요</p>");
				$('#btnJoin').attr("disabled", "disabled");
			} else {
				$('#btnJoin').attr("enable", "enable");
				jQuery
					.ajax({
						type : "post",
						url : "email_join_check",
						data : {"email_join_check" : m_email},
						dataType : 'html',
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(emailCheckData) {
							//$("#emailCheck").append(emailCheckData);
							$('#emailCheck').html(emailCheckData);
						},
						error : function(xhr, status) {
							//alert(xhr.status);
						}
					});
			}
		}
	}
	
	function submit(){
		alert("yeah!");
		/* $("#btnJoin").click(function(){
		$("#frmRegister").attr({action:'join', method:'post'}).submit();
	}); */
	}
	
</script>
<style type="text/css">
.form-header{
background-color: rgba(255, 255, 255, 0.2);
}
</style>

</head>

<body>
	<%@ include file="top.jsp"%>
	<!-- MODALS -->

	<!-- Optional header components (ex: slider) -->

	<!-- MAIN CONTENT -->
	<div class="pg-opt" style="background-color: #f2dede;">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2>Sign up</h2>
				</div>
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">Sign up</li>
					</ol>
				</div>
			</div>
		</div>
	</div>

	<section style="background-image: url('resources/images/giftshredpaper1.jpg'); background-size: 100%;">
		<div class="wp-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3">
						<div class="wp-block default user-form no-margin">
							<div class="form-header">
								<h2>계정생성</h2>
							</div>
							<div class="form-body">
								<form action="join" method="post" id="frmRegister" class="sky-form" onSubmit="submit();return false">
									<fieldset class="no-padding">
										<section>
											<div class="row">
												<div class="col-xs-8">
													<div class="form-group">
														<div class="form-group">
															<!--  <label class="label">이메일</label> -->
															<label class="input"> <i
																class="icon-append fa fa-envelope-o"></i> <input
																type="m_email" id="m_email" name="m_email"
																placeholder="이메일" required="required"> <b
																class="tooltip tooltip-bottom-right">로그인시 사용하는 이메일</b>
															</label>
														</div>
													</div>
												</div>
												<div class="col-xs-4">
													<div id="emailCheck" style="text-align: center;"></div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-8">
													<div class="form-group">
														<label class="label">비밀번호</label> <label class="input">
															<i class="icon-append fa fa-lock"></i> <input
															type="password" name="m_password" id="m_password"
															placeholder="6글자 이상" required="required"> <b
															class="tooltip tooltip-bottom-right">비밀번호는 6글자 이상</b>
														</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-8">
													<div class="form-group">
														<label class="label">비밀번호 확인</label> <label class="input">
															<i class="icon-append fa fa-lock"></i> <input
															type="password" id="m_password_check"
															placeholder="비밀번호 재입력" required="required"> <b
															class="tooltip tooltip-bottom-right">비밀번호 재확인</b>
														</label>
													</div>
												</div>
												<div class="col-xs-4">
													<div id="passwordCheck" style="text-align: center;"></div>
												</div>
											</div>
										</section>

										<hr>
										<div class="row">
											<section>
												<section class="col-xs-12">
													<label class="label">이름</label> <label class="input">
														<i class="icon-append fa fa-user"></i> <input type="text"
														name="m_name" placeholder="" required="required">
													</label>
												</section>
										</div>
										<div class="row">
											<section class="select col-xs-3">
												<label class="select"> 
												<select name="year"	class="select col-xs-4">
														<option value="0" selected="" disabled="">출생년도</option>
														<c:forEach var="i" begin="1900" end="2100" step="1">
															<option value="${i }">${i }년</option>
														</c:forEach>
												</select> <i></i>
												</label>
											</section>
											<section class="select col-xs-3">
												<label class="select"> <select name="month" class="select col-xs-4">
														<option value="0" selected="" disabled="">월</option>
														<c:forEach var="i" begin="1" end="12" step="1">
															<option value="${i }">${i }월</option>
														</c:forEach>
												</select> <i></i>
												</label>
											</section>
											<section class="select col-xs-3">
												<label class="select"> <select name="day" class="select col-xs-4">
														<option value="0" selected="" disabled="">일</option>
														<c:forEach var="i" begin="1" end="31" step="1">
															<option value="${i }">${i }일</option>
														</c:forEach>
												</select> <i></i>
												</label>
											</section>
											<section class="select col-xs-3">
												<label class="select"> <select name="gender" class="select col-xs-4">
														<option value="">성별</option>
														<option value="1">남자</option>
														<option value="2">여자</option>
														<option value="3">기타</option>
												</select> <i></i>
												</label>
											</section>
										</div>
										
										<div class="row">
											<section class="col-xs-12">
												<label class="textarea"> <textarea rows="3"
														name="m_introduce" placeholder="나의 대한 간단한 소개"></textarea>
												</label>
											</section>
										</div>
										<section>
											<div class="row">
												<div class="col-md-8">
													<label class="checkbox"> <input type="checkbox"
														id="btnAgree" required="required"> <i></i> 사용자 <a href="#">이용약관</a>에 대하여 모두 동의합니다.
													</label>
												</div>
												<div class="col-md-4">
													<button
														class="btn btn-alt btn-icon btn-icon-right btn-icon-go pull-right"
														id="btnJoin" type="submit">
														<span>가입하기</span>
													</button>
												</div>
											</div>
										</section>
									</fieldset>
								</form>
							</div>
							<div class="form-footer">
								<p>
									이미 계정이 있으신가요? <a href="sign-in">그럼 이곳을 클릭하여 로그인하세요.</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<footer class="footer">
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
							<li>Skype: <a href="skype:my.business?call" title="Skype us">my-business</a></li>
							<li>Creating great templates is our passion</li>
						</ul>
					</div>
				</div>

				<div class="col-md-3">
					<div class="col">
						<h4>Mailing list</h4>
						<p>Sign up if you would like to receive occasional treats from
							us.</p>
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
							class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-skype"></i></a>
						<a href="#"><i class="fa fa-pinterest"></i></a> <a href="#"><i
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
							from it. <br> <br> <a href="#"
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
						<img src="resources/images/webpixels-footer-logo.png"
						alt="Web Pixels - Designing Forward | Logo" class="pull-right">
					</a>
				</div>
			</div>
		</div>
	</footer>
	</div>

	<%@ include file="importsbottom.jsp"%>
	<!-- ============================================================================= -->
	<!-- Essentials -->
	<!-- <script src="js/modernizr.custom.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="js/jquery.easing.js"></script>
<script src="js/jquery.metadata.js"></script>
<script src="js/jquery.hoverup.js"></script>
<script src="js/jquery.hoverdir.js"></script>
<script src="js/jquery.stellar.js"></script> -->

	<!-- Boomerang mobile nav - Optional  -->
	<!-- <script src="assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
<script src="assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script> -->

	<!-- Forms -->
	<!-- <script src="assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script> 
<script src="assets/ui-kit/js/cusel.min.js"></script>
<script src="assets/sky-forms/js/jquery.form.min.js"></script>
<script src="assets/sky-forms/js/jquery.validate.min.js"></script>
<script src="assets/sky-forms/js/jquery.maskedinput.min.js"></script>
<script src="assets/sky-forms/js/jquery.modal.js"></script> -->

	<!-- Assets -->
	<!-- <script src="assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script src="assets/page-scroller/jquery.ui.totop.min.js"></script>
<script src="assets/mixitup/jquery.mixitup.js"></script>
<script src="assets/mixitup/jquery.mixitup.init.js"></script>
<script src="assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script src="assets/waypoints/waypoints.min.js"></script>
<script src="assets/milestone-counter/jquery.countTo.js"></script>
<script src="assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
<script src="assets/social-buttons/js/rrssb.min.js"></script>
<script src="assets/nouislider/js/jquery.nouislider.min.js"></script>
<script src="assets/owl-carousel/owl.carousel.js"></script>
<script src="assets/bootstrap/js/tooltip.js"></script>
<script src="assets/bootstrap/js/popover.js"></script> -->

	<!-- Sripts for individual pages, depending on what plug-ins are used -->

	<!-- Boomerang App JS -->
	<!-- <script src="js/wp.app.js"></script> -->
	<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->

	<!-- Temp -- You can remove this once you started to work on your project -->
	<!-- <script src="js/jquery.cookie.js"></script>
<script src="js/wp.switcher.js"></script>
<script type="text/javascript" src="js/wp.ga.js"></script>
===================================================================================== -->

</body>
</html>