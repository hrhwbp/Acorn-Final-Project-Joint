<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
<%@ include file="importstop.jsp" %>
    <title>RE:MIND || 가입하기</title>
    <!-- <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    $(document).ready(function(){
		$("#m_password").bind('input',function(){setTimeout ("cmp_pass()",500)});   // input의 값이 변경되면 0.5초 딜레이 후에 cmp_pass실행
		$("#m_password_check").bind('input',function(){setTimeout ("cmp_pass()",500)}); 
		$('#btnJoin').attr("disabled", "disabled");         // 최초 가입버튼 비활성화
		$('#mb_regist').attr("onClick", "make_regist_json()");
    	$('#mb_regist').click(make_regist_json());
	});
    	 
	function cmp_pass() {
		$("#passwordCheck").empty();
		if($("#m_password").val() == $("#m_password_check").val()){       	// 비밀번호와 확인내용이 같은지 확인
			if($("#m_password").val().length >= 6){           				// 최소 비밀번호 길이 6
				$('#btnJoin').removeAttr("disabled");
			}else{
			$('#btnJoin').attr("disabled", "disabled");
			$("#passwordCheck").append("비밀번호가 너무 짧습니다");
			}
		}else{
		$('#btnJoin').attr("disabled", "disabled");
		$("#passwordCheck").append("입력된 비밀번호가 다릅니다");
		}
	}
    
    </script>
    
</head>

<body>
<%@ include file="top.jsp" %>
<!-- MODALS -->

    <!-- Optional header components (ex: slider) -->
            
    <!-- MAIN CONTENT -->
        <div class="pg-opt" style = "background-color: #f2dede;">
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

    <section class="slice bg-white">
        <div class="wp-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3">                   
                        <div class="wp-block default user-form no-margin">
                            <div class="form-header">
                                <h2>계정생성</h2>
                            </div>
                            <div class="form-body">
                                <form action="" id="frmRegister" class="sky-form">                                    
                                    <fieldset class="no-padding">           
                                        <section>
                                            <div class="row">                                               
                                                <div class="col-xs-12">
                                                    <div class="form-group">
                                                        <div class="form-group">
                                                            <label class="label">E-mail</label>
                                                            <label class="input">
                                                                <i class="icon-append fa fa-envelope-o"></i>
                                                                <input type="email" name="email" placeholder="" required="required">
                                                                <b class="tooltip tooltip-bottom-right">로그인시 사용하는 이메일</b>
                                                            </label>
                                                        </div>  
                                                    </div>               
                                                </div>
                                            </div>   
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="label">Password</label>
                                                        <label class="input">
                                                            <i class="icon-append fa fa-lock"></i>
                                                            <input type="password" name="m_password" id="m_password" placeholder="6글자 이상" required="required">
                                                            <b class="tooltip tooltip-bottom-right">비밀번호는 6글자 이상</b>
                                                        </label>
                                                    </div>               
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="label">Password Retype</label>
                                                        <label class="input">
                                                            <i class="icon-append fa fa-lock"></i>
                                                            <input type="password" id="m_password_check" placeholder="" required="required">
                                                            <b class="tooltip tooltip-bottom-right">비밀번호 재확인</b>
                                                        </label>
                                                    </div>               
                                                </div>
                                            </div>   
                                        </section>
                                        <div id="passwordCheck" style="color: red; text-align: center;"></div>
                                        <hr>
                                        <section>
                                            <div class="row">
                                                <section class="col-xs-12">
                                                    <label class="label">Name</label>
                                                    <label class="input">
                                                        <i class="icon-append fa fa-user"></i>
                                                        <input type="text" name="m_name" placeholder="" required="required">
                                                    </label>
                                                </section>                                         
                                            </div> 
                                                                                    
                                        <section>
                                            <label class="textarea">
                                                <textarea rows="3" name="m_introduce" placeholder="나의 대한 간단한 소개"></textarea>
                                            </label>
                                        </section>
                                </form>    
                                        <section>
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <label class="checkbox">
                                                        <input type="checkbox" name="btnAgree" id="btnAgree" required="required">
                                                        <i></i> 사용자 <a href="#">이용약관</a>에 대하여 모두 동의합니다.
                                                    </label>
                                                </div>
                                                <div class="col-md-4">
                                                    <button class="btn btn-alt btn-icon btn-icon-right btn-icon-go pull-right" id="btnJoin" type="button">
                                                        <span>가입하기</span>
                                                    </button>
                                                </div>
                                        </section>
                                    </fieldset>
                            </div>
                            <div class="form-footer">
                                <p>이미 계정이 있으신가요? <a href="sign-in">그럼 이곳을 클릭하여 로그인하세요.</a></p>
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
                            <li>Phone: +10 724 1234 567 | Fax: +10 724 1234 567 </li>
                            <li>Email: <a href="mailto:hello@example.com" title="Email Us">hello@example.com</a></li>
                            <li>Skype: <a href="skype:my.business?call" title="Skype us">my-business</a></li>
                            <li>Creating great templates is our passion</li>
                        </ul>
                     </div>
                </div>
                
                <div class="col-md-3">
                    <div class="col">
                        <h4>Mailing list</h4>
                        <p>Sign up if you would like to receive occasional treats from us.</p>
                        <form class="form-horizontal form-light">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Your email address...">
                                <span class="input-group-btn">
                                    <button class="btn btn-base" type="button">Go!</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="col col-social-icons">
                        <h4>Follow us</h4>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-skype"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                        <a href="#"><i class="fa fa-youtube-play"></i></a>
                        <a href="#"><i class="fa fa-flickr"></i></a>
                    </div>
                </div>

                 <div class="col-md-3">
                    <div class="col">
                        <h4>About us</h4>
                        <p class="no-margin">
                        Boomerang MultiPurpose Template is a multi-solution product made with simplicity in mind so you can benefit as much as possible from it.
                        <br><br>
                        <a href="#" class="btn btn-block btn-base btn-icon fa-check"><span>Try it now</span></a>
                        </p>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-lg-9 copyright">
                    2014 © Web Pixels. All rights reserved.
                    <a href="#">Terms and conditions</a>
                </div>
                <div class="col-lg-3">
                    <a href="http://www.webpixels.ro" title="Made with love by Web Pixels" target="_blank" class="">
                        <img src="resources/images/webpixels-footer-logo.png" alt="Web Pixels - Designing Forward | Logo" class="pull-right">
                    </a>
                </div>
            </div>
        </div>
    </footer>
</div>

<%@ include file="importsbottom.jsp" %>
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