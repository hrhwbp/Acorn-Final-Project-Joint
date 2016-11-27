<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <title>RE:MIND || Happy Gifting Starts Here</title>

<%@ include file="importstop.jsp" %>
 
<!-- Page scripts -->
<link rel="stylesheet" href="resources/assets/layerslider/css/layerslider.css" type="text/css">

<script type="text/javascript">
	function mywall() {
		
		if(<%=session.getAttribute("mno")%>	 == null){
			location.href="login"
		}else{
		$("#info").submit();
		}
	}
	
	function myAccount(){
		if(<%=session.getAttribute("mno")%>	 == null){
			location.href="login"
		}else{
		$("#account").submit();
		}
	}
</script>


</head>
<body>
<!-- MODALS -->

<!-- MOBILE MENU - Option 2 -->
<section id="navMobile" class="aside-menu left">
    <form class="form-horizontal form-search">
        <div class="input-group">
            <input type="search" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
                <button id="btnHideMobileNav" class="btn btn-close" type="button" title="Hide sidebar"><i class="fa fa-times"></i></button>
            </span>
        </div>
    </form>
    <div id="dl-menu" class="dl-menuwrapper">
        <ul class="dl-menu"></ul>
    </div>
</section> 

<!-- SLIDEBAR -->
<section id="asideMenu" class="aside-menu right">
    <form class="form-horizontal form-search">
        <div class="input-group">
            <input type="search" class="form-control" placeholder="Search..." />
            <span class="input-group-btn">
                <button id="btnHideAsideMenu" class="btn btn-close" type="button" title="Hide sidebar"><i class="fa fa-times"></i></button>
            </span>
        </div>
    </form>
    
    <h5 class="side-section-title">Optional sidebar menu</h5>
    <div class="nav">
        <ul>
            <li>
                <a href="action">Home</a>
            </li>
            <li>
                <a href="#">About us</a>
            </li>
            <li>
                <a href="#">Blog</a>
            </li>
            <li>
                <a href="#">Work</a>
            </li>
            <li>
                <a href="#">Online shop</a>
            </li>
        </ul>
    </div>
    
    <h5 class="side-section-title">Social media</h5>
    <div class="social-media">
        <a target="blank" href="https://www.facebook.com/remindwishlist/"><i class="fa fa-facebook facebook"></i></a>
        <a href="#"><i class="fa fa-google-plus google"></i></a>
        <a href="#"><i class="fa fa-twitter twitter"></i></a>
    </div>
    
    <h5 class="side-section-title">Contact information</h5>
    <div class="contact-info">
        <h5>Address</h5>
        <p>5th Avenue, New York - United States</p>
        
        <h5>Email</h5>
        <p>hello@webpixels.ro</p>
        
        <h5>Phone</h5>
        <p>+10 724 1234 567</p>
    </div>
</section>

<!-- MAIN WRAPPER -->
<div class="body-wrap">
    <!-- This section is only for demonstration purpose only. Check out the docs for more informations" -->
         
         <!-- HEADER -->
        <div id="divHeaderWrapper">
            <!-- HEADER: Cover example - includes a full page header with with background and semi-opaque navigation with sticky navbar activated -->
<header class="header-alpha header-cover"> 
       
    <div class="navbar navbar-wp navbar-fixed mega-nav" data-spy="affix" data-offset-top="120" role="navigation">
        <div class="container">
            <div class="navbar-inner">
                <div class="navbar-header text-sm-center">
                    <!-- Navbar brand -->
                    <a class="navbar-brand pull-left" href="action" title="Boomerang 2 | One template. Infinite solutions">
                        <img id="desktopLogo" src="../../controller/resources/images/boomerang-logo-white.png" alt="Happy Gifiting Starts Here!">
                        <img id="mobileLogo" src="../../controller/resources/images/boomerang-logo-black.png" alt="Happy Gifiting Starts Here!">
                    </a>
                    
                    <!-- Slide bar button -->
                    <button type="button" class="navbar-toggle navbar-toggle-aside-menu pull-right">
                        <i class="fa fa-outdent icon-custom"></i>
                    </button>
                    <!-- Mobile menu button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <i class="fa fa-bars icon-custom"></i>
                    </button>

                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-md hidden-lg">
                        <div class="bg-light-gray">
                            <form class="form-horizontal form-light p-15" role="form">
                                <div class="input-group input-group-lg">
                                    <input type="text" class="form-control" placeholder="I want to find ...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-white" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </li>
                     <li class="dropdown dropdown-meganav mega-dropdown-fluid">
                        <a href="action" class="dropdown-toggle">Home</a>                        
                    </li>
                    <li class="dropdown">
                        <a href="snslist" class="dropdown-toggle" >TIMELINE</a>                        
                    </li>
                    <li class="dropdown">
                        <a href="javascript:mywall()" class="dropdown-toggle">MY WALL</a>
                        <form action="mywall" method="post" id="info">
							<input type="hidden" name="m_no" value="<%=session.getAttribute("mno")%>">
						</form>                       
                    </li>
                     <li class="dropdown">
                        <a href="javascript:myAccount()" class="dropdown-toggle" >MY PAGE</a>
                        <form action="myaccount" method="post" id="account">
							<input type="hidden" name="m_no" value="<%=session.getAttribute("mno")%>">
						</form>                              
                    </li> 
                    <li class="dropdown">
                        <a href="wishlist" class="dropdown-toggle" >WISHLIST</a>                        
                    </li>                   
                    <%if (session.getAttribute("mno") != null) {%>
                    <li class="dropdown">
                    	<a href="logout" class="dropdown-toggle" >LOGOUT</a>                        
                    </li>
					<%} else {%>
					<li class="dropdown">
						<a href="login" class="dropdown-toggle" >LOGIN</a>                        
                    </li>
                    <li class="dropdown">
                    	<a href="join" class="dropdown-toggle" >JOIN US</a>                        
                    </li>
					<%}%>
                    
                    
                    
                    <!-- <li class="dropdown dropdown-aux animate-click hidden-xs" data-animate-in="animated bounceInUp" data-animate-out="animated fadeOutDown" style="z-index:500;">
                        <a href="#" class="dropdown-form-toggle" data-toggle="dropdown"><i class="fa fa-search"></i></a>
                        <ul class="dropdown-menu dropdown-menu-user animate-wr">
                            <li id="dropdownForm">
                                <div class="dropdown-form">
                                    <form class="form-horizontal form-light p-15" role="form">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="I want to find ...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-base" type="button">Go</button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </li> -->
                    <li class="dropdown-aux hidden-xs">
                        <a href="#" id="cmdAsideMenu" class="dropdown-toggle dropdown-form-toggle" title="Open sidebar">
                            <i class="fa fa-outdent"></i>
                        </a>
                    </li>
                </ul>
                   
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
</header>        </div>

        <!-- Optional header components (ex: slider) -->
        	<!-- Importing slider content -->
	<section id="slider-wrapper" class="layer-slider-wrapper layer-slider-fullsize">
    <div id="layerslider" style="width:100%;"> 
        <!-- Slide 1 -->
        <div class="ls-slide" data-ls="transition2d:1;timeshift:-1000;">
            <!-- slide background -->
            <img src="../../controller/resources/images/mainimg.jpg" class="ls-bg" alt="Slide background"/>
            
            <!-- Left Text -->
            <h3 class="ls-l title-lg text-uppercase text-left strong" style="width:100%; top: 35%; left:0; color:rgb(231, 76, 60); vertical-align: center;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:1000;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
                <img src="../../controller/resources/images/remind.png" style="width: 10%"> RE:MIND
            </h3>
           <h3 class="ls-l title c-base text-uppercase text-left strong" style="top: 50%; left: 35%;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:1000;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
                <span class="strong-600 c-base">Happy Gifting Starts HERE!</span>
            </h3>

            <h3 class="ls-l title-xs c-white text-uppercase text-center strong" style="width: 100%; top: 82%; left:0;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:1500;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
                <!-- Start the tour -->
            </h3>
        </div>
        
        <!-- Slide 2 -->
        <div class="ls-slide" data-ls="transition2d:1;timeshift:-1000;">
            <!-- slide background -->
            <img src="../../controller/resources/images/ladyopenbox.jpg" class="ls-bg" style="width: 100%;" alt="Slide background"/>
            
            <!-- Left Text -->
            <h3 class="ls-l title text-normal" style="width:600px; top:35%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:500;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
                <strong><span class="strong-600 c-base">선물하는 즐거움/선물받는 즐거움</span><span class="strong-600">getting</span> <span class="strong-600 c-base">started</span></strong>
            </h3>

            <p class="ls-l text-standard" style="width:500px; top:50%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:1000;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
            Boomerang is ready to be part of your project. Let's get started
            </p>
            <a href="https://wrapbootstrap.com/theme/boomerang-multipurpose-template-WB021609D" class="btn btn-base btn-lg ls-l" style="top:60%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1500;delayin:1500;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;" target="_blank">
                <span>Learn more</span>
            </a>
        </div>
        
        <!-- Slide  -->
        <div class="ls-slide" data-ls="transition2d:1;timeshift:-1000;">
            <!-- slide background -->
            <img src="../../controller/resources/images/childbox.jpg" class="ls-bg" style="width: 100%;" alt="Slide background"/>
            
            <!-- Left Text -->
            <h3 class="ls-l title text-normal" style="width:600px; top:35%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:500;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
                The secret of getting ahead is <span class="strong-600">getting</span> <span class="strong-600 c-base">started</span></strong>
            </h3>

            <p class="ls-l text-standard" style="width:500px; top:50%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1000;delayin:1000;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;">
            Boomerang is ready to be part of your project. Let's get started
            </p>
            <a href="https://wrapbootstrap.com/theme/boomerang-multipurpose-template-WB021609D" class="btn btn-base btn-lg ls-l" style="top:60%; left:80px;" data-ls="offsetxin:0;offsetyin:250;durationin:1500;delayin:1500;offsetxout:0;offsetyout:-8;easingout:easeInOutQuart;scalexout:1.2;scaleyout:1.2;" target="_blank">
                <span>Learn more</span>
            </a>
        </div>
        
    </div>
</section>

    
    <!-- MAIN CONTENT -->
        
    <section class="slice no-padding"  id="aboutus">
        <div class="wp-section">
            <div class="row-fluid">
                <div class="col-md-4 wp-block no-space arrow-right base no-margin">
                    <div class="wp-block-body">
                        <div class="img-icon">
                            <i class="fa fa-birthday-cake"></i>
                        </div>                        
                        <h1>Event is Coming!!</h1>
                        <p class="text-center">
                       	 내가 소중히 여기는 이벤트가 다가오나요? 아니면 가족, 친구의 기념일들이 다가오나요? 
                       	 RE:MIND의 페이지에서 당신의 이벤트와 가족, 친구들의 기념일을 확인해보세요!
                       	 다가오는 모든 이벤트, 기념일들을 한눈에 파악할 수 있습니다.
                        </p>
                    </div>
                </div>
                <div class="col-md-4 wp-block no-space arrow-right light no-margin">
                    <div class="wp-block-body">
                        <div class="img-icon">
                            <i class="fa fa-group"></i>
                        </div>
                        <h1>Add to a List / Look at a list</h1>
                        <p class="text-center">
                        	나의 이벤트가 다가온다면 이벤트에 맞추어 선물받고 싶은 목록을 작성해보세요.
                        	내가 받고싶은 선물을 등록한다면 친구들은 당신이 원하는 선물을 고르기 훨씬 쉬울꺼예요.<br>
                        	친구의 이벤트라면 친구가 등록해 놓은 소원목록을 찾아보세요.
                        	친구가 받고싶어하는 선물을 한눈에 보고 내가 주고 싶은 선물을 먼쩌 찜해보세요! 
                        </p>
                    </div>
                </div>
                <div class="col-md-4 wp-block no-space dark no-margin">
                    <div class="wp-block-body">
                        <div class="img-icon">
                            <i class="fa fa-gift"></i>
                        </div>
                        <h1>Get a wonderful gifts</h1>
                        <p class="text-center">
                        	이제는 선물을 받을 차례군요. 기대하세요! 누가 어떤 선물을 나에게 줄지 ^^<br>
                        	당신이 선물을 줄 차례라면 당신은 친구가 가장 원하는 선물을 친구가 좋아할지 고민없이 당당하게 줄 수 있습니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    
    <!-- ========================================쇼핑몰 제휴사================================================ -->
    <section class="slice bg-white">
        <div class="wp-section">
            <div class="container">
                <div class="section-title-wr">
                    <h3 class="section-title left"><span>Our Partners</span></h3>
                </div>
                <div class="row">
                    <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="www.11st.co.kr">
                                <img src="../../controller/resources/images/clients/client-1.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="www.ssg.com">
                                <img src="../../controller/resources/images/clients/client-2.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="www.ebay.com">
                                <img src="../../controller/resources/images/clients/client-3.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="www.auction.co.kr">
                                <img src="../../controller/resources/images/clients/client-4.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="#">
                                <img src="../../controller/resources/images/clients/client-5.png" alt="">
                            </a>
                        </div>
                    </div>
                     <div class="col-md-2 col-sm-4 col-xs-6">
                        <div class="client">
                            <a href="#">
                                <img src="../../controller/resources/images/clients/client-6.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ========================================쇼핑몰 제휴사 끝================================================ --> 
    
    
    
    
    <!-- <section class="slice white bb">
        <div class="wp-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="section-title-wr">
                            <h3 class="section-title left"><span>Our company</span></h3>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque neque eget diam posuere porta. 
                            Quisque ut nulla at nunc vehicula lacinia. Proin adipiscing porta tellus, ut feugiat nibh adipiscing sit amet. 
                            In eu justo a felis faucibus ornare vel id metus. 
                            <br><br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque neque eget diam posuere porta. 
                            Quisque ut nulla at nunc vehicula lacinia.
                        </p>
                    </div>
                    <div class="col-md-7">
                        <div class="section-title-wr">
                            <h3 class="section-title left"><span>Our expertise</span></h3>
                        </div>
                        <div class="progress progress-lg">
                            <div class="progress-bar progress-bar-base" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                            <span class="sr-only">Web Design</span>
                            </div>
                        </div>
                        <div class="progress progress-lg">
                            <div class="progress-bar progress-bar-base" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            <span class="sr-only">PHP Development</span>
                            </div>
                        </div>
                        <div class="progress progress-lg">
                            <div class="progress-bar progress-bar-base" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                            <span class="sr-only">jQuery</span>
                            </div>
                        </div>
                        <div class="progress progress-lg">
                            <div class="progress-bar progress-bar-base" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            <span class="sr-only">PHP Development</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <!-- <section class="slice light-gray bb">
        <div class="wp-section">
            <div class="container">
                <div class="section-title-wr">
                    <h3 class="section-title left"><span>Our services</span></h3>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="wp-block hero white no-margin">
                            <div class="thmb-img">
                                <i class="fa fa-birthday-cake"></i>
                            </div>
                            
                            <h2>선물</h2>
                            <p class="text-center">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum. </p>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="wp-block hero white no-margin">
                            <div class="thmb-img">
                                <i class="fa fa-list-ul"></i>
                            </div>
                            
                            <h2>Prototype model</h2>
                            <p class="text-center">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum. </p>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="wp-block hero white no-margin">
                            <div class="thmb-img">
                                <i class="fa fa-group"></i>
                            </div>
                            
                            <h2>Design and Code</h2>
                            <p class="text-center">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum. </p>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="wp-block hero white no-margin">
                            <div class="thmb-img">
                                <i class="fa fa-gift"></i>
                            </div>
                            
                            <h2>Launching and Monitoring</h2>
                            <p class="text-center">Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum. </p>
                        </div>
                    </div>
                        
                </div>
            </div>
        </div>
    </section> -->
    
   <!--  <section id="companyCarousel" class="carousel carousel-2 slide bg-white bb" data-ride="carousel">
        <div class="container relative">
            Indicators
            <ol class="carousel-indicators">
                <li data-target="#companyCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#companyCarousel" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="owl-carousel owl-carousel-single no-padding">
                    <div class="item active">
                        <div class="row">
                            <div class="col-md-6">
                                <h2 class="title">Performance and design for your business</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                                </p>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. 
                                </p>
                            </div>
                            <div class="col-md-6">
                                <img src="../../controller/resources/images/prv/device-3.png" class="img-responsive" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="row">
                            <div class="col-md-6">
                                <h2 class="title">Complete features at your hand</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                                </p>
                                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. 
                                </p>
                            </div>
                            <div class="col-md-6">
                                <img src="../../controller/resources/images/prv/device-4.png" class="img-responsive" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <!-- <section class="slice p-15 bg-base">
        <div class="cta-wr">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="text-normal">
                            <strong>Boomerang 2.</strong> Well done is better than well said. Wanna know why?
                        </h1>
                    </div>
                    <div class="col-md-4">
                        <a href="#" class="btn btn-lg btn-b-white btn-icon btn-check pull-right">
                            <span>Try me now</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <!-- <section class="slice bg-white bb animate-hover-slide-3">
        <div class="wp-section">
            <div class="container">
                <div class="section-title-wr">
                    <h3 class="section-title left"><span><a href="ourteam">Our team</a></span></h3>
                </div>
                <div class="row">   
                    <div class="col-md-3">
                        <div class="wp-block inverse">
                            <div class="figure">
                                <img alt="" src="../../controller/resources/images/team/baejs.jpg" class="img-responsive">
                                <div class="figcaption">                                    
                                    <ul class="social-icons text-right">
                                        <li class="text pull-left">More on:</li>
                                        <li class="facebook"><a target="blank" href="https://www.facebook.com/remindwishlist/"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h2>Bae, JinSeop<small>JangIn ("The Master")</small></h2>
                            <p>
                            The Shuim Project Group chief technical officer, so called "장인".
                            </p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="wp-block inverse">
                            <div class="figure">
                                <img alt="" src="../../controller/resources/images/team/choiyw.jpg" class="img-responsive">
                                <div class="figcaption">                                    
                                    <ul class="social-icons text-right">
                                        <li class="text pull-left">More on:</li>
                                        <li class="facebook"><a target="blank" href="https://www.facebook.com/profile.php?id=100003077162512"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h2>Choi, YoungWook<small>Chief Builder</small></h2>
                            <p>
                            The Shuim Project Group web page building officer.
                            </p>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="wp-block inverse">
                            <div class="figure">
                                <img alt="" src="../../controller/resources/images/team/parkbh.jpg" class="img-responsive">
                                <div class="figcaption">                                    
                                    <ul class="social-icons text-right">
                                        <li class="text pull-left">More on:</li>
                                        <li class="facebook"><a target="blank" href="https://www.facebook.com/remindwishlist/"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h2>Park, BaeHeum<small>Team Leader</small></h2>
                            <p>
                            The Shuim Project Group team leader.
                            </p>
                        </div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="wp-block inverse">
                            <div class="figure">
                                <img alt="" src="../../controller/resources/images/team/simjy.jpg" class="img-responsive">
                                <div class="figcaption">                                    
                                    <ul class="social-icons text-right">
                                        <li class="text pull-left">More on:</li>
                                        <li class="facebook"><a target="blank" href="https://www.facebook.com/sim.jinyoung"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <h2>Sim, JinYoung<small>Chairperson</small></h2>
                            <p>
                            Chair Person of the Shuim Project Group.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

<!--     <section class="prlx-bg inset-shadow-1" data-stellar-ratio="2" style="min-height: 450px; padding: 50px 0; background-image: url(../../controller/resources/images/backgrounds/full-bg-3.jpg); background-position: 0 -100px;">
        <div class="mask mask-2"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-center">
                            <h4 class="c-white"><i class="fa fa-birthday-cake fa-4x"></i></h4>
                            <h2 class="c-white">UI Elements and Shortcodes for a more dynamic content</h2>
                            
                            <div class="row">
                                <div class="col-sm-6 col-md-3">
                                    <div class="pie-chart" data-percent="91" data-color="#FFF">
                                        <span class="percent"></span>
                                        <div class="chart-text">
                                            <h3 class="c-white">Web Design</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="pie-chart" data-percent="23" data-color="#FFF">
                                        <span class="percent"></span>
                                        <div class="chart-text">
                                            <h3 class="c-white">UI Elements</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="pie-chart" data-percent="68" data-color="#FFF">
                                        <span class="percent"></span>
                                        <div class="chart-text">
                                            <h3 class="c-white">Flexible code</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="pie-chart" data-percent="90" data-color="#FFF">
                                        <span class="percent"></span>
                                        <div class="chart-text">
                                            <h3 class="c-white">Business ready</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    
<!-- 
    <section class="slice light-gray">
        <div class="wp-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-mobile"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>Mobile ready</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-file"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>40+ Prebuild pages</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-list-alt"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>SEO Optimized</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-thumbs-up"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>Modern standard pages</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>Loaded with shortcodes</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="aside-feature">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="icon-feature">
                                        <i class="fa fa-shopping-cart"></i>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <h4>Shop - Clean layout</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    
    
<%@ include file="footer.jsp" %>



<!-- Essentials -->
<script src="../../controller/resources/js/modernizr.custom.js"></script>
<script src="../../controller/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../../controller/resources/js/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="../../controller/resources/js/jquery.easing.js"></script>
<script src="../../controller/resources/js/jquery.metadata.js"></script>
<script src="../../controller/resources/js/jquery.hoverup.js"></script>
<script src="../../controller/resources/js/jquery.hoverdir.js"></script>
<script src="../../controller/resources/js/jquery.stellar.js"></script>

<!-- Boomerang mobile nav - Optional  -->
<script src="../../controller/resources/assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
<script src="../../controller/resources/assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script>

<!-- Forms -->
<script src="../../controller/resources/assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script> 
<script src="../../controller/resources/assets/ui-kit/js/cusel.min.js"></script>
<script src="../../controller/resources/assets/sky-forms/js/jquery.form.min.js"></script>
<script src="../../controller/resources/assets/sky-forms/js/jquery.validate.min.js"></script>
<script src="../../controller/resources/assets/sky-forms/js/jquery.maskedinput.min.js"></script>
<script src="../../controller/resources/assets/sky-forms/js/jquery.modal.js"></script>

<!-- Assets -->
<script src="../../controller/resources/assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script src="../../controller/resources/assets/page-scroller/jquery.ui.totop.min.js"></script>
<script src="../../controller/resources/assets/mixitup/jquery.mixitup.js"></script>
<script src="../../controller/resources/assets/mixitup/jquery.mixitup.init.js"></script>
<script src="../../controller/resources/assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script src="../../controller/resources/assets/waypoints/waypoints.min.js"></script>
<script src="../../controller/resources/assets/milestone-counter/jquery.countTo.js"></script>
<script src="../../controller/resources/assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
<script src="../../controller/resources/assets/social-buttons/js/rrssb.min.js"></script>
<script src="../../controller/resources/assets/nouislider/js/jquery.nouislider.min.js"></script>
<script src="../../controller/resources/assets/owl-carousel/owl.carousel.js"></script>
<script src="../../controller/resources/assets/bootstrap/js/tooltip.js"></script>
<script src="../../controller/resources/assets/bootstrap/js/popover.js"></script>

<!-- Sripts for individual pages, depending on what plug-ins are used -->
<script src="../../controller/resources/assets/layerslider/js/greensock.js" type="text/javascript"></script>
<script src="../../controller/resources/assets/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="../../controller/resources/assets/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<!-- Initializing the slider -->
<script>
    jQuery("#layerslider").layerSlider({
        pauseOnHover: true,
        autoPlayVideos: false,
        skinsPath: 'assets/layerslider/skins/',
        responsive: false,
        responsiveUnder: 1280,
        layersContainer: 1280,
        skin: 'borderlessdark3d',
        hoverPrevNext: true,
    });
</script>

<!-- Boomerang App JS -->
<script src="../../controller/resources/js/wp.app.js"></script>
<!--[if lt IE 9]>
    <script src="../../controller/resources/js/html5shiv.js"></script>
    <script src="../../controller/resources/js/respond.min.js"></script>
<![endif]-->

<!-- Temp -- You can remove this once you started to work on your project -->
<script src="../../controller/resources/js/jquery.cookie.js"></script>
<script src="../../controller/resources/js/wp.switcher.js"></script>
<script type="text/javascript" src="../../controller/resources/js/wp.ga.js"></script>


</body>
</html> 