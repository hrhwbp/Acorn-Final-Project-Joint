<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="importstop.jsp"%>
<title>RE:MIND || 회원가입</title>
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
												<label class="select"> <select name="m_gender" class="select col-xs-4">
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
												<label class="textarea"> 
													<textarea rows="3" name="m_introduce" placeholder="나의 대한 간단한 소개"></textarea>
												</label>
											</section>
										</div>
										<section>
											<div class="row">
												<div class="col-md-8">
													<label class="checkbox"> 
														<input type="checkbox" id="btnAgree" required="required"><i></i> 사용자 <a href="#">이용약관</a>에 대하여 모두 동의합니다.
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
								<p style="text-align: center;">
									이미 계정이 있으신가요? <a href="sign-in">그럼 이곳을 클릭하여 로그인하세요.</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@ include file="footer.jsp" %>	
<%@ include file="importsbottom.jsp"%>

</body>
</html>