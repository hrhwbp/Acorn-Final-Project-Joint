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
<!-- ============================================= 로그인용 스크립트========================================================== -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#m_email").bind('input', function() {
		setTimeout("email_check()", 1000)		
	});
});
	
	//로그인	
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
					window.location.href = "snslist"
				}
			}
		}); 	
	}
	
	//비밀번호 분실 모달
	function lost(){		
		$('#lost').modal('show');
	}
	
	//이메일 검증식
	function email_check() {
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var m_email = $("#m_email").val();
		
		$("#m_email").empty();
		if (m_email == null || m_email == "") {			
			$('#emailCheck').html("<p style='color:red; text-align:center;'>이메일 주소를 넣어주세요</p>");
			$('#btnLostPass').attr("disabled", "disabled");
		} else {
			if (!regEmail.test(m_email)) {
				$('#emailCheck').html("<p style='color:red; text-align:center;'>이메일 주소를 형식이 잘못되었습니다</p>");
				$('#btnLostPass').attr("disabled", "disabled");
			}else{
				$('#btnLostPass').removeAttr('disabled');
				$('#emailCheck').html("<p style='color:green; text-align:center;'>새로운 비밀번호를 요청하시겠어요?</p>");
				
			}
			
		}
	}
	
	//이메일을 통한 비밀번호 설정 formsubmit
	function lostPass(){
		$('#lost').modal('hide');
		alert("입력하신 이메일로 안내문을 보내어 드렸습니다.\n이메일을 확인해주세요");	
		$('#frmLost').attr({action:'sendPassChange', method:'post'}).submit();
	}
	
	
	
</script>
<!-- ============================================로그인용 스크립트 끝========================================================== -->
</head>
<body>
	<!-- MODALS -->
	<!-- =======================================비밀번호 찾기 모달 팝업============================== -->
<div class="modal fade " id="lost" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-md" style="margin: 10% auto; width: 40%; height: 40%;">
    <div class="modal-content">
    	<div class="form-body" style="background-color: rgba(242, 222, 222, 0.5) ; border-radius: 10px;">
			<form action="join" method="post" id="frmLost" class="sky-form" onSubmit="javascript:lostPass();return false">
		    	<div class="row">
					<div class="col-md-8 col-xs-12 col-md-offset-2">
						<div class="form-group">
							<div class="form-group">
								<label class="label" style="font-weight: bold; text-align: center;"><br><br>가입하셨던 이메일 주소를 입력해주세요</label>
								<label class="input"> <i
									class="icon-append fa fa-envelope-o"></i> <input
									type="email" id="m_email" name="m_email"
									placeholder="이메일" required="required"> <b
									class="tooltip tooltip-bottom-right">가입하셨던 이메일</b>
								</label>
							</div>
						</div>
					<section>
						<div id="emailCheck">&nbsp;</div>
						<button class="btn btn-base btn-icon btn-icon-right btn-sign-in pull-right"
							type="submit" id="btnLostPass"><!-- onclick="lostPass()" -->
							<span>비밀번호 재설정</span>
						</button>												
					</section>
					</div>
						<!-- <div class="col-xs-4">
						<div id="emailCheck" style="text-align: center;"></div>
						</div> -->
					</div>
				</form>	      
				<br><br>
			</div>
		</div>
	</div>
</div>
	<!-- ==============================비밀번호 찾기 모달 팝업 끝========================================-->


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
													<p style="text-align: right;">비밀번호를 잊으셨나요?<a onclick="javascript:lost()"> 비밀번호 찾기</a></p>
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