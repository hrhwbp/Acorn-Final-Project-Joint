<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RE:MIND || 게시물</title>
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->

<!-- ===============================템플릿 용 설정====================================== -->

<!-- Essential styles -->
<!-- <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen">  -->
<link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="resources/assets/fancybox/jquery.fancybox.css?v=2.1.5" media="screen">

<!-- Boomerang styles -->
<!-- <link id="wpStylesheet" type="text/css" href="css/global-style.css" rel="stylesheet" media="screen"> -->
<link id="wpStylesheet" type="text/css" href="resources/css/global-style-red.css" rel="stylesheet" media="screen">

<!-- Favicon -->
<!-- <link href="images/favicon.png" rel="icon" type="image/png"> -->
<link href="resources/images/favicon.png" rel="icon" type="image/png">

<!-- Assets -->
<!-- <link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="assets/sky-forms/css/sky-forms.css"> -->

<link rel="stylesheet" href="resources/assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/owl-carousel/owl.theme.css">
<link rel="stylesheet" href="resources/assets/sky-forms/css/sky-forms.css">
<!--[if lt IE 9]>
        <link rel="stylesheet" href="assets/sky-forms/css/sky-forms-ie8.css">
    <![endif]-->

<!-- Required JS -->
<!-- <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.min.js"></script> -->

<!-- Page scripts -->

<!-- Video JS -->
<!-- <link href="assets/timeline/timeline.css" rel="stylesheet"> -->
<link href="resources/assets/timeline/timeline.css" rel="stylesheet">

<!-- ===============================템플릿 용 설정 끝====================================== -->
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
    padding-top: 75%;  /* 1:1 ratio */
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

.thumbnail img.landscape {
  width: auto;
  max-width: none;
  height: 100%;
}

} 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- <script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.min.js"></script> -->

<script type="text/javascript">
$(document).ready(function() {
	$('#updateSubmit').click(function() {
		$('#boardUpdatefrm').submit()
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
	})
})

/* 내 게시물 자세히 보기 */
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
        	 var reply = data.reply;
        	 var date = dto.b_date.substring(0,16);
        	 var likeYN = data.likeYN;
        	 /* alert(dto.b_image); */
        	 /* modalContent modalLike modalDate */
        	 /* document.getElementById("modalimg").src = dto.b_image;  */
        	 $("#modalimg").attr('src', dto.b_image);
        	 $('#modalContent').val(dto.b_content);
        	 $('#modalLike').text('좋아요 ' + likeCnt.l_count + '개');
        	 
        	 $('#modalDate').text(date);
        	 $('#hiddenNo').val(dto.b_no); 
        	 $('#hiddenImage').val(dto.b_image); 
        	 $('#hiddenBoardImg').attr('value',dto.b_image);
        	 $('#boardNo').attr('value', b_no );
        	 $('#replyHiddenBno').attr('value', b_no );
        	 $('#boardReplyModal').text('');
        	 if(reply == ""){
        		 $('#boardReplyModal').append("<div>등록된 댓글이 없습니다.</div>");
        	 }
        	 
        	 $.each(reply,function(i,ss){
        		 var str = "";
	        	 str = "<a href='friendinfo?m_no=" + ss.r_mno + "'>" + ss.r_name + "</a>&nbsp;" + ss.r_content + "<br>";
	        	 $('#boardReplyModal').append(str);
        	 });
        	 
        	 if(likeYN == 0){
        	 	$("#likeYN").attr("onclick","likesubmit(" + dto.b_no + ")");        		 
        	 	$("#likeYN").attr("style","cursor:pointer");        		 
        	 }else{
        	 	$("#likeYN").attr("onclick","likecancel(" + dto.b_no + ")");        		         		 
        	 	$("#likeYN").attr("style","cursor:pointer;color:red;");        		 
        	 }
	       	 $("#boardReplyModal").scrollTop($("#boardReplyModal")[0].scrollHeight);
        	 $('#boardDetail').modal('show');
         },
         error : function(xhr, status, error) {
               alert("에러발생 " + error);
         }
   });
	
}

/* 게시물 답글 달기 */
function replySubmit() {
	var b_no = $("#replyHiddenBno").val();
	var m_no = $("#replyHiddenMno").val();
	var r_content = $("#r_content").val();
	var array = {"r_bno":b_no, "r_mno":m_no, "r_content":r_content}
	$.ajax({
		type:"post",
		url:"insertReply",
		data: array,
		dataType:'json',
		success:function(replyData){
			var str = ""
			var list = replyData.datas;
			var count = replyData.count;
			$('#boardReplyModal').text('');
			jQuery(list).each(function(index, objArr){		
			str = "<a href='#'>" + objArr.r_name + "</a>&nbsp;" + objArr.r_content + "<br>";				
			$('#boardReplyModal').append(str);
			})
			$("#r_content").val("");
		}
	
	});
}


/* 게시물 좋아요 하기 */
function likesubmit(b_no){
	jQuery.ajax({
	type:"post",
	url:"insertLike",
	data:{"l_bno":b_no, "l_mno":"${mno}"},
	dataType:'json',
	success:function(likeData){
		var list = likeData.datas;
		var count = likeData.likecount;
		$('#modalLike').text('좋아요 ' + count + '개');
		jQuery("#likeYN").attr({style:'color: red'});
		jQuery("#likeYN").attr({onclick:'likecancel('+b_no+')'});
		}
	});

}

/* 게시물 좋아요 취소 */
function likecancel(b_no){
	jQuery.ajax({
	type:"post",
	url:"cancelLike",
	data:{"l_bno":b_no, "l_mno":"${mno}"},
	dataType:'json',
	success:function(likeData){
		var list = likeData.datas;
		var count = likeData.likecount;
		$('#modalLike').text('좋아요 ' + count + '개');
		jQuery("#likeYN").removeAttr("style");
		jQuery("#likeYN").attr({onclick:'likesubmit('+b_no+')'});
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
 						"<a href='friendinfo?m_no=" + ss.f_sno + "'>" + ss.m_email + "</a>" +
 						"</div>" +
 						"</div>" +
 						"<div class='col-md-2' style='padding-top: 1%;'>";
 				if(ss.f_ms == '2' && m_no == m_no2 ){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_sno + "," + ss.f_mno +")'>팔로잉</button>";
 				}else if(ss.f_ms == '1' && m_no == m_no2){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: rgb(255, 247, 252);' onclick='upFollow(" + ss.f_mno + "," + ss.f_sno + ")'>팔로우</button>"; 					
 				}else if(ss.f_ms == '1' || ss.f_ms == '2'){
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_sno + "," + ss.f_mno +")'>팔로잉</button>";
 				}else if(ss.f_sno == m_no2){
 					str +=	"<button type='button' class='btn btn-default' style='width:68px; background-color: rgb(255, 247, 252);'>나</button>";
 				}else{
 					str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_sno + "' style='background-color: rgb(255, 247, 252);' onclick='upFollow(" + ss.f_mno + "," + ss.f_sno + ")'>팔로우</button>";
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
					"<a href='friendinfo?m_no=" + ss.f_mno + "'>" + ss.m_email + "</a>" +
					"</div>" +
					"</div>" +
					"<div class='col-md-2' style='padding-top: 1%;'>";
			if(ss.f_ms == '2' || ss.f_ms == '1'){
				str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_mno + "' style='background-color: #70c050; color: white;' onclick='cancelFollow("+ ss.f_mno + "," + ss.f_sno +")'>팔로잉</button>";
			}else if(ss.f_mno == m_no2){
				str +=	"<button type='button' class='btn btn-default' style='width:68px; background-color: rgb(255, 247, 252);'>나</button>";	
			}else{
				str +=	"<button type='button' class='btn btn-default' id='followBtn" + ss.f_mno + "' style='background-color: rgb(255, 247, 252);' onclick='upFollow(" + ss.f_sno + "," + ss.f_mno + ")'>팔로우</button>";
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

/* 모달용 팔로우 하기 */
function upFollow(f_mno,f_sno) {
	/* alert(m_no + " " + f_sno); */
	var array = {"f_mno":f_mno,"f_sno":f_sno};
	jQuery.ajax({
        type:"post",
        url:"insertFollow",
        data: array,
        success : function() {
        	/* 모달용 팔로우 하기 */
        	$("#followBtn"+f_sno).attr('onclick','cancelFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_sno).attr('style','background-color: #70c050; color: white;');
        	$("#followBtn"+f_sno).text('팔로잉');
        },
        error : function(xhr, status, error) {
              alert("에러발생 insert" + error + "" + status );
        }
	}); 
}

/* 모달용 팔로우 취소 */
function cancelFollow(f_mno,f_sno) {
	/* alert(f_mno + " " + f_sno); */
	var array = {"f_mno":f_sno,"f_sno":f_mno};
	jQuery.ajax({
        type:"post",
        url:"followCancel",
        data: array,
        success : function() {
        	/* 모달용 팔로우 취소 */
        	$("#followBtn"+f_mno).attr('onclick','upFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_mno).attr('style','background-color: rgb(255, 247, 252); color: black;');
        	$("#followBtn"+f_mno).text('팔로우');
        },
        error : function(xhr, status, error) {
              alert("에러발생 " + error);
        }
	}); 
	/* $("#followBtn"+f_mno).attr('onclick','upFollow('+ m_no + ',' + f_mno +')');
	$("#followBtn"+f_mno).attr('style','background-color: white; color: black;'); */
}

/* 친구 정보에서 팔로우 하기 */
function upFollow2(f_mno,f_sno) {
	/* alert(m_no + " " + f_sno); */
	var array = {"f_mno":f_mno,"f_sno":f_sno};
	jQuery.ajax({
        type:"post",
        url:"insertFollow",
        data: array,
        success : function() {
        	/* 친구 정보에서 팔로우 하기 */
        	$("#followBtn"+f_mno).attr('onclick','cancelFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_mno).attr('style','background-color: #70c050; color: white;');
        	$("#followBtn"+f_mno).text('팔로잉');
        },
        error : function(xhr, status, error) {
              alert("에러발생 insert" + error + "" + status );
        }
	}); 
}

/* 친구 정보에서 팔로우 취소 */
function cancelFollow2(f_mno,f_sno) {
	/* alert(f_mno + " " + f_sno); */
	var array = {"f_mno":f_sno,"f_sno":f_mno};
	jQuery.ajax({
        type:"post",
        url:"followCancel",
        data: array,
        success : function() {
        	/* 친구 정보에서 팔로우 취소 */
        	$("#followBtn"+f_sno).attr('onclick','upFollow('+ f_sno + ',' + f_mno +')');
        	$("#followBtn"+f_sno).attr('style','background-color: white; color: black;');
        	$("#followBtn"+f_sno).text('팔로우');
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

<%@ include file="top.jsp" %>

<body style="background-color: rgba(128, 206, 208, 0.14);">
		<!-- ==========================현재 페이지 표시줄 MAIN CONTENT============================= -->
		<div class="pg-opt bg-danger">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2>Wall</h2>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li><a href="action">Home</a></li>							
							<li class="active">Wall</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<!-- ==========================현재 페이지 표시줄 MAIN CONTENT 끝============================= -->

<div class="container">
<div class="container"  style="padding-top: 2%; padding-bottom: 5%;">
<div class="row" style="background-color: rgba(255, 247, 252, 0.62); padding-top: 30px; padding-bottom: 30px">
	<div class="col-md-2 col-md-offset-2 col-sm-8" style="height: 165px">	
		<img src="http://wbp.synology.me/profileimg/${myinfo.m_image }" class="img-circle img-responsive" style="height: 100%; width: 100%">
	</div>
	<div class="col-md-6" style="padding-top: 1%;">
		<div class="row">
		<div class="col-md-12">
			<div class="col-md-6">
				<blockquote>
				  <p>${myinfo.m_name}</p>
				</blockquote>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<c:choose>
				<c:when test="${mno == myinfo.m_no }">
				
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${follow == false}">
						<button type="button" id="followBtn${mno}" class="btn btn-default col-md-12" onclick="upFollow2(${mno},${myinfo.m_no })">팔로우</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-default col-md-12" id="followBtn${mno}" style='background-color: #70c050; color: white;' onclick="cancelFollow2(${myinfo.m_no},${mno})">팔로잉</button>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
				</c:choose>
			</div>		
		</div>
		</div>
		<div class="row">			
			<button type="button" class="btn btn-link col-md-3" style="color: black; background-color:#e4d3c4;" disabled="disabled"><b>게시물  ${fn:length(board)}개</b></button> 
			<button type="button" class="btn btn-link col-md-3" style="background-color: rgba(229, 212, 200, 0.63)" onclick="follower(${myinfo.m_no})"><b>팔로워 ${fn:length(mylist)}</b></button>
			<button type="button" class="btn btn-link col-md-3" style="background-color: rgba(229, 212, 200, 0.63);" onclick="follow(${myinfo.m_no})"><b>팔로우 ${fn:length(ilist)}</b></button>
			<button type="button" class="btn btn-link col-md-3" style="background-color: rgba(229, 212, 200, 0.63);"><b>위시리스트</b></button>
		</div>
		<div class="row" style="padding-top: 2%">
			<div class="col-md-1">
				<span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="size: 100%"></span>
			</div>
 			<c:choose>
			<c:when test="${myinfo.m_introduce == null || myinfo.m_introduce == ''}">
				<div class="col-md-10">
					아직 소개말이 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-md-10">
					${myinfo.m_introduce}
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<c:if test="${mno == myinfo.m_no }">
<div class="row" style="padding-bottom: 2%; background-color: rgba(255, 247, 252, 0.62);">
	<div class="col-md-10 col-md-offset-1">
			<button type="button" id="boardInsertBtn" class="btn btn-link col-md-12" style="background-color: rgba(224, 208, 194, 0.58); border-radius: 20px;"><h4><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;게시물 추가하기</h4></button>
	</div>
</div>
</c:if>
<div class="row" style="background-color: rgba(255, 247, 252, 0.62);"><!-- row  -->
	<c:choose>
	<c:when test="${fn:length(board) == 0}">
	<div class="col-md-12">
	    	<div class="col-md-6"  >
	    		<div class="thumbnail-wrapper" >
	    			<div class="thumbnail" style="height: 400px; background-color: #000;">
	        			<div class="centered">
			  				 <img src="resources/image/exexex.png" class=" landscape"> 
				   		</div>
				   </div>
			   </div>
	    	</div>
	    	<div class="col-md-6 text-center" style="height:400px; background-color: rgba(255, 247, 252, 0.62);">
	    		
	    		
	    		<h4 style="padding-top: 100px"><b>아직 게시물이 없습니다.</b></h4>
	    		<br>
	    		<p>게시물을 등록 하시려면<br>
	    		게시물 추가하기 버튼을 누르시거나<br>
	    		<b><span class="glyphicon glyphicon-gift" aria-hidden="true">RE:MIND</span></b> 앱을 다운받으시기 바랍니다.<br><br>
	    		<b>앱 다운 받으러 가기</b><br>
	    		<button type="button" class="btn btn-link col-md-3 col-md-offset-3" style=""><img src="resources/image/google.jpg" style="max-width: 100%"></button>
	    		<button type="button" class="btn btn-link col-md-3"><img src="resources/image/Apple.png" style="max-width: 100%"></button>
	    		
	    		</p>
	    	</div>
	</div>	
	</c:when>
	<c:otherwise>
	<div class="col-md-12">
	  <c:forEach var="board" items="${board}">  
	    	<div class="col-md-4"  >
	    		<div class="thumbnail-wrapper" >
	    			<div class="thumbnail" style="height: 250px; background-color: #000;">
	    				<a class="hover" href="javascript:modalToggle(${board.b_no})" id="tagA${board.b_no}" onmouseover="hoverShow(${board.b_no})" onmouseout="hoverHide(${board.b_no})" >
	        			<div class="centered">
			  				 <img src="${board.b_image }" class=" landscape"> <!-- portrait -->
				   		</div>
				    	<div id="showHover${board.b_no}" style="display: none">
				    		
				    	</div>
	    				</a>
				   </div>
			   </div>
	    	</div>
	  </c:forEach>
	</div>	
	</c:otherwise>
	</c:choose>
</div> <!-- row -->
</div>






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
					<%-- <div class="row">
						<div class=" col-md-12">
						<textarea class="form-control" rows="3" placeholder="자신의 소개말을 입력해주세요." name="m_introduce">${myinfo.m_introduce }</textarea>
						</div>
					</div> --%>
		
	      	</div>
	    	<div class="modal-footer">
	    	
	    	<button class="btn btn-primary" id="infoSubmit" type="button">Save changes</button>
	    	
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
				
			</form>
	    </div>
	    
	  </div>
	  	
	</div>
	<!-- 게시물 수정, 보기 모달 -->

	<div class="modal fade" id="boardDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="">
	  <div class="modal-dialog" style="margin: 180px auto; width: 50%">
	    <div class="modal-content">
	     <form id="boardUpdatefrm" action="updateBoard" method="post" enctype="multipart/form-data">
	      <div class="modal-body">
			<div class="row">
				<div class="col-md-8">
				<c:choose>
					<c:when test="${mno == myinfo.m_no }">
			    		<div class="thumbnail-wrapper" >
			    			<div class="thumbnail" style="height: 450px; background-color: #000; margin-bottom: 0;">
			        			<div class="centered">
									<a  onclick="$('#boardFile').click();" style="cursor: pointer">
									<img alt="Responsive image" id="modalimg" class="landscape" src="" >
									</a>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
					<div class="thumbnail-wrapper" >
		    			<div class="thumbnail" style="height: 480px; background-color: #000; margin-bottom: 0;">
		        			<div class="centered">
								<img alt="Responsive image" id="modalimg" class="landscape" src="" >
							</div>
						</div>
					</div>
					</c:otherwise>
					
					</c:choose>
					<input type="file" name="fileUpload"  id="boardFile" class="sr-only" >
					<input type="hidden" name="hiddenBoardImg" value="" id="hiddenBoardImg">
				</div>
				<div class="col-md-4">
				<c:choose>
				<c:when test="${mno == myinfo.m_no }">
					<!--  -->
					
				    <div class="input-group">
				      <input name="b_content" id="modalContent" type="text" class="form-control" value="">
				      <div class="input-group-btn">
				        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-option-vertical"></span></button>
				        <ul class="dropdown-menu dropdown-menu-right" role="menu">
				          <li><a href="#" id="updateSubmit">수정내역 저장</a></li>
				          <!-- <li class="divider"></li> -->
				          <li><a style="color: red" href="javascript:boardDelete()">게시물 삭제</a></li>
				        </ul>
				      </div><!-- /btn-group -->
				    </div><!-- /input-group -->
				  
					<!--  -->				
				</c:when>
				<c:otherwise>
				<!--  -->
					
				    <div class="input-group">
				      <input name="b_content" id="modalContent" type="text" class="form-control" value="" readonly="readonly">
				      <div class="input-group-btn">
				        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="glyphicon glyphicon-option-vertical"></span></button>
				        <ul class="dropdown-menu dropdown-menu-right" role="menu">
				          <li><a href="#">게시물 신고하기</a></li>
				        </ul>
				      </div><!-- /btn-group -->
				    </div><!-- /input-group -->
				  
					<!--  -->		
				</c:otherwise>
				</c:choose>
				</div>
				
				<p class="col-md-2" id="modalLike" style="padding-top: 1%"></p><p id="modalDate" style="padding-top: 1%" class="text-right col-md-2"></p>
				<div class="col-md-4">
		     		<div class="" style="background-color: 0; height: 340px; overflow-y: scroll;" id="boardReplyModal">
		     		
		     		</div>
				</div>
		     	<div class="col-md-4">
		     	<div class="input-group " style="padding-top: 1%">
		     		<span class="input-group-addon " id="sizing-addon2">
		     		
		     			<span class="glyphicon glyphicon-heart" onclick="" style="cursor: pointer;" id="likeYN"></span>
		     			
		     		</span>
		     		
		      		<input type="text" class="form-control" placeholder="답글달기..." onkeydown="if (event.keyCode==13){ replySubmit();event.returnValue=false}" aria-describedby="sizing-addon2" name="r_content" id="r_content"> 
					<input type="hidden" name="r_bno" value="" id="replyHiddenBno"> 
					<input type="hidden" name="r_mno" value="${mno}" id="replyHiddenMno"> 
													<!-- 답글 버튼 --> 
					<span class="input-group-btn ">
						<button class="btn btn-default" type="button" id="btn_reply" onclick="replySubmit()">답글</button>
					</span> 		     	
		     	</div>
		     	</div>
			</div>
	      </div>
	      <input type="hidden" value="" id="hiddenNo" name="b_no" class="sr-only">
	      <input type="hidden" value="" id="hiddenImage" name="b_image" class="sr-only">
	     </form>	      
	    </div>
	  </div>
	</div>

		<!-- 새 게시물 모달 -->

	<div class="modal fade" id="boardInsert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 180px auto">
	    <div class="modal-content">
	     <form id="boardInsertfrm" action="insertBoard" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
			
			<div class="row">
				<div class="col-md-12 text-center" style="">
					<a  onclick="$('#boardInsertFile').click();" style="cursor: pointer; padding-top: 40%" >
					<b id="insertBtag"><i class="fa fa-picture-o" aria-hidden="true"></i>클릭해서 이미지 추가</b>
					<img alt="Responsive image" id="boardInsertImg" class="img-responsive center-block" src="" style="">
					</a>
					<input type="file" name="fileUpload" id="boardInsertFile" class="sr-only">
				</div>
			</div>
	      </div>
	      <div class="modal-body">
	     
	 
	      <div class="row">	      
			<h3 class="col-md-12"><input name="b_content" id="modalInsertContent" type="text" class="form-control" placeholder="게시글 내용은 제목으로 보여 집니다."></h3>
			<input type="hidden" value="${myinfo.m_no}" name="b_mno">
	      </div>
	      </div>
	     </form>
	      <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button id="boardInsertSubmit" type="button" class="btn btn-primary" >Save changes</button>
	      </div>
	      
	    </div>
	  </div>
	</div>

			<!-- 팔로우 모달 -->

	<div class="modal" id="myFollow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 180px auto; ">
	    <div class="modal-content">
	     <form id="boardInsertfrm" action="insertBoard" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
			<div class="row">
				<div class="col-md-12 text-center" id="followHead">
					<h3 id="followHead"></h3>
				</div>
			</div>
	      </div>
	      <div class="modal-body" id="followDiv" style="max-height: 400px; overflow-y: scroll; ">
		      
	      </div>
	     </form>
	      
	    </div>
	  </div>
	</div>

	<!-- 새 게시글 이미지 없음 -->
	<div class="modal fade " id="boardInsertErr" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 260px auto;">
	    <div class="modal-content">
	      <div class="row text-center">
	      	이미지를 선택해주세요.
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="boardDeleteOk" tabindex="-1" role="dialog" aria-labelledby="">
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="row text-center">
	      	<p style="padding-top: 2%"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="color: red;  font-size: 25px;"></span></p>
	      	<h5>
	      	<b>정말 삭제 하시겠습니까?</b>
	      	</h5>
	      </div>
	    </div>
	    
	     <div class="modal-footer">
	     	<div class="row text-center">
			<button type="button" class="btn btn-danger" id="boardDelOk" onclick="boardDeleteOk()">Delete</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	     	</div>
	      </div>
	    	<form action="boardDelete" method="post" id="deleteFrm">
	    		<input type="hidden" id="boardNo" name="b_no" value="">
	    	</form>
	  </div>
	</div>
</div> <!-- container -->
    <!-- FOOTER -->
<div>
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


<script>
/* 게시물 수정 이미지 미리보기 */
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
};
/* 게시물 쓰기 이미지 미리보기 */
var boardInsertFile = document.getElementById('boardInsertFile'),
	boardInsertImg = document.getElementById('boardInsertImg');
boardInsertFile.onchange = function (e) {
  e.preventDefault();
  var file3 = boardInsertFile.files[0],
      reader3 = new FileReader();
  reader3.onload = function (event) {
	  boardInsertImg.src = event.target.result;
  };
  reader3.readAsDataURL(file3);
  /* $('#insertBtag').text(''); */
  $('#boardInsertImg').show();
};
</script>

</body>
<%-- <%@ include file="bottom.jsp" %> --%>
</html>