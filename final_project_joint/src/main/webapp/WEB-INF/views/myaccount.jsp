<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <title>Boomerang 2 - MultiPurpose Template</title>

    <!-- Essential styles -->
    <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="resources/assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen"> 
     
    <!-- Boomerang styles -->
        <link id="wpStylesheet" type="text/css" href="resources/css/global-style-red.css" rel="stylesheet" media="screen">
        

    <!-- Favicon -->
    <link href="resources/images/favicon.png" rel="icon" type="image/png">

    <!-- Assets -->
    <link rel="stylesheet" href="resources/assets/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/assets/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms.css">    
    <!--[if lt IE 9]>
        <link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms-ie8.css">
    <![endif]-->

    <!-- Required JS -->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>

	<!-- ===============================해당 페이지용 스타일================================================ -->
<style type="text/css">
/* ============아이콘 표시를 위한 import=============== */
@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
}
@import url(http://fonts.googleapis.com/css?family=Titillium+Web:300);
/* ============아이콘 표시를 위한 import 끝ㅇ============== */
.thumbnail-wrappper {
    width: 25%; 
}

.thumbnail {
    position: relative;
    padding-top: 100%;  /* 1:1 ratio */
    overflow: hidden;
}

.thumbnail .centered  {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    -webkit-transform: translate(50%,50%);
    -ms-transform: translate(50%,50%);
    transform: translate(50%,50%);
}

.thumbnail .centered img {
    position: absolute;
    top: 0;
    left: 0;   
    max-width: 100%;
    height: auto;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.thumbnail img.portrait {
  width: 100%;
  max-width: none;
  height: auto;
}
.thumbnail img.landscape {
  width: auto;
  max-width: none;
  height: 100%;
}

} 
</style>	

    <!-- ===============================해당 페이지용 스크립트================================================ -->
    
<!--<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
    
<script type="text/javascript">
$(document).ready(function() {
	$('#updateSubmit').click(function() {
		$('#boardUpdatefrm').submit()
	});
	
	$('#infoSubmit').click(function() {
		if($('#password').val() == $('#m_password').val()){
			$('#infofrm').submit()
		}else{
			$('#passwordErr').modal('show');
		}
	});
	
	$('#boardInsertBtn').click(function() {
		$('#boardInsert').modal('show');
		$('#boardInsertImg').hide();
	});
	
	$('#boardInsertSubmit').click(function() {
		/* alert(boardInsertFile.files[0]); */
		if(boardInsertFile.files[0] == undefined){
			$('#boardInsertErr').modal('show');
			return;
		}else if($('#modalInsertContent').val() == ''){
			$('#modalInsertContent').attr('placeholder','내용을 입력 해주세요!!');
			$('#modalInsertContent').focus();
			return;
		}
		$('#boardInsertfrm').submit();
	});
	
});

/* 내 게시물 자세히 복 */
function modalToggle(b_no) {
	/* alert(b_no) 보드 번호 받기. */ 
	 jQuery.ajax({
         type:"post",
         url:"boardDetail",
         data: {"b_no":b_no},
         dataType: "json",
         success : function(data) {
        	 /* alert(data.detailDto.b_no); */
        	 var dto = data.detailDto;
        	 var likeCnt = data.likeCount;
        	 /* alert(dto.b_image); */
        	 /* modalContent modalLike modalDate */
        	 /* document.getElementById("modalimg").src = dto.b_image;  */
        	 $("#modalimg").attr('src', dto.b_image);
        	 $('#modalContent').val(dto.b_content);
        	 $('#modalLike').text('좋아요 ' + likeCnt.l_count);
        	 $('#modalDate').text(dto.b_date);
        	 $('#hiddenNo').val(dto.b_no); 
        	 $('#hiddenImage').val(dto.b_image); 
        	 $('#hiddenBoardImg').attr('value',dto.b_image);
        	 $('#boardNo').attr('value', b_no );
        	 $('#boardDetail').modal('show');
         },
         error : function(xhr, status, error) {
               alert("에러발생 " + error);
         }
   });
	
}
/* 내 팔로워 보기 */
function follower(m_no) {
	$('#followHead').text('팔로워');
	$('#followDiv').text('');
	 jQuery.ajax({
         type:"post",
         url:"showMyFollower",
         data: {"m_no":m_no},
         dataType: "json",
         success : function(data) {
        	 var list = data.Mylist;
        	 var m_no = data.m_no;
        	 var m_no2 = data.m_no2;
        	 var str = "";
        	 $.each(list,function(i,ss){
        		 /* alert(ss.m_email); */
        		 str += "<div class='row' style='padding-bottom: 1%;'>" +
        		 		"<div class='col-md-12'>" +
        		 		"<div class='col-md-2' style='height: 50px'>" +
        		 		"<img src='http://wbp.synology.me/profileimg/" + ss.m_image + "' alt='Responsive image' class='img-circle img-responsive' style='height: 100%; width: 100%'>" +
        		 		"</div>" +
        		 		"<div class='col-md-8'>" +
 						"<div class='row' style='cursor: default;'>" +
 						"" + ss.m_name + "" +
        		 		"</div>" +
 						"<div class='row'>" +
 						"<a href='myinfo?m_no=" + ss.f_sno + "'>" + ss.m_email + "</a>" +
 						"</div>" +
 						"</div>" +
 						"<div class='col-md-2' style='padding-top: 1%;'>";
 				if(ss.f_ms == '2' && m_no == m_no2 ){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_sno + "," + ss.f_mno +")'>팔로잉</button>";
 				}else if(ss.f_ms == '1' && m_no == m_no2){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' onclick='upFollow(" + ss.f_mno + "," + ss.f_sno + ")'>팔로우</button>"; 					
 				}else if(ss.f_ms == '1' || ss.f_ms == '2'){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_sno + "," + ss.f_mno +")'>팔로잉</button>";
 				}else if(ss.f_sno == m_no2){
 					str +=	"<button type='button' class='btn btn-default' style='width:68px'>나</button>";
 				}else{
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' onclick='upFollow(" + ss.f_mno + "," + ss.f_sno + ")'>팔로우</button>";
 				}
 				str += "</div>" +
 						"</div>" +
 		      			"</div>";
        		 
        	 })        	
        	 $('#followDiv').append(str);
        	 /* modalContent modalLike modalDate */
        	 /* document.getElementById("modalimg").src = dto.b_image;  */
        	 $('#myFollow').modal('show');
         },
         error : function(xhr, status, error) {
               alert("에러발생 " + error);
         }
   });
}

/* 내 팔로우 상태 보기 */
function follow(m_no) {
	$('#followHead').text('팔로잉');
	$('#followDiv').text('');
	 jQuery.ajax({
        type:"post",
        url:"showIFollow",
        data: {"m_no":m_no},
        dataType: "json",
        success : function(data) {
       	 var list = data.Mylist;
       	 var m_no2 = data.m_no2;
       	 var str = "";
       	 $.each(list,function(i,ss){
       		 /* alert(ss.m_email); */
       		 str += "<div class='row' style='padding-bottom: 1%;'>" +
       		 		"<div class='col-md-12'>" +
       		 		"<div class='col-md-2' style='height: 50px'>" +
       		 		"<img src='http://wbp.synology.me/profileimg/" + ss.m_image + "' alt='Responsive image' class='img-circle img-responsive' style='height: 100%; width: 100%'>" +
       		 		"</div>" +
       		 		"<div class='col-md-8'>" +
					"<div class='row' style='cursor: default;'>" +
					"" + ss.m_name + "" +
       		 		"</div>" +
					"<div class='row'>" +
					"<a href='myinfo?m_no=" + ss.f_mno + "'>" + ss.m_email + "</a>" +
					"</div>" +
					"</div>" +
					"<div class='col-md-2' style='padding-top: 1%;'>";
			if(ss.f_ms == '2' || ss.f_ms == '1'){
				str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_mno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_mno + "," + ss.f_sno +")'>팔로잉</button>";
			}else if(ss.f_mno == m_no2){
				str +=	"<button type='button' class='btn btn-default' style='width:68px'>나</button>";	
			}else{
				str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_mno + "' onclick='upFollow(" + ss.f_sno + "," + ss.f_mno + ")'>팔로우</button>";
			}	
			str +=	"</div>" +
					"</div>" +
	      			"</div>";
       		 /* rgb(168,133,239) */
       	 })        	
       	 $('#followDiv').append(str);
       	 /* modalContent modalLike modalDate */
       	 /* document.getElementById("modalimg").src = dto.b_image;  */
       	 $('#myFollow').modal('show');
        },
        error : function(xhr, status, error) {
              alert("에러발생 " + error);
        }
  });
}

/* 팔로우 하기 */
function upFollow(f_mno,f_sno) {
	/* alert(m_no + " " + f_sno); */
	var array = {"f_mno":f_mno,"f_sno":f_sno};
	jQuery.ajax({
        type:"post",
        url:"insertFollow",
        data: array,
        success : function() {
        	$("#followBtn"+f_sno).attr('onclick','cancelFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_sno).attr('style','background-color: #70c050; color: white;');
        	$("#followBtn"+f_sno).text('팔로잉');
        },
        error : function(xhr, status, error) {
              alert("에러발생 insert" + error + "" + status );
        }
	}); 
}

/*  */
function up2Follow(m_no,f_sno) {
	/* alert(m_no + " " + f_sno); */
	
	$("#follow").attr('onclick','cancelFollow('+ m_no + ',' + f_sno +')');
	$("#follow").attr('style','background-color: #70c050; color: white;');
	$("#follow").attr('value','팔로잉');
	var array = {"f_mno":m_no,"f_sno":f_sno};
	
	jQuery.ajax({
        type:"post",
        url:"insertFollow",
        data: array,
        success : function() {
       		alert('성공');
        },
        error : function(xhr, status, error) {
              alert("에러발생 " + error);
        }
	}); 
}

/* 팔로우 취소 */
function cancelFollow(f_mno,f_sno) {
	/* alert(f_mno + " " + f_sno); */
	var array = {"f_mno":f_sno,"f_sno":f_mno};
	jQuery.ajax({
        type:"post",
        url:"followCancel",
        data: array,
        success : function() {
        	$("#followBtn"+f_mno).attr('onclick','upFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_mno).attr('style','background-color: white; color: black;');
        	$("#followBtn"+f_mno).text('팔로우');
        },
        error : function(xhr, status, error) {
              alert("에러발생 " + error);
        }
	}); 
	/* $("#followBtn"+f_mno).attr('onclick','upFollow('+ m_no + ',' + f_mno +')');
	$("#followBtn"+f_mno).attr('style','background-color: white; color: black;'); */
}

/* 마우스 아웃 hover hide처리  */
function hoverHide(b_no) {
	$('#showHover'+b_no).hide();
}

/* 마우스 오버 hover show 처리. ajax 한번호출. */
function hoverShow(b_no) {
	var showh = $("#showHover"+b_no);
	var tagA = $("#tagA"+b_no);
	/* tagA.removeAttr('onmouseover'); */
	
	showh.attr('style','background-color: rgba(0,0,0,.3); bottom: 0; -webkit-box-pack: center; justify-content: center; right: 0; left: 0;position: absolute; top: 0;');
	if(tagA.attr('class') == 'hover'){
		tagA.attr('class','');
		jQuery.ajax({
			 type:"post",
		     url:"rlCount",
		     data: {'b_no':b_no},
		     dataType: 'json',
		     success : function(data) {
		      	var like = data.likeCount;
		      	var reply = data.replyCount;
				var str = "";
				str += "<ul style='display: flex; font-size: 16px;font-weight: 600; color: #fff; list-style: none; justify-content: center; margin: 0; padding: 0; border: 0; font: inherit; padding-top: 32%;' class='' >" +
						"<li style='line-height: 19px; padding-left: 20%; font-size: 18px; margin: 0 auto; position: relative; display: table;' class='text-right'><span class='glyphicon glyphicon-heart' aria-hidden='true'></span>&nbsp;&nbsp;" + like + "</li>" +
						"<li style='line-height: 19px; padding-right: 20%; margin: 0 auto; font-size: 18px; position: relative; display: table;'><span class='glyphicon glyphicon-comment' aria-hidden='true'></span>&nbsp;&nbsp;" + reply +  "</li>" +
						"</ul>";
				showh.append(str);
		     },
		     error : function(xhr, status, error) {
		   	    alert("에러발생 " + error);
		     }
		});
	}
	
}

/* 내 게시물 삭제 */
function boardDelete() {
	$('#boardDeleteOk').modal('show');
}

/* 삭제 확인 */

function boardDeleteOk(b_no) {
	$('#deleteFrm').submit();
}
</script>
    
</head>
<%@include file="top.jsp"%>
<body>
<!-- =======================================각종 모달======================================= -->
<!-- 프로필 수정 모달 -->	
	<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 150px auto;">
	    <div class="modal-content">
	     <form action="updateInfo" id="infofrm" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	      
	     
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
				<div style="color: buttontext; border: 0; cursor: pointer; height: 170px; padding: 0; width: 100%;">
					<a  onclick="$('#file').click();">
					<img id="image" src="http://wbp.synology.me/profileimg/${myinfo.m_image}" alt="Responsive image" class="img-circle img-responsive" style="height: 100%; width: 100%">
					</a>
	      			<input type="file" id="file"  name="fileUp" class="sr-only">
	      			<input type="hidden" name="hiddenName" value="${myinfo.m_image}"> 
				</div>
				</div>
			</div>
	     </div>
	      	<div class="modal-body">
			
				<input type="hidden" name="m_no" value="${myinfo.m_no}">
				<div class="row">
					<div class="col-md-12">
						<label for="Email1">E-mail</label>
						<input type="email" class="form-control" id="Email1" name="m_email" value="${myinfo.m_email}" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="name">이름</label>
						<input type="text" class="form-control" name="m_name" id="name" value="${myinfo.m_name }" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="inputOldPassword" class="">현재 비밀번호</label> 
						<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Password" required>
						<input type="hidden" id="password" value="${myinfo.m_password}">				
					</div>
				</div>
				<div class="row form-group">
						<div class="col-md-2">
							
						</div>
						<div class="col-md-4 top_pd text-right">
							<c:set var="date" value="${myinfo.m_bdate}"/>
							<label class="">년도</label>
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value="${toDay}" var = "viewYear" pattern="yyyy" />
							<select class="form-control" name="year">
								<c:forEach var="i" begin="0" end ="100" step="1">
								<c:if test="${fn:substring(date,0,4) == (viewYear -i)}">
								<option selected="selected">${viewYear -i }</option>
								</c:if>
								<c:if test="${fn:substring(date,0,4) != (viewYear -i)}">
								<option>${viewYear -i }</option>
								</c:if>
								</c:forEach>

							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="">월</label> 
							<select class="form-control" name="month">
								<c:forEach var="i" begin="1" end ="12" step="1">
								<c:if test="${fn:substring(date,5,7) == i}">
								<option selected="selected">${i}</option>								
								</c:if>
								<c:if test="${fn:substring(date,5,7) != i}">
								<option>${i}</option>
								</c:if>
								</c:forEach>
							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="" for="ss">일</label> 
							<select id="ss" name="day"
								class="form-control" >
								<c:forEach var="i" begin="1" end ="31" step="1">
								<c:if test="${fn:substring(date,8,10) == i}">
								<option selected="selected">${i}</option>
								</c:if>
								<c:if test="${fn:substring(date,8,10) != i}">
								<option>${i}</option>
								</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class=" col-md-12">
						<textarea class="form-control" rows="3" placeholder="자신의 소개말을 입력해주세요." name="m_introduce">${myinfo.m_introduce }</textarea>
						</div>
					</div> 
		
	      	</div>
	    	<div class="modal-footer">	    	
	    	<button class="btn btn-primary" id="infoSubmit" type="button">Save changes</button>	    	
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			</form>
	    </div>	    
	  </div>	  	
	</div>
	<!-- 프로필 수정 모달  끝-->
	<!-- 비밀번호 모달 팝업 -->
	<div class="modal fade " id="passwordErr" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="row text-center">
	      	비밀번호가 틀립니다.
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비밀번호 모달 팝업 끝-->
	
	
	<!-- 기념일 추가 모달  insertAnni-->
<%-- 	
	<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 150px auto;">
	    <div class="modal-content">
	     <form action="updateInfo" id="infofrm" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	      
	     
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
								</div>
			
	     </div>
	      	<div class="modal-body">
			
				<input type="hidden" name="m_no" value="${myinfo.m_no}">
				<div class="row">
					<div class="col-md-12">
						<label for="a_detail">이벤트 이름</label>
						<input type="text" class="form-control" id="a_detail" name="a_detail" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="a_date">날짜</label>
						<input type="text" class="form-control" name="a_date" id="a_date"  required>
					</div>
				</div>
			
			
					
		
	    	<div class="modal-footer">	    	
	    	<button class="btn btn-primary" id="eventSubmit" type="button">Save changes</button>	    	
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			</form>
	    </div>	    
	  </div>	  	
	</div> --%>
	
	<!-- 기념일 추가 모달  insertAnni끝-->

            
    <!-- MAIN CONTENT -->
        <div class="pg-opt">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>User account</h2>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>                       
                        <li class="active">User account</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <section class="slice bg-white">
        <div class="wp-section user-account">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="user-profile-img">
                            	<c:choose>
									<c:when test="${mno == myinfo.m_no }">
									<a style="color: buttontext; border: 0; cursor: pointer; height: 100%; padding: 0; width: 100%;" data-toggle="modal" data-target="#updateInfo">		
										<img src="http://wbp.synology.me/profileimg/${myinfo.m_image }" class="img-responsive" style="height: 100%; width: 100%">
									</a>
									</c:when>
									<c:otherwise>
										<img src="http://wbp.synology.me/profileimg/${myinfo.m_image }" class="img-responsive" style="height: 100%; width: 100%">
									</c:otherwise>
								</c:choose>
                        </div>
                        <ul class="categories mt-20 tabs-framed">
                            <li><a href="#tab-1" data-toggle="tab">내 계정 정보</a></li>
                            <li><a href="#tab-2" data-toggle="tab">내 기념일 관리</a></li>
                            <li><a href="#">My orders</a></li>
                            <li><a href="#tab-3" data-toggle="tab">Wishlist</a></li>
                        </ul>
                    </div>
                    <div class="col-md-9">                     
                        <div class="tabs-framed">
                            <ul class="tabs clearfix">
                                <li class="active"><a href="#tab-1" data-toggle="tab">내 정보보기</a></li>
                                <li><a href="#tab-2" data-toggle="tab">내 기념일 관리</a></li>
                                <li><a href="#tab-3" data-toggle="tab">Whishlist</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab-1">
                                    <div class="tab-body">
                                        <dl class="dl-horizontal style-2">
                                            <h3 class="title title-lg">Personal information</h3>
                                            <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                                            
                                           <dt>Name</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_name}</span> 
                                    </dd>
                                    <hr>
                                    <dt>Email</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_email}</span>
                                    </dd>
                                    <hr>
                                    <dt>BirthDay</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_bdate}</span>
                                    </dd>
                                    <hr>
                                    <dt>Introduce</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_introduce}</span>
                                    </dd>
                                    <hr>
                                    <dd>
                                       <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right" data-toggle="modal" data-target="#updateInfo"><span>프로필 수정</span></a>                                       
                                    </dd>
                                 </dl>
                              </div>
                           </div>

                               <!-- ==========================================================내 이벤트 추가 수정탭=================================================================== -->

									<div class="tab-pane fade" id="tab-2">
										<div class="tab-body" style="padding-bottom: 0;">
											<h3 class="title title-lg">나의 이벤트</h3>
											<p class="mb-20">내 이벤트를 추가/수정하여 친구들에게 알려주세요!</p>

											<table
												class="table table-orders table-bordered table-striped table-responsive no-margin">
												<tbody>
													<tr>
														<th>이벤트 명</th>
														<th>날자</th>
														<th>수정/삭제</th>														
													</tr>
													<c:forEach var="anni" items="${showAnni}">
													<c:if test="${anni.a_mno == mno}">
													<tr>
														<td><a href="#">${anni.a_detail }</a></td>
														<td>${anni.a_date }</td>
														<td><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i> / <i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></td>														
													</tr>
													</c:if>
													</c:forEach>
													<%--<c:otherwise>
													<tr>
														<td colspan="3">등록하신 기념일이 없군요. 추가하기를 누르신후 추가해주세요!</td>
													</tr>
													</c:otherwise> --%>
												</tbody>
											</table>
											<a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right" data-toggle="modal" data-target="#insertAnni"><span>기념일 추가</span></a>
											<br>
										</div>
									</div>

                                <div class="tab-pane fade" id="tab-3">
                                    <div class="tab-body">
                                        <h3 class="title title-lg">My wishlist</h3>
                                        <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>

                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Product list -->
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
                    2014 Â© Web Pixels. All rights reserved.
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

<!-- Essentials -->
<script src="resources/js/modernizr.custom.js"></script>
<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="resources/js/jquery.easing.js"></script>
<script src="resources/js/jquery.metadata.js"></script>
<script src="resources/js/jquery.hoverup.js"></script>
<script src="resources/js/jquery.hoverdir.js"></script>
<script src="resources/js/jquery.stellar.js"></script>

<!-- Boomerang mobile nav - Optional  -->
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script>

<!-- Forms -->
<script src="resources/assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script> 
<script src="resources/assets/ui-kit/js/cusel.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.form.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.validate.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.maskedinput.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.modal.js"></script>

<!-- Assets -->
<script src="resources/assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script src="resources/assets/page-scroller/jquery.ui.totop.min.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.init.js"></script>
<script src="resources/assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script src="resources/assets/waypoints/waypoints.min.js"></script>
<script src="resources/assets/milestone-counter/jquery.countTo.js"></script>
<script src="resources/assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
<script src="resources/assets/social-buttons/js/rrssb.min.js"></script>
<script src="resources/assets/nouislider/js/jquery.nouislider.min.js"></script>
<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
<script src="resources/assets/bootstrap/js/tooltip.js"></script>
<script src="resources/assets/bootstrap/js/popover.js"></script>

<!-- Sripts for individual pages, depending on what plug-ins are used -->

<!-- Boomerang App JS -->
<script src="resources/js/wp.app.js"></script>
<!--[if lt IE 9]>
    <script src="resources/js/html5shiv.js"></script>
    <script src="resources/js/respond.min.js"></script>
<![endif]-->

<!-- Temp -- You can remove this once you started to work on your project -->
<script src="resources/js/jquery.cookie.js"></script>
<script src="resources/js/wp.switcher.js"></script>
<script type="text/javascript" src="resources/js/wp.ga.js"></script>
<script>
/* 프로필 수정 이미지 미리보기 */
var upload = document.getElementById('file'),
 	image = document.getElementById('image');
upload.onchange = function (e) {
  e.preventDefault();
  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    image.src = event.target.result;
  };
  reader.readAsDataURL(file);
};
/* 게시물 수정 이미지 미리보기 */
/*  
var boardFile = document.getElementById('boardFile'),
	modalimg = document.getElementById('modalimg');
boardFile.onchange = function (e) {
  e.preventDefault();
  var file2 = boardFile.files[0],
      reader2 = new FileReader();
  reader2.onload = function (event) {
	  modalimg.src = event.target.result;
  };
  reader2.readAsDataURL(file2);
}; */
/* 게시물 쓰기 이미지 미리보기 */
/* var boardInsertFile = document.getElementById('boardInsertFile'),
	boardInsertImg = document.getElementById('boardInsertImg');
boardInsertFile.onchange = function (e) {
  e.preventDefault();
  var file3 = boardInsertFile.files[0],
      reader3 = new FileReader();
  reader3.onload = function (event) {
	  boardInsertImg.src = event.target.result;
  };
  reader3.readAsDataURL(file3);
  //$('#insertBtag').text('');
  $('#boardInsertImg').show();
}; */
</script>

</body>
</html>