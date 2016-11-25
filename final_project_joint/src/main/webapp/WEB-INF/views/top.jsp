<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML">
<html>
<head>


<script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
<script src="//twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>

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
	$( document ).ready(function(){
		$('#friendSearch').typeahead(null,{
			source: function(query, syncResults, asyncResults) {
			    $.get('searching?name='+query, function(data) {
			        asyncResults(data);
			      });
			    },
		    templates: {
				    empty: [
				      '<div class="empty-message">',
				        '친구가 없습니다.',
				      '</div>'
				    ].join('\n'),
				    suggestion: function(data){
				       html = "<div><img src='http://wbp.synology.me/profileimg/" + data.m_image + "' class='img-circle' style='width:10%;'/>";
				        html +="<strong>" + data.m_email + "</strong> - " + data.m_name + "</div>";
				        return html;
				    },
				  }
			})
			jQuery('#friendSearch').on('typeahead:selected', function (e, datum) {
				$('#friendSearch').val(datum.m_name); 
				 var idx = $('<input type="hidden" value="'+datum.m_no+'" name="m_no">');
				 $("#gofr").append(idx);
    			 $("#gofr").submit(); 
    			
			});
		
			$('#friendSearch').bind('typeahead:cursorchange', function(ev, suggestion) {
				$('#friendSearch').val(suggestion.m_name); 
			});
			
			
	}) 

	function myWishlist() {
		if(<%=session.getAttribute("mno")%>	 == null){
			location.href="login"
		}else{
		$("#wishlist").submit();
		}
	}
	

</script>
<style type="text/css">
.tt-query, /* UPDATE: newer versions use tt-input instead of tt-query */
.tt-hint {
    width: 100%;
    height: 30px;
    padding: 8px 12px;
    font-size: 24px;
    line-height: 30px;
    border: 2px solid #ccc;
    border-radius: 8px;
    outline: none;
}

.tt-query { /* UPDATE: newer versions use tt-input instead of tt-query */
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.tt-hint {
    color: #999;
}

.tt-menu { /* UPDATE: newer versions use tt-menu instead of tt-dropdown-menu */
    width: 422px;
    margin-top: 12px;
    padding: 8px 0;
    background-color: #f2dede;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 8px;
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
}
/* .tt-menu.img-circle{
	width:5%;
} */

.tt-suggestion {
    padding: 3px 20px;
    font-size: 18px;
    line-height: 24px;
}

.tt-suggestion.tt-is-under-cursor { /* UPDATE: newer versions use .tt-suggestion.tt-cursor */
    color: #fff;
    background-color: #0097cf;

}

.tt-suggestion p {
    margin: 0;
}

</style>
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
            <form id="gofr" action="friendinfo" method="post">
				</form>
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
                        <a href="javascript:myWishlist()" class="dropdown-toggle" >WISHLIST</a>
						<form action="showWishList" method="get" id="wishlist">
							<input type="hidden" name="w_mno" value="<%=session.getAttribute("mno")%>">
						</form>                                                
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
                    <!-- <li class="dropdown">
                    	<a href="join" class="dropdown-toggle" >JOIN</a>                        
                    </li> -->
					<%}%>
					<li class="form-group dropdown dropdown-meganav mega-dropdown-fluid">                   
						<a href="#" class="dropdown-toggle"><i class="icon-append fa fa-search"></i><input type="search" name="friendSearch" id="friendSearch" required sautofocu required=required placeholder="친구찾기"></a> 					
					</li>			
                  
                    <!-- <li class="dropdown dropdown-aux animate-click hidden-xs" data-animate-in="animated bounceInUp" data-animate-out="animated fadeOutDown" style="z-index:500;">
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
                    </li> -->
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