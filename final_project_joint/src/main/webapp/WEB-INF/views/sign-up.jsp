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
	
	
	function terms(){
		
	$('#terms').modal('show');
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
	
	<!-- 약관 모달 팝업 -->
	<div class="modal fade " id="terms" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 10% auto; width: 70%">
	    <div class="modal-content">
	      <div class="row text-left" style="color:black; font-weight: bold;">
	      	<p>제 1 조 (목적)</p>
<br>이 약관은 리마인드 주식회사 ("회사")가 제공하는 네이버 및 네이버 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
<br><br>제 2 조 (정의)
<br>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
<br>①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.
<br>②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
<br>③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
<br>④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
<br>⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
<br>⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
<br>⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
<br><br>제 3 조 (약관의 게시와 개정)
<br>①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
<br>②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
<br>③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
<br>④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
<br>⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.
<br><br>제 4 조 (약관의 해석)
<br>①"회사"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
<br>②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
<br><br>제 5 조 (이용계약 체결)
<br>①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
<br>②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
<br>1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
<br>2.실명이 아니거나 타인의 명의를 이용한 경우
<br>3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
<br>4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
<br>5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
<br>③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
<br>④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
<br>⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥<br>이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
<br>⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
<br>⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
<br><br>제 6 조 (회원정보의 변경)
<br>①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
<br>②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
<br>③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
<br><br>제 7 조 (개인정보보호 의무)
<br>"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.
<br>제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
<br>①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
<br>②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
<br>③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
<br>④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.

	      </div>
	    </div>
	  </div>
	</div>
	<!-- 약관 모달 팝업 끝-->

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
					<div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3" style="background-color: rgba(255, 255, 255, 0.46);">
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
														<input type="checkbox" id="btnAgree" required="required"><i></i> 사용자 <a onclick="javascript:terms()">이용약관</a>에 대하여 모두 동의합니다.
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