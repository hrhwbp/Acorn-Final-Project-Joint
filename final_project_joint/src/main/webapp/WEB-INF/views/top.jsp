<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML">
<html>
<head>


<!-- <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script> -->
<!-- <script src="//twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script> -->

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
<div id="divHeaderWrapper">
            <header class="header-standard-2">     
    <!-- MAIN NAV -->
    <div class="navbar navbar-wp navbar-arrow mega-nav" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle navbar-toggle-aside-menu">
                    <i class="fa fa-outdent icon-custom"></i>
                </button>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <i class="fa fa-bars icon-custom"></i>
                </button>

                <a class="navbar-brand" href="action" title="RE:MIND || Happy Gifting Starts Here!">
                    <img src="resources/images/boomerang-logo-black.png" alt="RE:MIND || Happy Gifting Starts Here!">
                </a>
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
                    <li class="dropdown">
                    	<a href="anniversary" class="dropdown-toggle" >EVENTS</a>                        
                    </li>
                    <li class="dropdown">
                        <a href="qna" class="dropdown-toggle" >QnA</a>                        
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
                    	<a href="join" class="dropdown-toggle" >JOIN</a>                        
                    </li>
					<%}%>
								
                  
                    <li class="dropdown dropdown-aux animate-click hidden-xs" data-animate-in="animated bounceInUp" data-animate-out="animated fadeOutDown" style="z-index:500;">
                        <a href="#" class="dropdown-form-toggle" data-toggle="dropdown"><i class="fa fa-search"></i></a>
                        <ul class="dropdown-menu dropdown-menu-user animate-wr">
                            <li id="dropdownForm">
                                <div class="dropdown-form">
                                    <form class="form-horizontal form-light p-15" role="form">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="친구찾기 ...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-base" type="button">찾기</button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown-aux">
                        <a href="#" id="cmdAsideMenu" class="dropdown-toggle dropdown-form-toggle" title="Open slidebar">
                            <i class="fa fa-outdent"></i>
                        </a>
                    </li>
                </ul>
               
            </div><!--/.nav-collapse -->
        </div>
    </div>
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
                <a href="action#aboutus">About us</a>
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
        <a target="blank" href="https://www.facebook.com/remindwishlist/"><i class="fa fa-facebook"></i></a>
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
</header>        
</div>


</body>
</html>