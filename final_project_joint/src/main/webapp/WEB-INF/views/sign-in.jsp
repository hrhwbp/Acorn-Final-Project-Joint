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

<%@ include file="importstop.jsp" %>


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
														type="password" id="m_password" name="m_password" required=required onkeydown="if (event.keyCode==13){ logsubmit();event.returnValue=false}">
													</label>
													<p style="text-align: right;">비밀번호를 잊으셨나요?<a href="#"> 비밀번호 찾기</a></p>
												</div>
											</section>
											
											<section>
												<div class="row">
													<div class="col-md-12">																										</div> 
													<div id="loginresult" style="color: red; font-weight: bold; text-align: center;"><br></div>
												</div>
											</section>

											<section>
												<button class="btn btn-base btn-icon btn-icon-right btn-sign-in pull-right"
													type="button" id="submitbutton" onclick="logsubmit()">
													<span>로그인 하기</span>
												</button>												
											</section>
										</fieldset>
									</form>
								</div>
								<div class="form-footer">
									
									<p style="text-align: center;"><a href="join">아직 계정이 없으십니까? 회원가입 하러가기!</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

<%@ include file="footer.jsp" %>
	</div>
<%@ include file="importsbottom.jsp" %>
</body>
</html>