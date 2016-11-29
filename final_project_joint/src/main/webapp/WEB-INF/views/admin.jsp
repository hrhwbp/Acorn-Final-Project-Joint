<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<link rel="stylesheet" type="text/css" href="resources/admin/bootstrap/css/bootstrap.min.css" />

<link href="resources/admin/css/main.css" rel="stylesheet">
<link href="resources/admin/css/font-style.css" rel="stylesheet">
<link href="resources/admin/css/flexslider.css" rel="stylesheet">

<script type="text/javascript" src="resources/admin/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>    
<script type="text/javascript" src="resources/admin/bootstrap/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="resources/admin/js/lineandbars.js"></script> -->
<script type="text/javascript" src="resources/admin/js/gauge.js"></script>
	
<!-- NOTY JAVASCRIPT -->
<script type="text/javascript" src="resources/admin/js/noty/jquery.noty.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/top.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topLeft.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topRight.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topCenter.js"></script>
	
<!-- You can add more layouts if you want -->
<script type="text/javascript" src="resources/admin/js/noty/themes/default.js"></script>
<!-- <script type="text/javascript" src="assets/js/dash-noty.js"></script> This is a Noty bubble when you init the theme-->
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<script src="resources/admin/js/jquery.flexslider.js" type="text/javascript"></script>

<script type="text/javascript" src="resources/admin/js/admin.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
   
<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

<style type="text/css">
body {
	padding-top: 60px;
}
</style>
<script type="text/javascript">


//첫번째 차트
function chart1(man, woman) {
	var tot = man + woman;
	var w = Math.floor(woman/tot*100);
	var m =  Math.floor(man/tot*100);
	var nn = 20;
	info = new Highcharts.Chart({
		chart: {
			renderTo: 'load',
			margin: [0, 0, 0, 0],
			backgroundColor: null,
            plotBackgroundColor: 'none',
		},
		title: {
			text: null
		},
		tooltip: {
			formatter: function() { 
				return this.point.name +': '+ this.y +' %';
			} 	
		},
	    series: [
			{
			borderWidth: 2,
			borderColor: '#F1F3EB',
			shadow: false,	
			type: 'pie',
			name: 'Income',
			innerSize: '65%',
			data: [
				{ name: '남자', y: m, color: '#b2c831' },
				{ name: '여자', y: w, color: '#3d3d3d' }
			],
			dataLabels: {
				enabled: false,
				color: '#000000',
				connectorColor: '#000000'
			}
		}]
	});
	
}

// 두번째 차트(넣을게 없다...)
/* function chart2() {
	info = new Highcharts.Chart({
		chart: {
			renderTo: 'space',
			margin: [0, 0, 0, 0],
			backgroundColor: null,
            plotBackgroundColor: 'none',
		},
		title: {
			text: null
		},
		tooltip: {
			formatter: function() { 
				return this.point.name +': '+ this.y +' %';
			} 	
		},
	    series: [
			{
			borderWidth: 2,
			borderColor: '#F1F3EB',
			shadow: false,	
			type: 'pie',
			name: 'SiteInfo',
			innerSize: '65%',
			data: [
				{ name: '이정도면 충분한거 같은데...', y: 80.0, color: '#fa1d2d' },
				{ name: '뭔가 넣을게 없다...', y: 20.0, color: '#3d3d3d' }
			],
			dataLabels: {
				enabled: false,
				color: '#000000',
				connectorColor: '#000000'
			}
		}]
	});
	
} */
	
   /*  $(document).ready(function () {
        $("#btn-blog-next").click(function () {
            $('#blogCarousel').carousel('next')
        });
        $("#btn-blog-prev").click(function () {
            $('#blogCarousel').carousel('prev')
        });

        $("#btn-client-next").click(function () {
            $('#clientCarousel').carousel('next')
        });
        $("#btn-client-prev").click(function () {
            $('#clientCarousel').carousel('prev')
        });
    }); */

    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
        
       
        
    });
    
//시계 ***   
function printClock(){
	var clock;            							
	var currentDate = new Date();                   // 현재시간
	var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	var amPm = 'AM'; 								// 초기값 AM
	var currentHours = addZeros(currentDate.getHours(),2); 
	var currentMinute = addZeros(currentDate.getMinutes() ,2);
	var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	        
	if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 뺀다
		amPm = 'PM';
		currentHours = addZeros(currentHours - 12,2);
	}

	if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	}
	
	clock = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	$(".clockcenter digiclock").html(clock);	// 출력할 장소 선택
	
	setTimeout("printClock()",1000);         	// 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { 	// 자릿수 맞춰주기
	var zero = '';
	num = num.toString();
	if (num.length < digit) {
		for (i = 0; i < digit - num.length; i++) {
			zero += '0';
		}
	}
	return zero + num;
}
//*** 시계      

//차트 ***
function stockChart(name, url, stock){
	/* function generateNumber(min, max) {
		min = typeof min !== 'undefined' ? min : 1;
		max = typeof max !== 'undefined' ? max : 100000;
		return Math.floor((5 * max) + min);
	} */

	
	/*
	var chart,
		categories = ['Categorie 1', 'Categorie 2', 'Categorie 3', 'Categorie 4', 'Categorie 5','Categorie 6', 'Categorie 7', 'Categorie 8', 'Categorie 9', 'Categorie 10', 'Categorie 11', 'Categorie 12', 'Categorie 13', 'Categorie 14', 'Categorie 15', 'Categorie 16', 'Categorie 17', 'Categorie 18', 'Categorie 19','Categorie 20', 'Categorie 21','Categorie 22', 'Categorie 23', 'Categorie 24', 'Categorie 25', 'Categorie 26', 'Categorie 27', 'Categorie 28', 'Categorie 29', 'Categorie 30'],
		serie1 = [13, 13, 46, 61, 23, 12, 24, 16, 14, 12, 12, 24, 19, 13, 11, 11, 14, 11, 11, 11, 11, 13, 22, 10, 18, 15, 24, 31, 19, 10],
		serie2 = [52, 41, 58, 63, 55, 46, 45, 41, 38, 54, 50, 39, 48, 70, 63, 60, 58, 63, 83, 89, 83, 79, 83, 100, 104, 108, 52, 46, 83, 89],
		$aapls;
	*/
	
	var chart,
		categories= ['Categorie 1', 'Categorie 2', 'Categorie 3','Categorie 4', 'Categorie 5'], 
		serie1=[43000,49000,52000,60000,63000], 
		serie2=[43000,49000,52000,60000,63000], 
		$aapls;
	
	//창을 불러올때 주식가격 출력
	var i=0;
	categories[i+5] = 'Categorie '+ (i+6).toString();
	serie1[i+5] = stock;
	serie2[i+5] = stock;
	new stockStatus2(serie1[i+5]);
	
	//차트
	$(document).ready(function() {					
		chart = new Highcharts.Chart({
			chart: {
			renderTo: 'importantchart',
				type: 'column',
				backgroundColor: 'transparent',
				height: 140,
				marginLeft: 3,
				marginRight: 3,
				marginBottom: 0,
				marginTop: 0
			},
			title: {
			text: ''
			},
			xAxis: {
				lineWidth: 0,
				tickWidth: 0,
				labels: { 
					enabled: false 
				},
				categories: categories
			},
			yAxis: {
				labels: { 
					enabled: false 
				},
				gridLineWidth: 0,
				title: {
					text: null,
				},
			},
			series: [{
				name: 'Awesomness',
				data: serie1
			}, {
				name: 'More Awesomness',
				color: '#fff',
				type: 'line',
				data: serie2
			}],
			credits: { 
				enabled: false 
			},
			legend: { 
				enabled: false 
			},
			plotOptions: {
				column: {
					borderWidth: 0,
					color: '#b2c831',
					shadow: false
				},
				line: {
					marker: { 
						enabled: false 
					},
					lineWidth: 3
				}
      		},
			tooltip: { 
				enabled: false
			}
		});
		
		/* setInterval(function(){
			chart.series[0].addPoint(generateNumber(), true, true);
			chart.series[1].addPoint(generateNumber(50, 150), true, true);
			new stockStatus(serie1[0]);
		}, 5000); */
		
		setInterval(function(){					//5초마다 주식값 가져오기
			$.ajax({
				type:"get",
				url:"stockchages",
				data: {},
				dataType: "json",
				success: function(list){
					serie1[i+6] = list.stocks;
					serie2[i+6] = list.stocks;
					
					chart.series[0].addPoint(serie1[5], true, true);			//주식가격 차트에 출력
					chart.series[1].addPoint(serie2[5], true, true);			//주식가격 차트에 출력
					new stockStatus2(serie1[i+6]);

					i++;
				},
				error: function(){
					alert("에러 발생");
				}
			});
		}, 5000);

		setInterval(function() {
			$('.info-aapl span').each(function(index, elem) {
				$(elem).animate({
					height: generateNumber(1, 40)
				});
			});
		}, 5000);
		
		setInterval(function(){				//네이버에서 경제기사 가져오기...
			new articleUpdate(name, url);
		}, 300000);
		
	});
}


var prenum = 0;
function stockStatus2(stock){
	
	if(stock == prenum){
		var dif = 0;
		$("div #stockstatus").html(
				'<p><img src="resources/admin/images/up.png" alt="" style="width: 40px; height: 40px;"><bold>Up</bold> | ' + dif + '.</p>'	
		);
		$("div #totcost").html(
				'<i class="graph-arrow"></i><span class="graph-info-big" id="totcost">' + stock + '원</span>'	
		);
	}else if(prenum < stock){
		var dif = stock-prenum;
		$("div #stockstatus").html(
			'<p><img src="resources/admin/images/up.png" alt="" style="width: 40px; height: 40px;"><bold>Up</bold> | ' + dif + '.</p>'		
		);
		$("div #totcost").html(
				'<i class="graph-arrow"></i><span class="graph-info-big" id="totcost">'+ stock +'원</span>'	
		);
	}else if(prenum > stock){
		var dif = prenum-stock;
		$("div #stockstatus").html(
			'<p><img src="resources/admin/images/down.png" alt="" style="width: 40px; height: 40px;"><bold>Up</bold> | ' + dif + '.</p>'		
		);
		$("div #totcost").html(
			'<i class="graph-arrow"></i><span class="graph-info-big" id="totcost">'+ stock +'원</span>'	
		);
	}
	prenum=stock;	
}

//Article Update
function articleUpdate(name, url){
	
	$("#url2").html("<a target='blank' href='" + url + "'>" + name + "</a>");
}

//Admin Update
function adminUpdate(adno){
	$.ajax({
		type:"post",
		url:"selectAdmin",
		data: {"ad_no":adno},
		dataType: "json",
		success: function(dto){
			
			$("#AdminName").val(dto.ad_name);
			$("#AdminPasswd").val(dto.ad_password);	
			$("#updateModal").modal();
		},
		error: function(){
			alert("에러 발생");
		}
	});
	
}

function updateMsg(adno,ad_no){
	$.ajax({
		type:"post",
		url:"selectAdmin",
		data: {"ad_no":ad_no},
		dataType: "json",
		success: function(dto){
			if(adno != ad_no){
				$("#MsgDetail").attr("readonly", "readonly");
			}else if(adno == ad_no){
				$("#MsgDetail").removeAttr("readonly");
			}
			$("#AdNameMsg").html(dto.ad_name);
			$("#MsgDetail").val(dto.ad_msg);
			$("#MsgUpdateModal").modal();
		},
		error: function(){
			alert("에러 발생");
		}
	});
}

function updateSubmit(){
	document.wishGroupForm.action = "updateAdmin";
    document.wishGroupForm.method = "post";
    document.wishGroupForm.submit();
}



</script>    
</head>
<body onload="printClock(), chart1(${man},${woman}), stockChart('${articleName}','${articleUrl}', ${stock})">
	<c:if test="${updateCheck == 1}">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#updateConfirm").modal();
		});
	</script>
	</c:if>
  	<!-- NAVIGATION MENU -->
	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="MainAdmin"><img src="resources/images/boomerang-logo-white.png" style="widows: 60px; height: 15px;" alt=""> RE:MIND</a>
			</div> 
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!--세션 값으로 TOP Menu 설정  -->
					<%if(session.getAttribute("adno") != "" || session.getAttribute("adno") != null){ %>
						<li class="active"><a href="MainAdmin"><i class="icon-home icon-white"></i> Home</a></li>                            
						<li><a href="showAdminTable"><i class="icon-th icon-white"></i> Tables</a></li>
						<li><a href="adminLogout"><i class="icon-lock icon-white"></i> Logout</a></li>
						<li><a href="index.jsp"><i class="icon-user icon-white"></i> User</a></li>
					<%}else{%>
						<li class="adminLogin.jsp"><a href="MainAdmin"><i class="icon-home icon-white"></i> Home</a></li>                            
						<li><a href="adminLogin.jsp"><i class="icon-th icon-white"></i> Tables</a></li>
						<li><a href="adminLogin.jsp"><i class="icon-lock icon-white"></i> Login</a></li>
						<li><a href="adminLogin.jsp"><i class="icon-user icon-white"></i> User</a></li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>

	<!--Admin Profile  -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      			<dtitle>User Profile</dtitle><hr>
					<div class="thumbnail">
						<img src="resources/images/team/simjy.jpg" style="width: 100px; height: 100px" alt="Marcel Newman" class="img-circle">
					</div>
					<h1>Copy Right by Sim</h1>
					<h3>Seoul, Korea</h3><br>
					<div class="info-user">
						<a href="javascript:void(0)" onclick="adminUpdate('<%=session.getAttribute("adno")%>')"><span aria-hidden="true" class="li_settings fs1"></span></a>
						<a target="blank" href="https://accounts.google.com/ServiceLogin?service=mail&passive=true&rm=false&continue=https://mail.google.com/mail/?tab%3Dwm&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1#identifier"><span aria-hidden="true" class="li_mail fs1"></span></a>
					</div>
				</div>
			</div>

			<!-- DONUT CHART BLOCK -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>CHART1</dtitle><hr>
					<div id="load"></div>
					<h2>성별 비율</h2>
				</div>
			</div>
			
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Co-Founders</dtitle><hr>
						<div class="framemail">
							<div class="window">
								<ul class="mail">
									<c:forEach var="ad" items="${adminMsg}">
										<li onclick="updateMsg('<%=session.getAttribute("adno")%>', '${ad.ad_no}')">
											<i class="unread"></i>
											<c:choose>
												<c:when test="${ad.ad_no == 1}">
													<img class="avatar" src="resources/images/team/parkbh.jpg" alt="avatar">
												</c:when>
												<c:when test="${ad.ad_no == 2}">
													<img class="avatar" src="resources/images/team/simjy.jpg" alt="avatar">
												</c:when>
												<c:when test="${ad.ad_no == 3}">
													<img class="avatar" src="resources/images/team/baejs.jpg" alt="avatar">
												</c:when>
												<c:when test="${ad.ad_no == 4}">
													<img class="avatar" src="resources/images/team/choiyw.jpg" alt="avatar">
												</c:when>
											</c:choose>
											<p class="sender">${ad.ad_name}</p>
											<p class="message"><strong>${ad.ad_msg}</strong></p>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			
        
        	<!-- CLOCK  -->
			<div class="col-sm-3 col-lg-3">
				<div class="half-unit">
					<dtitle>현재시간</dtitle><hr>
					<div class="clockcenter">
						<digiclock></digiclock>
					</div>
				</div>

				<!-- SERVER UPTIME -->
				<div class="half-unit">
					<dtitle>주가 현황</dtitle><hr>
					<div class="cont" id="stockstatus">
						<p><img src="resources/admin/images/up.png" alt="" style="width: 40px; height: 40px;"><bold></bold> | 0</p>
					</div>
				</div>
			</div>
			
		</div>
      
      
	
		<div class="row">
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Other Information</dtitle><hr>
					<div class="section-graph">
						<div id="importantchart"></div><br>
						<div class="graph-info" id="totcost">
							<i class="graph-arrow"></i>
							<span class="graph-info-big"></span>
							<span class="graph-info-small" id="difcost"></span>
						</div>
					</div>
				</div>
			</div>

			 <!-- ITEM STATUS -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Member & Board & Wishlist</dtitle><hr>
					<div class="cont">
						<p><bold>${wishcnt}</bold> | <ok>아이템수</ok></p><br>
						<p><bold>${memcnt}</bold> | 회원수</p><br>
						<p><bold>${boardcnt}</bold> | <bad>게시물수</bad></p><br>
						<p><img src="resources/admin/images/up-small.png" alt="">Total Item List</p>
					</div>
				</div>
			</div>
        
			  
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Latest News</dtitle><hr>
					<div class="info-user">
						<span aria-hidden="true" class="li_news fs2"></span>
					</div><br>
					<div class="text">
						<p><b>Article Update:</b><p>
						<p id="url2"></p>
						<p><grey>Last Update: 5 min ago.</grey></p>
					</div>
				</div>
			</div>  
		</div>
		
	</div><br><br><br><br><br><br> 

	<div id="footerwrap">
      	<footer class="clearfix"></footer>
      	<div class="container">
      		<div class="row">
      			<div class="col-sm-12 col-lg-12">
      			<p><img src="resources/images/boomerang-logo-white.png" alt=""></p>
      			<p>RE:MIND - Created With Love - Inspired by SIM</p>
      			</div>

      		</div>
      	</div>	
	</div>
       
	<!--Admin 수정모달 팝업 BEGINNING-->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="updateModalLabel">수정</h4>
				</div>
				<div class="modal-body">
					<form name="wishGroupForm">
						<div class="form-group6">
							<label class="form-control-label">Admin Name:</label> 
							<input type="hidden" id="AdminNo" name="ad_no" value="<%=session.getAttribute("adno")%>">
							<input type="text" class="form-control" id="AdminName" name="ad_name">
						</div>
						<div class="form-group7">
							<label class="form-control-label">Admin Password:</label> 
							<input type="text" class="form-control" id="AdminPasswd" name="ad_password">
						</div>
							<div class="modal-footer">
							<button onclick="updateSubmit()" class="btn btn-primary" id="updateconfirm">Confirm</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
   <!-- Admin 수정모달 팝업 END-->
   
   <!--Admin 메세지모달-->
	<div class="modal fade" id="MsgUpdateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="updateModalLabel">수정</h4>
				</div>
				<div class="modal-body">
					<form action="updateMsg" method="post" name="MsgUpdateForm">
						<div class="form-group6">
							<label class="form-control-label">Admin Name:</label> 
							<span class="form-control" id="AdNameMsg"></span>
						</div>
						<div class="form-group7">
							<label class="form-control-label">Admin Message:</label>
							<textarea class="form-control" id="MsgDetail" name="ad_msg"></textarea>
							<input type="hidden" name="ad_no" value="<%=session.getAttribute("adno")%>"> 
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="updateconfirm">명령내리기</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
   
     
       	
   <!--Admin 수정 확인모달  -->
   <div class="modal fade" id="updateConfirm" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="updateModalLabel">수정 완료</h4>
            </div>
            
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
         </div>
      </div>
   </div>    
       
</body>
</html>